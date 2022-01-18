package com.ems.system.controller;

import com.ems.common.constant.VerifyCodeConstants;
import com.ems.common.exception.BadRequestException;
import com.ems.common.utils.JwtUtil;
import com.ems.common.utils.RedisUtil;
import com.ems.common.utils.ResultUtil;
import com.ems.common.utils.StringUtil;
import com.ems.config.security.JwtUser;
import com.ems.logs.annotation.Log;
import com.ems.system.entity.SysRole;
import com.ems.system.entity.SysUser;
import com.ems.system.entity.dto.UserDto;
import com.ems.system.service.SysRoleService;
import com.ems.system.service.SysUserService;
import com.wf.captcha.ArithmeticCaptcha;
import com.wf.captcha.base.Captcha;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.concurrent.TimeUnit;

/**
 * @program: ems-admin-mvc
 * @description: this is a class
 * @author: starao
 * @create: 2021-11-28 15:50
 **/
@RestController
@RequiredArgsConstructor
@RequestMapping("/auth")
public class LoginController extends ResultUtil {

    private final SysUserService userService;

    private final SysRoleService roleService;

    private final PasswordEncoder passwordEncoder;

    private final AuthenticationManagerBuilder authenticationManagerBuilder;

    private final RedisUtil redisUtil;

    @Log("用户登录")
    @PostMapping("/login")
    public ResponseEntity<Object> login(@RequestBody UserDto userDto, HttpServletRequest request){
        try {
            //  首页校验验证码
            verifyCode(userDto.getUuid(), userDto.getCode());
            //  根据用户名查询用户是否存在
            SysUser user = userService.findByName(userDto.getUsername());
            if (user == null){
                return fail(false, "用户名或密码错误");
            }
            //  判断密码是否正确
            UsernamePasswordAuthenticationToken authenticationToken =
                    new UsernamePasswordAuthenticationToken(userDto.getUsername(), userDto.getPassword());
            Authentication authentication = authenticationManagerBuilder.getObject().authenticate(authenticationToken);
            //  将认证信息设置到SpringSecurity上下文中
            SecurityContextHolder.getContext().setAuthentication(authentication);
            //  获取当前用户角色对象
            List<SysRole> sysRoles = roleService.getRoleByUserId(user.getId());
            //  角色
            List<String> roles = new ArrayList<>();
            sysRoles.forEach( sysRole -> {
                roles.add(sysRole.getRoleCode());
            });
            //  生成token
            String token = JwtUtil.generateToken(user.getUsername(), roles, false);

            //  用户信息
            userDto.setEmail(user.getEmail());
            userDto.setNickName(user.getNickName());
            userDto.setRoles(roles);
            //  隐藏密码
            userDto.setPassword("******");

            return success(true, new JwtUser(token, userDto));
        } catch (BadRequestException e) {
            e.printStackTrace();
            return fail(false, e.getMsg());
        } catch (Exception e){
            e.printStackTrace();
            return fail(false, e.getMessage());
        }
    }

    /**
     * @Description: 用户注册
     * @Param: [userDto]
     * @return: org.springframework.http.ResponseEntity<java.lang.Object>
     * @Author: starao
     * @Date: 2021/11/28
     */
    @Log("用户注册")
    @PostMapping("/register")
    public ResponseEntity<Object> registerUser(@RequestBody UserDto userDto){
        try {
            userService.editUser(userDto);
            return success(true, "注册成功");
        } catch (BadRequestException e) {
            e.printStackTrace();
            return fail(false, e.getMsg());
        }
    }
    
    /**
    * @Description: 获取验证码
    * @Param: []
    * @return: org.springframework.http.ResponseEntity<java.lang.Object>
    * @Author: starao
    * @Date: 2022/1/18
    */
    @GetMapping("/code")
    public ResponseEntity<Object> getVerifyCode(){
        // 获取运算的结果
        Captcha captcha = new ArithmeticCaptcha(VerifyCodeConstants.width, VerifyCodeConstants.height);;
        String uuid = UUID.randomUUID().toString().replace("-", "");
        //当验证码类型为 arithmetic时且长度 >= 2 时，captcha.text()的结果有几率为浮点型
        String captchaValue = captcha.text();
        if (captchaValue.contains(".")) {
            captchaValue = captchaValue.split("\\.")[0];
        }
        // 保存
        redisUtil.setValue(uuid, captchaValue, VerifyCodeConstants.expiration, TimeUnit.MINUTES);
        // 验证码信息
        Map<String, Object> imgResult = new HashMap<String, Object>(2) {{
            put("img", captcha.toBase64());
            put("uuid", uuid);
        }};
        return ResponseEntity.ok(imgResult);
    }

    private void verifyCode(String uuid, String code){
        if (StringUtil.isNotBlank(redisUtil.getValue(uuid)) && !redisUtil.getValue(uuid).equals(code)){
            throw new BadRequestException("验证码错误");
        }
    }
}

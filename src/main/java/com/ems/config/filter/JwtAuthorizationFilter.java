package com.ems.config.filter;

import com.ems.common.constant.SecurityConstants;
import com.ems.common.exception.BadRequestException;
import com.ems.common.utils.JwtUtil;
import com.ems.common.utils.RedisUtil;
import com.ems.common.utils.SecurityUtil;
import com.ems.common.utils.StringUtil;
import com.ems.config.config.RedisConfig;
import com.ems.system.entity.SysMenu;
import com.ems.system.service.SysMenuService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
import org.springframework.util.CollectionUtils;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.TimeUnit;

/**
 * @program: ems-admin-mvc
 * @description: this is a class
 * @author: starao
 * @create: 2021-11-28 11:21
 **/
public class JwtAuthorizationFilter extends BasicAuthenticationFilter {

    private final SysMenuService menuService;

    private final RedisUtil redisUtil;

    public JwtAuthorizationFilter(AuthenticationManager authenticationManager, SysMenuService sysMenuService, RedisUtil redisUtil) {
        super(authenticationManager);
        this.menuService = sysMenuService;
        this.redisUtil = redisUtil;
    }

    /**
    * @Description: 过滤用户请求
    * @Param: [request, response, filterChain]
    * @return: void
    * @Author: starao
    * @Date: 2021/11/28
    */
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        try {
            //  从request中获取token
            String token = this.getTokenFromHttpServletRequest(request);
            System.out.println("请求路径:" + request.getRequestURI());
            //  校验token是否有效
            if (StringUtil.isNotBlank(token) && JwtUtil.verifyToken(token)){
                //  获取认证信息
                Authentication authentication = JwtUtil.getAuthentication(token);
                //  将认证信息保存在spring安全上下文中
                SecurityContextHolder.getContext().setAuthentication(authentication);
                //  判断请求路径是否有效
//                if (!checkURI(request.getRequestURI())){
//                    throw new BadRequestException("没有访问权限");
//                }
                //  放行请求
                filterChain.doFilter(request, response);
            } else {
                response.sendRedirect(SecurityConstants.HTML_LOGIN_URL);
            }
        } catch (BadRequestException e) {
            //  token问题,统一跳转到401页面
            response.sendRedirect(SecurityConstants.HTML_401);
        }
    }

    /**
    * @Description: 从http中获取token
    * @Param: [request]
    * @return: java.lang.String
    * @Author: starao
    * @Date: 2021/11/28
    */
    private String getTokenFromHttpServletRequest(HttpServletRequest request){
        //  为了兼容接口与页面两种形式,该处获取token也有两种方式,
        //  html请求通过cookie获取token,接口通过Authorization获取token
        String authorization = request.getHeader(SecurityConstants.TOKEN_HEADER);
        if (StringUtils.isNotBlank(authorization) && authorization.startsWith(SecurityConstants.TOKEN_PREFIX)){
            return authorization.replace(SecurityConstants.TOKEN_PREFIX, "");
        }
        Cookie[] cookies = request.getCookies();
        //  同IP不同端口的cookie进行区分
        if (cookies != null && cookies.length > 0){
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("token") && cookie.getValue().startsWith(SecurityConstants.COOKIE_PREFIX)){
                    return cookie.getValue().replace(SecurityConstants.COOKIE_PREFIX, "");
                }
            }
        }
        return null;
    }

    /**
    * @Description: 校验请求路径是否可用
    * @Param: [url]
    * @return: boolean
    * @Author: starao
    * @Date: 2021/12/28
    */
    private boolean checkURI(String url){
        try {
            boolean b = false;
            List<String> menuList = new ArrayList<>();
            //  从redis中获取该用户的所有菜单权限
            Object object = redisUtil.getValue("menu");
            //  如果不存在就重新获取
            if (object == null){
                menuList = menuService.getMenuUrlByRole(SecurityUtil.getCurrentRoles());
                //  添加通过的无法添加权限的两个页面
                menuList.add("/main.html");
                menuList.add("/index.html");
                //   并将得到的菜单列表保存进redis中
                if (!CollectionUtils.isEmpty(menuList)){
                    redisUtil.setValue("menu", menuList.toString(), 7200L, TimeUnit.SECONDS);
                } else {
                    return false;
                }
            } else {
                menuList = Collections.singletonList(Objects.requireNonNull(redisUtil.getValue("menu")).toString());
            }

            if (menuList.contains(url)){
                b = true;
            }

            return b;
        } catch (BadRequestException e) {
            e.printStackTrace();
            throw new BadRequestException(e.getMsg());
        }
    }
}

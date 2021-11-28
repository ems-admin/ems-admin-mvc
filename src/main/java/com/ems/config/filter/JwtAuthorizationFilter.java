package com.ems.config.filter;

import com.ems.common.constant.SecurityConstants;
import com.ems.common.exception.BadRequestException;
import com.ems.common.utils.JwtUtil;
import com.ems.common.utils.SecurityUtil;
import com.ems.common.utils.StringUtil;
import com.ems.system.service.SysMenuService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @program: ems-admin-mvc
 * @description: this is a class
 * @author: starao
 * @create: 2021-11-28 11:21
 **/
public class JwtAuthorizationFilter extends BasicAuthenticationFilter {

    private final SysMenuService menuService;

    public JwtAuthorizationFilter(AuthenticationManager authenticationManager, SysMenuService sysMenuService) {
        super(authenticationManager);
        this.menuService = sysMenuService;
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
                //  获取当前用户的菜单权限
                List<String> menuList = menuService.getMenuUrlByRole(SecurityUtil.getCurrentRoles());
                //  将主页菜单添加进来,因为主页不在授权页面中
                menuList.add("/main.html");
                menuList.add("/index.html");
                if (!menuList.contains(request.getRequestURI()) && request.getRequestURI().endsWith(".html")){
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "没有访问权限");
                }
                //  放行请求
                filterChain.doFilter(request, response);
            } else {
                response.sendRedirect(SecurityConstants.HTML_LOGIN_URL);
            }
        } catch (BadRequestException e) {
            //  token问题,统一跳转到登录页面重新登录
            response.sendRedirect(SecurityConstants.HTML_LOGIN_URL);
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
}

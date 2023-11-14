package com.ems.config.filter;


import com.ems.common.constant.SecurityConstants;
import com.ems.common.utils.JwtUtil;
import com.ems.common.utils.StringUtil;
import jakarta.servlet.FilterChain;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.NonNull;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

/**
 * @program: ems-admin-boot
 * @description: this is a class
 * @author: starao
 * @create: 2021-11-27 13:15
 **/
@Component
public class JwtAuthorizationFilter extends OncePerRequestFilter {
    /**
    * @Description: 过滤用户请求
    * @Param: [request, response, filterChain]
    * @return: void
    * @Author: starao
    * @Date: 2021/11/27
    */
    @Override
    protected void doFilterInternal(@NonNull HttpServletRequest request, @NonNull HttpServletResponse response,
                                    @NonNull FilterChain filterChain) throws ServletException, IOException {
        try {
            String url = request.getRequestURI();
            System.out.println("请求路径:" + url);
            //  从request中获取token
            String token = this.getTokenFromHttpServletRequest(request);
            //  只要不是/api/开头的接口,则直接放行,然后由spring security进行判断是否有访问权限
            if (!url.startsWith("/api/")){
                //  放行请求
                filterChain.doFilter(request, response);
                return;
            }
            //  校验token是否有效
            if (JwtUtil.verifyToken(token)){
                //  获取认证信息
                Authentication authentication = JwtUtil.getAuthentication(token);
                //  将认证信息保存在spring安全上下文中
                SecurityContextHolder.getContext().setAuthentication(authentication);
                if (request.getRequestURI().startsWith("/api/")) {
                    // 修改请求路径，去除 "/api/" 前缀
                    String newRequestURI = request.getRequestURI().substring(4);
                    RequestDispatcher dispatcher = request.getRequestDispatcher(newRequestURI);
                    dispatcher.forward(request, response);
                } else {
                    //  放行请求
                    filterChain.doFilter(request, response);
                }
            } else {
                if (!response.isCommitted()){
                    response.setStatus(HttpStatus.UNAUTHORIZED.value());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            //  token问题,统一跳转到登录页面
            if (!response.isCommitted()){
                response.setStatus(HttpStatus.UNAUTHORIZED.value());
            }
        }
    }

    /**
    * @Description: 从http中获取token
    * @Param: [request]
    * @return: java.lang.String
    * @Author: starao
    * @Date: 2021/11/27
    */
    private String getTokenFromHttpServletRequest(HttpServletRequest request){
        //  通过Authorization获取token
        String authorization = request.getHeader(SecurityConstants.TOKEN_HEADER);
        if (StringUtils.isNotBlank(authorization) && authorization.startsWith(SecurityConstants.TOKEN_PREFIX)){
            return authorization.replace(SecurityConstants.TOKEN_PREFIX, "");
        }
        Cookie[] cookies = request.getCookies();
        //  同IP不同端口的cookie进行区分
        if (cookies != null){
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("token") && cookie.getValue().startsWith(SecurityConstants.COOKIE_PREFIX)){
                    return cookie.getValue().replace(SecurityConstants.COOKIE_PREFIX, "");
                }
            }
        }
        return null;
    }
}

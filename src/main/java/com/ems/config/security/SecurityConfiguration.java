package com.ems.config.security;

import com.ems.common.constant.SecurityConstants;
import com.ems.config.filter.JwtAuthorizationFilter;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.RegexRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.web.filter.CorsFilter;

import static org.springframework.security.config.http.SessionCreationPolicy.STATELESS;

/**
 * @program: ems-admin-boot
 * @description: this is a class
 * @author: starao
 * @create: 2021-11-27 13:40
 **/
@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfiguration {

    private final CorsFilter corsFilter;
    
    private final JwtAuthorizationFilter jwtAuthorizationFilter;

    /**
    * @Description: 配置SpringSecurity推荐的加密方式
    * @Param: []
    * @return: org.springframework.security.crypto.password.PasswordEncoder
    * @Author: starao
    * @Date: 2021/11/27
    */
    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    /**
    * @Description: 设置HttpSecurity的安全策略以及配置不进入SpringSecurity的名单
    * @Param: [webSecurity]
    * @return: void
    * @Author: starao
    * @Date: 2021/11/27
    */
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        //  获取所有html文件路径
        RequestMatcher htmlFiles = new RegexRequestMatcher(".+\\.html$", "");
        http.csrf(AbstractHttpConfigurer::disable)
                .headers(headers -> headers.frameOptions(HeadersConfigurer.FrameOptionsConfig::disable))
                .authorizeHttpRequests(request -> request
                        .requestMatchers(HttpMethod.GET, "/", "/favicon.ico", "/auth/code").permitAll()
                        .requestMatchers(HttpMethod.PUT, "/auth/refresh").permitAll()
                        .requestMatchers(HttpMethod.POST, "/auth/login").permitAll()
                        .requestMatchers("/static/**").permitAll()
                        //  放行所有的html文件
                        .requestMatchers(htmlFiles).permitAll()
                        .anyRequest().authenticated())
                .sessionManagement(manager -> manager.sessionCreationPolicy(STATELESS))
                //  配置跨域
                .addFilterBefore(corsFilter, UsernamePasswordAuthenticationFilter.class)
                //  将配置交由JWT
                .addFilterBefore(jwtAuthorizationFilter, UsernamePasswordAuthenticationFilter.class);
        return http.build();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

}

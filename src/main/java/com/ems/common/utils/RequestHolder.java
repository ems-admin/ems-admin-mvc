package com.ems.common.utils;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Objects;

/**
 * @program: ems-admin-mvc
 * @description: this is a class
 * @author: starao
 * @create: 2021-11-28 11:12
 **/
public class RequestHolder {

    /**
    * @Description: 获取httpRequest
    * @Param: []
    * @return: javax.servlet.http.HttpServletRequest
    * @Author: starao
    * @Date: 2021/11/28
    */
    public static HttpServletRequest getHttpServletRequest() {
        return ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
    }
}

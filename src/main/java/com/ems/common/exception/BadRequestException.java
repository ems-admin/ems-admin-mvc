package com.ems.common.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

import static org.springframework.http.HttpStatus.BAD_REQUEST;

/**
 * @program: ems-admin-mvc
 * @description: this is a class
 * @author: starao
 * @create: 2021-11-28 11:09
 **/
@Getter
public class BadRequestException extends RuntimeException{

    /**
     * 定义统一的错误代码，方便前端处理
     */
    private Integer status = BAD_REQUEST.value();

    private String msg;

    public BadRequestException(String msg){
        this.msg = msg;
    }

    public BadRequestException(HttpStatus status, String msg){
        this.msg = msg;
        this.status = status.value();
    }
}

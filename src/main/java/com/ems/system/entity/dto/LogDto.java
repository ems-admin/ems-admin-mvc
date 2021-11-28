package com.ems.system.entity.dto;

import lombok.Getter;
import lombok.Setter;

/**
 * @program: ems-admin-mvc
 * @description: this is a class
 * @author: starao
 * @create: 2021-11-28 15:22
 **/
@Setter
@Getter
public class LogDto {

    private String username;

    private String logType;

    private String description;

    private long current;

    private long size;
}

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
public class MenuDto {

    private Long id;

    private String title;

    private String url;

    private Long parentId;

    private int sort;

    private String type;
}

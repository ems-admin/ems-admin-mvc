package com.ems.system.entity.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Set;

/**
 * @program: ems-admin-mvc
 * @description: this is a class
 * @author: starao
 * @create: 2021-11-28 15:23
 **/
@Setter
@Getter
public class RoleMenuDto {

    private Long roleId;

    private Set<Long> menuIds;
}

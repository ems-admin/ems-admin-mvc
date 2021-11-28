package com.ems.system.service;

import com.ems.system.entity.SysRoleUser;

import java.util.List;

/**
 * @program: ems-admin-mvc
 * @description: this is a interface
 * @author: starao
 * @create: 2021-11-28 15:30
 **/
public interface SysRoleUserService {

    /**
     * @Description: 通过角色ID查询绑定的用户
     * @Param: [roleId]
     * @return: java.util.List<com.ems.system.entity.SysRoleUser>
     * @Author: starao
     * @Date: 2021/11/28
     */
    List<SysRoleUser> getRoleUserByRoleId(Long roleId);

    /**
     * @Description: 修改用户角色
     * @Param: [userId, roles]
     * @return: void
     * @Author: starao
     * @Date: 2021/11/28
     */
    void edit(Long userId, List<String> roles);

    /**
     * @Description: 查询当前用户角色
     * @Param: [userId]
     * @return: java.util.List<com.ems.system.entity.SysRoleUser>
     * @Author: starao
     * @Date: 2021/11/28
     */
    List<SysRoleUser> getRoleUserByUserId(Long userId);

    /**
     * @Description: 删除用户与角色的绑定
     * @Param: [userId]
     * @return: void
     * @Author: starao
     * @Date: 2021/11/28
     */
    void deleteByUserId(String userId);
}

package com.ems.system.service;

import com.ems.system.entity.SysUser;
import com.ems.system.entity.dto.UserDto;

import java.util.List;

/**
 * @program: ems-admin-mvc
 * @description: this is a interface
 * @author: starao
 * @create: 2021-11-28 15:30
 **/
public interface SysUserService {

    /**
     * @Description: 根据用户名查询用户
     * @Param: [userName]
     * @return: com.ems.system.entity.SysUser
     * @Author: starao
     * @Date: 2021/11/28
     */
    SysUser findByName(String userName);

    /**
     * @Description: 编辑用户
     * @Param: [userDto]
     * @return: void
     * @Author: starao
     * @Date: 2021/11/28
     */
    void editUser(UserDto userDto);

    /**
     * @Description: 查询用户列表
     * @Param: [blurry]
     * @return: java.util.List<com.ems.system.entity.SysUser>
     * @Author: starao
     * @Date: 2021/11/28
     */
    List<SysUser> queryUserTable(String blurry);

    /**
     * @Description: 根据用户名查询用户
     * @Param: [username]
     * @return: com.ems.system.entity.dto.UserDto
     * @Author: starao
     * @Date: 2021/11/28
     */
    UserDto loadByName(String username);

    /**
     * @Description: 删除用户
     * @Param: [id]
     * @return: void
     * @Author: starao
     * @Date: 2021/11/28
     */
    void delUser(String id);

    /**
     * @Description: 修改用户状态
     * @Param: [sysUser]
     * @return: void
     * @Author: starao
     * @Date: 2021/11/28
     */
    void enabledUser(SysUser sysUser);
}

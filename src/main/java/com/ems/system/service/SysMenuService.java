package com.ems.system.service;

import com.alibaba.fastjson.JSONArray;
import com.ems.system.entity.SysMenu;

import java.util.List;

/**
 * @program: ems-admin-mvc
 * @description: this is a interface
 * @author: starao
 * @create: 2021-11-28 15:28
 **/
public interface SysMenuService {

    /**
     * @Description: 获取菜单树
     * @Param: [roles]
     * @return: com.alibaba.fastjson.JSONArray
     * @Author: starao
     * @Date: 2021/11/28
     */
    JSONArray getMenuTree(List<String> roles);

    /**
     * @Description: 获取菜单table树
     * @Param: [blurry]
     * @return: java.util.List<com.ems.system.entity.SysMenu>
     * @Author: starao
     * @Date: 2021/11/28
     */
    List<SysMenu> getMenuTableTree(String blurry);

    /**
     * @Description: 获取下拉框里面的树
     * @Param: [type]
     * @return: com.alibaba.fastjson.JSONArray
     * @Author: starao
     * @Date: 2021/11/28
     */
    JSONArray getMenuSelectTree(String type);

    /**
     * @Description: 编辑菜单
     * @Param: [sysMenu]
     * @return: void
     * @Author: starao
     * @Date: 2021/11/28
     */
    void editMenu(SysMenu sysMenu);

    /**
     * @Description: 删除菜单
     * @Param: [id]
     * @return: void
     * @Author: starao
     * @Date: 2021/11/28
     */
    void delMenu(Long id);

    /**
     * @Description: 获取角色菜单树
     * @Param: [roleId]
     * @return: com.alibaba.fastjson.JSONArray
     * @Author: starao
     * @Date: 2021/11/28
     */
    JSONArray getMenuTreeByRoleId(String roleId);

    /**
     * @Description: 查询当前用户所有权限菜单
     * @Param: [roles]
     * @return: java.util.List<com.ems.system.entity.SysMenu>
     * @Author: starao
     * @Date: 2021/11/28
     */
    List<SysMenu> queryAllMenus(List<String> roles);

    /**
    * @Description: 通过角色获取url
    * @Param: [roles]
    * @return: java.util.List<java.lang.String>
    * @Author: starao
    * @Date: 2021/11/28
    */
    List<String> getMenuUrlByRole(List<String> roles);
}

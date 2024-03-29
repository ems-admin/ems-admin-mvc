package com.ems.system.controller;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.ems.common.exception.BadRequestException;
import com.ems.common.utils.ResultUtil;
import com.ems.common.utils.SecurityUtil;
import com.ems.logs.annotation.Log;
import com.ems.system.entity.SysMenu;
import com.ems.system.service.SysMenuService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @program: ems-admin-mvc
 * @description: this is a class
 * @author: starao
 * @create: 2021-11-28 15:52
 **/
@RestController
@RequiredArgsConstructor
@RequestMapping("/sys")
public class SysMenuController extends ResultUtil {

    private final SysMenuService menuService;

    /**
     * @Description: 获取菜单树
     * @Param: []
     * @return: org.springframework.http.ResponseEntity<java.lang.Object>
     * @Author: starao
     * @Date: 2021/11/28
     */
    @Log("获取菜单树")
    @GetMapping("/menu/tree")
    public ResponseEntity<Object> getMenuTree(){
        try {
            List<String> roles = SecurityUtil.getCurrentRoles();
            JSONArray jsonArray = menuService.getMenuTree(roles);
            //  获取按钮权限列表
            List<String> btnList = menuService.btnList(roles);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("menu", jsonArray);
            jsonObject.put("btn", btnList);
            return success(true, jsonObject);
        } catch (BadRequestException e) {
            e.printStackTrace();
            return fail(false, e.getMsg());
        }
    }

    /**
     * @Description: 查询当前用户所有权限菜单
     * @Param: []
     * @return: org.springframework.http.ResponseEntity<java.lang.Object>
     * @Author: starao
     * @Date: 2021/11/28
     */
    @GetMapping("/menu/all")
    public ResponseEntity<Object> queryAllMenus(){
        try {
            List<String> roles = SecurityUtil.getCurrentRoles();
            return success(true, menuService.queryAllMenus(roles));
        } catch (BadRequestException e) {
            e.printStackTrace();
            return fail(false, e.getMsg());
        }
    }

    /**
     * @Description: 获取菜单table树
     * @Param: [blurry]
     * @return: org.springframework.http.ResponseEntity<java.lang.Object>
     * @Author: starao
     * @Date: 2021/11/28
     */
    @Log("获取菜单的table树")
    @GetMapping("/menu/table/tree")
    public ResponseEntity<Object> getMenuTableTree(String blurry){
        try {
            return success(true, menuService.getMenuTableTree(blurry));
        } catch (BadRequestException e) {
            e.printStackTrace();
            return fail(false, e.getMsg());
        }
    }

    /**
     * @Description: 获取下拉框里面的树
     * @Param: [type]
     * @return: org.springframework.http.ResponseEntity<java.lang.Object>
     * @Author: starao
     * @Date: 2021/11/28
     */
    @Log("获取下拉框里面的树")
    @GetMapping("/menu/select/tree")
    public ResponseEntity<Object> getMenuSelectTree(String type){
        try {
            return success(true, menuService.getMenuSelectTree(type));
        } catch (BadRequestException e) {
            e.printStackTrace();
            return fail(false, e.getMsg());
        }
    }

    /**
     * @Description: 编辑菜单
     * @Param: [sysMenu]
     * @return: org.springframework.http.ResponseEntity<java.lang.Object>
     * @Author: starao
     * @Date: 2021/11/28
     */
    @Log("编辑菜单")
    @PostMapping("/menu/edit")
    public ResponseEntity<Object> editMenu(@RequestBody SysMenu sysMenu){
        try {
            menuService.editMenu(sysMenu);
            return success(true, sysMenu.getId() == null ? "添加成功" : "修改成功");
        } catch (BadRequestException e) {
            e.printStackTrace();
            return fail(false, e.getMsg());
        }
    }

    /**
     * @Description: 删除菜单
     * @Param: [id]
     * @return: org.springframework.http.ResponseEntity<java.lang.Object>
     * @Author: starao
     * @Date: 2021/11/28
     */
    @Log("删除菜单")
    @DeleteMapping("/menu/del")
    public ResponseEntity<Object> delMenu(Long id){
        try {
            menuService.delMenu(id);
            return success(true, "删除成功");
        } catch (BadRequestException e) {
            e.printStackTrace();
            return fail(false, e.getMsg());
        }
    }

    /**
     * @Description: 获取角色菜单树
     * @Param: [roleId]
     * @return: org.springframework.http.ResponseEntity<java.lang.Object>
     * @Author: starao
     * @Date: 2021/11/28
     */
    @Log("获取角色菜单树")
    @GetMapping("/menu/role/tree")
    public ResponseEntity<Object> getMenuTreeByRoleId(String roleId){
        try {
            return success(true, menuService.getMenuTreeByRoleId(roleId));
        } catch (BadRequestException e) {
            e.printStackTrace();
            return fail(false, e.getMsg());
        }
    }
}

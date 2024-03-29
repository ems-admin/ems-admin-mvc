package com.ems.system.service.impl;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ems.common.constant.CommonConstants;
import com.ems.common.exception.BadRequestException;
import com.ems.system.entity.SysMenu;
import com.ems.system.entity.SysRoleMenu;
import com.ems.system.mapper.SysMenuMapper;
import com.ems.system.mapper.SysRoleMenuMapper;
import com.ems.system.service.SysMenuService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @program: ems-admin-mvc
 * @description: this is a class
 * @author: starao
 * @create: 2021-11-28 15:32
 **/
@Service
@RequiredArgsConstructor
public class SysMenuServiceImpl implements SysMenuService {

    private final SysMenuMapper menuMapper;

    private final SysRoleMenuMapper roleMenuMapper;

    /**
     * @param roles
     * @Description: 获取菜单树
     * @Param: [roles]
     * @return: com.alibaba.fastjson.JSONArray
     * @Author: starao
     * @Date: 2021/11/28
     */
    @Override
    public JSONArray getMenuTree(List<String> roles) {
        try {
            List<SysMenu> menuListAll;
            //  如果角色中包含admin,则直接查询所有菜单
            if (roles.contains(CommonConstants.ROLE_ADMIN)){
                LambdaQueryWrapper<SysMenu> wrapper = new LambdaQueryWrapper<>();
                //  左侧菜单树不展示按钮类型
                wrapper.ne(SysMenu::getType, "3");
                wrapper.orderByAsc(SysMenu::getSort);
                menuListAll = menuMapper.selectList(wrapper);
            } else {
                menuListAll = menuMapper.getMenuTree(roles);
                if (!CollectionUtils.isEmpty(menuListAll)){
                    Set<SysMenu> menuSet = new HashSet<>();
                    for (SysMenu sysMenu : menuListAll) {
                        menuSet.addAll(getAllMenusByChildId(sysMenu.getId()));
                    }
                    menuListAll = new ArrayList<>(menuSet).stream().sorted(Comparator.comparing(SysMenu::getSort)).collect(Collectors.toList());
                }
            }
            menuListAll = menuListAll.stream().filter((item) -> !item.getType().equals("3")).collect(Collectors.toList());
            return getObjects(menuListAll, 0l, "title", null);
        } catch (BadRequestException e) {
            e.printStackTrace();
            throw new BadRequestException(e.getMsg());
        }
    }

    /**
     * @param blurry
     * @Description: 获取菜单table树
     * @Param: [blurry]
     * @return: java.util.List<com.ems.system.entity.SysMenu>
     * @Author: starao
     * @Date: 2021/11/28
     */
    @Override
    public List<SysMenu> getMenuTableTree(String blurry) {
        try {
            LambdaQueryWrapper<SysMenu> wrapper = new LambdaQueryWrapper<>();
            if (StringUtils.isNotBlank(blurry)){
                wrapper.like(SysMenu::getName, blurry);
            }
            wrapper.orderByAsc(SysMenu::getSort);
            return menuMapper.selectList(wrapper);
        } catch (BadRequestException e) {
            e.printStackTrace();
            throw new BadRequestException(e.getMsg());
        }
    }

    /**
     * @param type
     * @Description: 获取下拉框里面的树
     * @Param: [type]
     * @return: com.alibaba.fastjson.JSONArray
     * @Author: starao
     * @Date: 2021/11/28
     */
    @Override
    public JSONArray getMenuSelectTree(String type) {
        try {
            QueryWrapper<SysMenu> wrapper = new QueryWrapper<>();
            if (StringUtils.isNotBlank(type)){
                wrapper.eq("type", type);
            }
            List<SysMenu> menuList = menuMapper.selectList(wrapper);
            JSONArray jsonArray = new JSONArray();
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id", "0");
            jsonObject.put("name", "顶级目录");
            jsonObject.put("open", true);
            jsonObject.put("checked", false);
            jsonObject.put("children", getObjects(menuList, 0l,  "name", null));
            jsonArray.add(0, jsonObject);
            return jsonArray;
        } catch (BadRequestException e) {
            e.printStackTrace();
            throw new BadRequestException(e.getMsg());
        }
    }

    /**
     * @param sysMenu
     * @Description: 编辑菜单
     * @Param: [sysMenu]
     * @return: void
     * @Author: starao
     * @Date: 2021/11/28
     */
    @Override
    public void editMenu(SysMenu sysMenu) {
        try {
            if (sysMenu.getId() != null){
                menuMapper.updateById(sysMenu);
            } else {
                menuMapper.insert(sysMenu);
            }
        } catch (BadRequestException e) {
            e.printStackTrace();
            throw new BadRequestException(e.getMsg());
        }
    }

    /**
     * @param id
     * @Description: 删除菜单
     * @Param: [id]
     * @return: void
     * @Author: starao
     * @Date: 2021/11/28
     */
    @Override
    public void delMenu(Long id) {
        try {
            LambdaQueryWrapper<SysMenu> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(SysMenu::getId, id);
            wrapper.or();
            wrapper.eq(SysMenu::getParentId, id);
            List<SysMenu> list = menuMapper.selectList(wrapper);
            if (!CollectionUtils.isEmpty(list)){
                list.forEach(sysMenu -> {
                    //  校验是否绑定了角色
                    checkMenuRole(sysMenu.getId());
                });
            }
            menuMapper.deleteById(id);
        } catch (BadRequestException e) {
            e.printStackTrace();
            throw new BadRequestException(e.getMsg());
        }
    }

    /**
     * @param roleId
     * @Description: 获取角色菜单树
     * @Param: [roleId]
     * @return: com.alibaba.fastjson.JSONArray
     * @Author: starao
     * @Date: 2021/11/28
     */
    @Override
    public JSONArray getMenuTreeByRoleId(String roleId) {
        try {
            //  当前角色菜单
            List<Long> menuList = menuMapper.getMenuTreeByRoleId(roleId);
            //  所有菜单
            List<SysMenu> allMenuList = menuMapper.selectList(null);
            return getObjects(allMenuList, 0l, "title", menuList);
        } catch (BadRequestException e) {
            e.printStackTrace();
            throw new BadRequestException(e.getMsg());
        }
    }

    /**
     * @param roles
     * @Description: 查询当前用户所有权限菜单
     * @Param: [roles]
     * @return: java.util.List<com.ems.system.entity.SysMenu>
     * @Author: starao
     * @Date: 2021/11/28
     */
    @Override
    public List<SysMenu> queryAllMenus(List<String> roles) {
        try {
            if (roles.contains(CommonConstants.ROLE_ADMIN)){
                return menuMapper.selectList(null);
            } else {
                return menuMapper.getMenuTree(roles);
            }
        } catch (BadRequestException e) {
            e.printStackTrace();
            throw new BadRequestException(e.getMsg());
        }
    }

    /**
     * @param roles
     * @Description: 通过角色获取url
     * @Param: [roles]
     * @return: java.util.List<java.lang.String>
     * @Author: starao
     * @Date: 2021/11/28
     */
    @Override
    public List<String> getMenuUrlByRole(List<String> roles) {
        try {
            if (roles.contains(CommonConstants.ROLE_ADMIN)){
                LambdaQueryWrapper<SysMenu> wrapper = new LambdaQueryWrapper<>();
                wrapper.isNotNull(SysMenu::getPath);
                List<SysMenu> menuList = menuMapper.selectList(wrapper);
                List<String> urls = new ArrayList<>();
                for (SysMenu menu : menuList) {
                    urls.add(menu.getPath());
                }
                return urls;
            } else {
                return menuMapper.getMenuUrlByRole(roles);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new BadRequestException(e.getMessage());
        }
    }

    /**
     * @param roles
     * @Description: 获取按钮权限列表
     * @Param: [roles]
     * @return: java.util.List<java.lang.String>
     * @Author: starao
     * @Date: 2022/1/15
     */
    @Override
    public List<String> btnList(List<String> roles) {
        List<SysMenu> menuList;
        //  如果是管理员，直接取所有
        if (roles.contains(CommonConstants.ROLE_ADMIN)){
            LambdaQueryWrapper<SysMenu> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(SysMenu::getType, "3");
            menuList = menuMapper.selectList(wrapper);
        } else {
            menuList = menuMapper.getMenuTree(roles);
            menuList = menuList.stream().filter((item) -> "3".equals(item.getType())).collect(Collectors.toList());
        }
        return menuList.stream().map(p -> p.getPermission()).collect(Collectors.toList());
    }

    /**
     * @Description: 获取子菜单
     * @Param: [menuListAll, id, title, menuIds]
     * @return: com.alibaba.fastjson.JSONArray
     * @Author: starao
     * @Date: 2021/11/28
     */
    public JSONArray getChildMenu(List<SysMenu> menuListAll, Long id, String title, List<Long> menuIds){
        try {
            return getObjects(menuListAll, id, title, menuIds);
        } catch (BadRequestException e) {
            e.printStackTrace();
            throw new BadRequestException(e.getMsg());
        }
    }

    /**
     * @Description: 组装树的公共方法
     * @Param: [menuListAll, id, title, menuIds]
     * @return: com.alibaba.fastjson.JSONArray
     * @Author: starao
     * @Date: 2021/11/28
     */
    private JSONArray getObjects(List<SysMenu> menuListAll, Long id, String title, List<Long> menuIds) {
        try {
            //  获取子菜单
            List<SysMenu> childList = menuListAll.stream().filter(menu -> menu.getParentId().longValue() == id.longValue()).collect(Collectors.toList());
            //  组装树
            JSONArray jsonArray = new JSONArray();
            childList.forEach(menu -> {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("id", menu.getId());
                jsonObject.put(title, menu.getName());
                if ("title".equals(title)){
                    jsonObject.put("parentId", menu.getParentId());
                    jsonObject.put("path", menu.getPath());
                    jsonObject.put("label", menu.getName());
                    jsonObject.put("type", menu.getType());
                    jsonObject.put("sort", menu.getSort());
                    if (!CollectionUtils.isEmpty(menuIds) && menuIds.contains(menu.getId())){
                        jsonObject.put("checked", true);
                    }
                } else if ("name".equals(title)){
                    jsonObject.put("open", false);
                    jsonObject.put("checked", false);
                }
                if (menuListAll.stream().anyMatch(menu1 -> menu1.getParentId().longValue() == id.longValue())) {
                    jsonObject.put("children", getChildMenu(menuListAll, menu.getId(), title, menuIds));
                }
                jsonArray.add(jsonObject);
            });
            return jsonArray;
        } catch (BadRequestException e) {
            e.printStackTrace();
            throw new BadRequestException(e.getMsg());
        }
    }

    /**
     * @Description: 校验是否绑定了角色
     * @Param: [menuId]
     * @return: void
     * @Author: starao
     * @Date: 2021/12/4
     */
    private void checkMenuRole(Long menuId){
        try {
            LambdaQueryWrapper<SysRoleMenu> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(SysRoleMenu::getMenuId, menuId);
            long count = roleMenuMapper.selectCount(wrapper);
            if (count > 0){
                throw new BadRequestException("菜单或子菜单已绑定角色，无法删除");
            }
        } catch (BadRequestException e) {
            e.printStackTrace();
            throw new BadRequestException(e.getMsg());
        }
    }

    /**
    * @Description: 通过菜单Id获取所有上级菜单
    * @Param: [menuId]
    * @return: java.util.List<com.ems.system.entity.SysMenu>
    * @Author: starao
    * @Date: 2021/12/18
    */
    private List<SysMenu> getAllMenusByChildId(Long menuId){
        try {
            return menuMapper.getAllMenusByChildId(menuId);
        } catch (BadRequestException e) {
            e.printStackTrace();
            throw new BadRequestException(e.getMsg());
        }
    }
}

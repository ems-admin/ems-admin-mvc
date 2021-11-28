package com.ems.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ems.system.entity.SysUser;
import com.ems.system.entity.dto.UserDto;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * @program: ems-admin-mvc
 * @description: this is a interface
 * @author: starao
 * @create: 2021-11-28 15:27
 **/
@Repository
public interface SysUserMapper extends BaseMapper<SysUser> {

    /**
    * @Description: 通过用户名获取用户对象
    * @Param: [username]
    * @return: com.ems.system.entity.dto.UserDto
    * @Author: starao
    * @Date: 2021/11/28
    */
    UserDto loadByName(@Param("username") String username);
}

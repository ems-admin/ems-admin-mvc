package com.ems.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ems.system.entity.SysLog;
import com.ems.system.entity.dto.LogDto;
import org.aspectj.lang.ProceedingJoinPoint;

/**
 * @program: ems-admin-mvc
 * @description: this is a interface
 * @author: starao
 * @create: 2021-11-28 15:27
 **/
public interface SysLogService {

    /**
     * @Description: 保存日志
     * @Param: [username, ip, joinPoint, sysLog]
     * @return: void
     * @Author: starao
     * @Date: 2021/11/28
     */
    void save(String username, String ip, ProceedingJoinPoint joinPoint, SysLog sysLog);

    /**
     * @Description: 查询日志列表
     * @Param: [logDto]
     * @return: com.baomidou.mybatisplus.core.metadata.IPage<com.ems.system.entity.SysLog>
     * @Author: starao
     * @Date: 2021/11/28
     */
    IPage<SysLog> getLogList(LogDto logDto);
}

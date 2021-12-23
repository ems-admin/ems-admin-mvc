package com.ems.system.controller;

import com.ems.common.exception.BadRequestException;
import com.ems.common.utils.ResultUtil;
import com.ems.system.entity.dto.LogDto;
import com.ems.system.service.SysLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: ems-admin-mvc
 * @description: this is a class
 * @author: starao
 * @create: 2021-11-28 15:52
 **/
@RestController
@RequiredArgsConstructor
@RequestMapping("/sys")
public class SysLogController extends ResultUtil {

    private final SysLogService logService;

    /**
     * @Description: 查询日志列表
     * @Param: [logDto]
     * @return: org.springframework.http.ResponseEntity<java.lang.Object>
     * @Author: starao
     * @Date: 2021/11/28
     */
    @GetMapping("/log/list")
    public ResponseEntity<Object> getLogList(LogDto logDto){
        try {
            return success(true, logService.getLogList(logDto));
        } catch (BadRequestException e) {
            e.printStackTrace();
            return fail(false, e.getMsg());
        } catch (Exception e){
            e.printStackTrace();
            return fail(false, e.getMessage());
        }
    }
}

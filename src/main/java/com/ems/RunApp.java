package com.ems;

import com.ems.common.utils.SpringContextHolder;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @program: ems-admin-mvc
 * @description: this is a class
 * @author: starao
 * @create: 2021-11-28 15:38
 **/
@EnableTransactionManagement
@SpringBootApplication
public class RunApp {

    public static void main(String[] args) {
        SpringApplication.run(RunApp.class, args);
    }

    /**
     * @Description: 注册spring上下文对象
     * @Param: []
     * @return: com.ems.common.utils.SpringContextHolder
     * @Author: starao
     * @Date: 2021/11/28
     */
    @Bean
    public SpringContextHolder springContextHolder(){
        return new SpringContextHolder();
    }
}

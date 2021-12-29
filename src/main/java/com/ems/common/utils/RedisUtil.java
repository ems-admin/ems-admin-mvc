package com.ems.common.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.Objects;
import java.util.concurrent.TimeUnit;

/**
 * @program: ems-admin-mvc
 * @description: this is a class
 * @author: starao
 * @create: 2021-12-28 22:34
 **/
@Component
public final class RedisUtil {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    /**
    * @Description: 保存值
    * @Param: [key, value, time, timeUnit]
    * @return: void
    * @Author: starao
    * @Date: 2021/12/28
    */
    public void setValue(String key, Object value, Long time, TimeUnit timeUnit){
        redisTemplate.opsForValue().set(key, value, time, timeUnit);
    }

    /**
    * @Description: 获取值
    * @Param: [key]
    * @return: java.lang.String
    * @Author: starao
    * @Date: 2021/12/28
    */
    public String getValue(String key){
        Object object = redisTemplate.opsForValue().get(key);
        if (object == null){
            return null;
        } else {
            return object.toString();
        }

    }

}

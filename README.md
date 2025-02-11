# ems-admin-boot

#### 介绍
ems-admin(easy manage system)是一套极简的后台管理系统，
基于SpringBoot3.4.1、SpringSecurity6.x、Mybatis-plus3.5.9、Mysql8.0、
JWT、Vue3.0、Layui2.8.18开发，
只提供最基础的登录、权限管理功能与日志功能，所有的业务功能，
都可以根据自己的需要在此之上构建。

ems-admin-mvc是ems-admin的单体SpringBoot版本，前后端未分离，前端基于Layui+vue进行混合开发


[![AUR](https://img.shields.io/badge/license-Apache%20License%202.0-blue.svg)](https://github.com/ems-admin/ems-admin-mvc/blob/master/LICENSE)
[![star](https://gitee.com/ems-admin/ems-admin-mvc/badge/star.svg?theme=white)](https://gitee.com/ems-admin/ems-admin-mvc)
[![GitHub stars](https://img.shields.io/github/stars/ems-admin/ems-admin-mvc.svg?style=social&label=Stars)](https://github.com/ems-admin/ems-admin-mvc)
[![GitHub forks](https://img.shields.io/github/forks/ems-admin/ems-admin-mvc.svg?style=social&label=Fork)](https://github.com/ems-admin/ems-admin-mvc)

[ems-admin-mvc演示站点](http://ems-admin-mvc.facebook47.cn/)

#### 支持功能

-  登录
   - 账号/密码 admin/123456

   
-  用户管理
   - 添加、编辑、删除、停用/启用、查询
   
   
-  菜单管理
   - 添加、编辑、删除、查询

   
-  角色管理
   - 添加、编辑、删除、授权、查询

   
-  日志管理
   - 查询


#### 交流反馈


- [issues 问题反馈](https://github.com/ems-admin/ems-admin-mvc/issues)
  (为方便管理，暂时只接受在github上面提交issues)


- [更新日志](CHANGELOG.md)


#### 必应壁纸

-  如何对必应壁纸感兴趣，可以访问   [必应壁纸](https://bing.fullpx.com)


#### 软件架构

- 登录和访问控制通过SpringSecurity 和 JWT来完成


- 用户的访问权限，通过用户-角色-权限的方式进行绑定


#### 后续计划

- 提供验证码功能


- 提供token自动续租功能


- 优化权限的细粒度，目前是通过请求路径进行了校验，还没有精确到按钮


#### 已知问题

- 期待反馈




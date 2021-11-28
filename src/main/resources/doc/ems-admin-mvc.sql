/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : localhost:3306
 Source Schema         : ems-admin-mvc

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 28/11/2021 22:52:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_german2_ci;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
BEGIN;
INSERT INTO `hibernate_sequence` VALUES (23);
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `log_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL COMMENT '日志类型（1正常 2错误）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL COMMENT '请求方式',
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL COMMENT '请求参数',
  `time` bigint DEFAULT NULL COMMENT '耗时（毫秒）',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL COMMENT 'IP',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL COMMENT '请求用户名',
  `exception_detail` text CHARACTER SET utf8 COLLATE utf8_german2_ci COMMENT '错误信息详情',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_german2_ci;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES (1, '1', 'com.ems.system.controller.LoginController.login()', '{com.ems.system.entity.dto.UserDto@5a482df3 FirewalledRequest[ org.apache.catalina.connector.RequestFacade@1aa04803]  }', 554, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 20:49:28', '用户登录');
INSERT INTO `sys_log` VALUES (2, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 12, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 20:49:28', '获取菜单树');
INSERT INTO `sys_log` VALUES (3, '1', 'com.ems.system.controller.SysUserController.queryUserTable()', '{null  }', 7, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 20:49:31', '查询用户列表');
INSERT INTO `sys_log` VALUES (4, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 9, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 20:53:11', '获取菜单树');
INSERT INTO `sys_log` VALUES (5, '1', 'com.ems.system.controller.SysUserController.queryUserTable()', '{null  }', 3, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 20:53:13', '查询用户列表');
INSERT INTO `sys_log` VALUES (6, '1', 'com.ems.system.controller.SysMenuController.getMenuTableTree()', '{null  }', 5, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 20:53:16', '获取菜单的table树');
INSERT INTO `sys_log` VALUES (7, '1', 'com.ems.system.controller.SysRoleController.getRoleList()', '{  }', 6, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 20:53:19', '获取角色列表');
INSERT INTO `sys_log` VALUES (8, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 236, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 21:12:37', '获取菜单树');
INSERT INTO `sys_log` VALUES (9, '1', 'com.ems.system.controller.SysUserController.queryUserTable()', '{null  }', 18, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 21:12:39', '查询用户列表');
INSERT INTO `sys_log` VALUES (10, '1', 'com.ems.system.controller.SysMenuController.getMenuTableTree()', '{null  }', 6, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 21:12:41', '获取菜单的table树');
INSERT INTO `sys_log` VALUES (11, '1', 'com.ems.system.controller.SysRoleController.getRoleList()', '{  }', 8, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 21:12:42', '获取角色列表');
INSERT INTO `sys_log` VALUES (12, '1', 'com.ems.system.controller.SysRoleController.getAllRoleForXm()', '{null  }', 19, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 21:12:51', '获取角色选择框列表');
INSERT INTO `sys_log` VALUES (13, '1', 'com.ems.system.controller.SysUserController.editUser()', '{com.ems.system.entity.dto.UserDto@62b92670  }', 93, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 21:13:05', '编辑用户');
INSERT INTO `sys_log` VALUES (14, '1', 'com.ems.system.controller.SysUserController.queryUserTable()', '{null  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 21:13:05', '查询用户列表');
INSERT INTO `sys_log` VALUES (15, '1', 'com.ems.system.controller.SysRoleController.getAllRoleForXm()', '{null  }', 6, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 21:13:07', '获取角色选择框列表');
INSERT INTO `sys_log` VALUES (16, '1', 'com.ems.system.controller.SysUserController.editUser()', '{com.ems.system.entity.dto.UserDto@5dbe8b1c  }', 79, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 21:13:19', '编辑用户');
INSERT INTO `sys_log` VALUES (17, '1', 'com.ems.system.controller.SysUserController.queryUserTable()', '{null  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 21:13:19', '查询用户列表');
INSERT INTO `sys_log` VALUES (18, '1', 'com.ems.system.controller.SysUserController.delUser()', '{3  }', 13, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 21:13:23', '删除用户');
INSERT INTO `sys_log` VALUES (19, '1', 'com.ems.system.controller.SysUserController.queryUserTable()', '{null  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-27 21:13:23', '查询用户列表');
INSERT INTO `sys_log` VALUES (20, '1', 'com.ems.system.controller.LoginController.login()', '{com.ems.system.entity.dto.UserDto@64083466 FirewalledRequest[ org.apache.catalina.connector.RequestFacade@4ac9dc9e]  }', 507, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 17:50:38', '用户登录');
INSERT INTO `sys_log` VALUES (21, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 18, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 17:50:39', '获取菜单树');
INSERT INTO `sys_log` VALUES (22, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 49, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 17:52:38', '获取菜单树');
INSERT INTO `sys_log` VALUES (23, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 45, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 17:54:53', '获取菜单树');
INSERT INTO `sys_log` VALUES (24, '1', 'com.ems.system.controller.SysMenuController.getMenuTableTree()', '{  }', 16, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 17:54:55', '获取菜单的table树');
INSERT INTO `sys_log` VALUES (25, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 89, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 17:55:44', '获取菜单树');
INSERT INTO `sys_log` VALUES (26, '1', 'com.ems.system.controller.SysMenuController.getMenuTableTree()', '{  }', 16, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 17:55:46', '获取菜单的table树');
INSERT INTO `sys_log` VALUES (27, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 6, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 17:56:25', '获取菜单树');
INSERT INTO `sys_log` VALUES (28, '1', 'com.ems.system.controller.SysMenuController.getMenuTableTree()', '{  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 17:56:50', '获取菜单的table树');
INSERT INTO `sys_log` VALUES (29, '1', 'com.ems.system.controller.SysRoleController.getRoleList()', '{  }', 5, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 17:56:52', '获取角色列表');
INSERT INTO `sys_log` VALUES (30, '1', 'com.ems.system.controller.SysUserController.queryUserTable()', '{  }', 4, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 17:56:53', '查询用户列表');
INSERT INTO `sys_log` VALUES (31, '1', 'com.ems.system.controller.SysRoleController.getAllRoleForXm()', '{null  }', 8, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 17:56:58', '获取角色选择框列表');
INSERT INTO `sys_log` VALUES (32, '1', 'com.ems.system.controller.SysMenuController.getMenuSelectTree()', '{null  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 17:57:06', '获取下拉框里面的树');
INSERT INTO `sys_log` VALUES (33, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 9, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 19:42:17', '获取菜单树');
INSERT INTO `sys_log` VALUES (34, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 5, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 19:42:19', '获取菜单树');
INSERT INTO `sys_log` VALUES (35, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 20, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 19:42:33', '获取菜单树');
INSERT INTO `sys_log` VALUES (36, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 10, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 19:42:44', '获取菜单树');
INSERT INTO `sys_log` VALUES (37, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 17, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 19:43:28', '获取菜单树');
INSERT INTO `sys_log` VALUES (38, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 14, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 19:44:21', '获取菜单树');
INSERT INTO `sys_log` VALUES (39, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 50, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 19:46:08', '获取菜单树');
INSERT INTO `sys_log` VALUES (40, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 15, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 19:46:32', '获取菜单树');
INSERT INTO `sys_log` VALUES (41, '1', 'com.ems.system.controller.LoginController.login()', '{com.ems.system.entity.dto.UserDto@3fb4067f FirewalledRequest[ org.apache.catalina.connector.RequestFacade@44af390]  }', 390, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:05:18', '用户登录');
INSERT INTO `sys_log` VALUES (42, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 24, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:05:18', '获取菜单树');
INSERT INTO `sys_log` VALUES (43, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 30, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:06:06', '获取菜单树');
INSERT INTO `sys_log` VALUES (44, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 19, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:06:43', '获取菜单树');
INSERT INTO `sys_log` VALUES (45, '1', 'com.ems.system.controller.LoginController.login()', '{com.ems.system.entity.dto.UserDto@3727467d FirewalledRequest[ org.apache.catalina.connector.RequestFacade@3b00b944]  }', 188, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:07:26', '用户登录');
INSERT INTO `sys_log` VALUES (46, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 4, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:07:27', '获取菜单树');
INSERT INTO `sys_log` VALUES (47, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 29, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:07:59', '获取菜单树');
INSERT INTO `sys_log` VALUES (48, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 5, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:08:34', '获取菜单树');
INSERT INTO `sys_log` VALUES (49, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 24, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:08:47', '获取菜单树');
INSERT INTO `sys_log` VALUES (50, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 31, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:09:58', '获取菜单树');
INSERT INTO `sys_log` VALUES (51, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 14, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:11:48', '获取菜单树');
INSERT INTO `sys_log` VALUES (52, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 9, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:11:51', '获取菜单树');
INSERT INTO `sys_log` VALUES (53, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 19, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:12:44', '获取菜单树');
INSERT INTO `sys_log` VALUES (54, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 8, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:12:46', '获取菜单树');
INSERT INTO `sys_log` VALUES (55, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 20, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:15:57', '获取菜单树');
INSERT INTO `sys_log` VALUES (56, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 47, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:16:53', '获取菜单树');
INSERT INTO `sys_log` VALUES (57, '1', 'com.ems.system.controller.SysUserController.queryUserTable()', '{  }', 16, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:17:00', '查询用户列表');
INSERT INTO `sys_log` VALUES (58, '1', 'com.ems.system.controller.SysMenuController.getMenuTableTree()', '{  }', 3, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:17:01', '获取菜单的table树');
INSERT INTO `sys_log` VALUES (59, '1', 'com.ems.system.controller.SysRoleController.getRoleList()', '{  }', 4, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:17:02', '获取角色列表');
INSERT INTO `sys_log` VALUES (60, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 15, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:18:28', '获取菜单树');
INSERT INTO `sys_log` VALUES (61, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 58, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:19:21', '获取菜单树');
INSERT INTO `sys_log` VALUES (62, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 40, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:26:12', '获取菜单树');
INSERT INTO `sys_log` VALUES (63, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 28, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:27:49', '获取菜单树');
INSERT INTO `sys_log` VALUES (64, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 27, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:29:15', '获取菜单树');
INSERT INTO `sys_log` VALUES (65, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 14, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:31:36', '获取菜单树');
INSERT INTO `sys_log` VALUES (66, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 15, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:31:54', '获取菜单树');
INSERT INTO `sys_log` VALUES (67, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 15, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:32:11', '获取菜单树');
INSERT INTO `sys_log` VALUES (68, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 14, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:33:50', '获取菜单树');
INSERT INTO `sys_log` VALUES (69, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 14, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:35:51', '获取菜单树');
INSERT INTO `sys_log` VALUES (70, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 24, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:40:47', '获取菜单树');
INSERT INTO `sys_log` VALUES (71, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 43, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:41:18', '获取菜单树');
INSERT INTO `sys_log` VALUES (72, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 39, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:43:04', '获取菜单树');
INSERT INTO `sys_log` VALUES (73, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 31, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:44:18', '获取菜单树');
INSERT INTO `sys_log` VALUES (74, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 16, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:45:50', '获取菜单树');
INSERT INTO `sys_log` VALUES (75, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 34, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:46:48', '获取菜单树');
INSERT INTO `sys_log` VALUES (76, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 49, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:56:14', '获取菜单树');
INSERT INTO `sys_log` VALUES (77, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 86, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:57:38', '获取菜单树');
INSERT INTO `sys_log` VALUES (78, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 5, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 20:57:44', '获取菜单树');
INSERT INTO `sys_log` VALUES (79, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 5, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 21:11:11', '获取菜单树');
INSERT INTO `sys_log` VALUES (80, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 7, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 21:11:54', '获取菜单树');
INSERT INTO `sys_log` VALUES (81, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 18, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 21:13:16', '获取菜单树');
INSERT INTO `sys_log` VALUES (82, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 17, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 21:16:26', '获取菜单树');
INSERT INTO `sys_log` VALUES (83, '1', 'com.ems.system.controller.LoginController.login()', '{com.ems.system.entity.dto.UserDto@5d5d3d7d FirewalledRequest[ org.apache.catalina.connector.RequestFacade@2a3c76d0]  }', 464, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 21:20:49', '用户登录');
INSERT INTO `sys_log` VALUES (84, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 24, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 21:20:49', '获取菜单树');
INSERT INTO `sys_log` VALUES (85, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 26, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 21:24:47', '获取菜单树');
INSERT INTO `sys_log` VALUES (86, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 43, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 21:47:26', '获取菜单树');
INSERT INTO `sys_log` VALUES (87, '1', 'com.ems.system.controller.SysUserController.queryUserTable()', '{  }', 16, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 21:47:29', '查询用户列表');
INSERT INTO `sys_log` VALUES (88, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 47, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 21:50:00', '获取菜单树');
INSERT INTO `sys_log` VALUES (89, '1', 'com.ems.system.controller.SysUserController.queryUserTable()', '{  }', 22, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 21:50:02', '查询用户列表');
INSERT INTO `sys_log` VALUES (90, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 24, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 21:50:45', '获取菜单树');
INSERT INTO `sys_log` VALUES (91, '1', 'com.ems.system.controller.SysUserController.queryUserTable()', '{  }', 19, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 21:50:49', '查询用户列表');
INSERT INTO `sys_log` VALUES (92, '1', 'com.ems.system.controller.SysRoleController.getAllRoleForXm()', '{null  }', 25, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 21:50:51', '获取角色选择框列表');
INSERT INTO `sys_log` VALUES (93, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 28, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:02:18', '获取菜单树');
INSERT INTO `sys_log` VALUES (94, '1', 'com.ems.system.controller.SysUserController.queryUserTable()', '{  }', 15, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:02:20', '查询用户列表');
INSERT INTO `sys_log` VALUES (95, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 24, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:02:57', '获取菜单树');
INSERT INTO `sys_log` VALUES (96, '1', 'com.ems.system.controller.SysUserController.queryUserTable()', '{  }', 17, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:02:58', '查询用户列表');
INSERT INTO `sys_log` VALUES (97, '1', 'com.ems.system.controller.SysRoleController.getAllRoleForXm()', '{null  }', 83, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:03:00', '获取角色选择框列表');
INSERT INTO `sys_log` VALUES (98, '1', 'com.ems.system.controller.SysRoleController.getAllRoleForXm()', '{2  }', 5, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:03:03', '获取角色选择框列表');
INSERT INTO `sys_log` VALUES (99, '1', 'com.ems.system.controller.SysRoleController.getAllRoleForXm()', '{1  }', 5, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:03:14', '获取角色选择框列表');
INSERT INTO `sys_log` VALUES (100, '1', 'com.ems.system.controller.SysRoleController.getAllRoleForXm()', '{2  }', 3, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:03:17', '获取角色选择框列表');
INSERT INTO `sys_log` VALUES (101, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 19, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:05:36', '获取菜单树');
INSERT INTO `sys_log` VALUES (102, '1', 'com.ems.system.controller.SysUserController.queryUserTable()', '{  }', 26, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:05:37', '查询用户列表');
INSERT INTO `sys_log` VALUES (103, '1', 'com.ems.system.controller.SysRoleController.getAllRoleForXm()', '{null  }', 16, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:05:41', '获取角色选择框列表');
INSERT INTO `sys_log` VALUES (104, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 26, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:07:09', '获取菜单树');
INSERT INTO `sys_log` VALUES (105, '1', 'com.ems.system.controller.SysUserController.queryUserTable()', '{  }', 19, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:07:17', '查询用户列表');
INSERT INTO `sys_log` VALUES (106, '1', 'com.ems.system.controller.SysRoleController.getAllRoleForXm()', '{null  }', 24, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:07:20', '获取角色选择框列表');
INSERT INTO `sys_log` VALUES (107, '1', 'com.ems.system.controller.SysRoleController.getAllRoleForXm()', '{2  }', 15, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:07:58', '获取角色选择框列表');
INSERT INTO `sys_log` VALUES (108, '1', 'com.ems.system.controller.SysRoleController.getAllRoleForXm()', '{null  }', 35, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:11:18', '获取角色选择框列表');
INSERT INTO `sys_log` VALUES (109, '1', 'com.ems.system.controller.SysRoleController.getAllRoleForXm()', '{2  }', 5, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:11:20', '获取角色选择框列表');
INSERT INTO `sys_log` VALUES (110, '1', 'com.ems.system.controller.SysRoleController.getAllRoleForXm()', '{null  }', 44, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:15:52', '获取角色选择框列表');
INSERT INTO `sys_log` VALUES (111, '1', 'com.ems.system.controller.SysUserController.editUser()', '{com.ems.system.entity.dto.UserDto@379fbf45  }', 95, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:16:03', '编辑用户');
INSERT INTO `sys_log` VALUES (112, '1', 'com.ems.system.controller.SysUserController.queryUserTable()', '{  }', 4, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:16:09', '查询用户列表');
INSERT INTO `sys_log` VALUES (113, '1', 'com.ems.system.controller.SysUserController.delUser()', '{4  }', 13, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:16:12', '删除用户');
INSERT INTO `sys_log` VALUES (114, '1', 'com.ems.system.controller.SysUserController.queryUserTable()', '{  }', 1, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:16:12', '查询用户列表');
INSERT INTO `sys_log` VALUES (115, '1', 'com.ems.system.controller.SysRoleController.getAllRoleForXm()', '{null  }', 6, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:16:47', '获取角色选择框列表');
INSERT INTO `sys_log` VALUES (116, '1', 'com.ems.system.controller.SysRoleController.getAllRoleForXm()', '{null  }', 4, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:16:48', '获取角色选择框列表');
INSERT INTO `sys_log` VALUES (117, '1', 'com.ems.system.controller.SysMenuController.getMenuTableTree()', '{  }', 18, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:24:07', '获取菜单的table树');
INSERT INTO `sys_log` VALUES (118, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 15, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:26:51', '获取菜单树');
INSERT INTO `sys_log` VALUES (119, '1', 'com.ems.system.controller.SysMenuController.getMenuTableTree()', '{  }', 15, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:26:52', '获取菜单的table树');
INSERT INTO `sys_log` VALUES (120, '1', 'com.ems.system.controller.SysMenuController.getMenuSelectTree()', '{null  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:26:54', '获取下拉框里面的树');
INSERT INTO `sys_log` VALUES (121, '1', 'com.ems.system.controller.SysMenuController.getMenuSelectTree()', '{null  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:27:07', '获取下拉框里面的树');
INSERT INTO `sys_log` VALUES (122, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 17, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:30:01', '获取菜单树');
INSERT INTO `sys_log` VALUES (123, '1', 'com.ems.system.controller.SysMenuController.getMenuTableTree()', '{  }', 4, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:30:03', '获取菜单的table树');
INSERT INTO `sys_log` VALUES (124, '1', 'com.ems.system.controller.SysMenuController.getMenuSelectTree()', '{null  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:30:07', '获取下拉框里面的树');
INSERT INTO `sys_log` VALUES (125, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 20, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:36:47', '获取菜单树');
INSERT INTO `sys_log` VALUES (126, '1', 'com.ems.system.controller.SysMenuController.getMenuTableTree()', '{  }', 17, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:36:49', '获取菜单的table树');
INSERT INTO `sys_log` VALUES (127, '1', 'com.ems.system.controller.SysMenuController.getMenuSelectTree()', '{null  }', 4, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:36:52', '获取下拉框里面的树');
INSERT INTO `sys_log` VALUES (128, '1', 'com.ems.system.controller.SysMenuController.getMenuSelectTree()', '{null  }', 6, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:36:52', '获取下拉框里面的树');
INSERT INTO `sys_log` VALUES (129, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 42, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:37:28', '获取菜单树');
INSERT INTO `sys_log` VALUES (130, '1', 'com.ems.system.controller.SysMenuController.getMenuTableTree()', '{  }', 24, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:37:30', '获取菜单的table树');
INSERT INTO `sys_log` VALUES (131, '1', 'com.ems.system.controller.SysMenuController.getMenuSelectTree()', '{null  }', 4, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:37:35', '获取下拉框里面的树');
INSERT INTO `sys_log` VALUES (132, '1', 'com.ems.system.controller.SysMenuController.getMenuSelectTree()', '{null  }', 4, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:37:35', '获取下拉框里面的树');
INSERT INTO `sys_log` VALUES (133, '1', 'com.ems.system.controller.SysMenuController.getMenuSelectTree()', '{null  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:38:13', '获取下拉框里面的树');
INSERT INTO `sys_log` VALUES (134, '1', 'com.ems.system.controller.SysMenuController.getMenuSelectTree()', '{null  }', 3, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:38:13', '获取下拉框里面的树');
INSERT INTO `sys_log` VALUES (135, '1', 'com.ems.system.controller.SysMenuController.getMenuSelectTree()', '{null  }', 3, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:39:02', '获取下拉框里面的树');
INSERT INTO `sys_log` VALUES (136, '1', 'com.ems.system.controller.SysMenuController.getMenuSelectTree()', '{null  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:39:02', '获取下拉框里面的树');
INSERT INTO `sys_log` VALUES (137, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 20, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:41:15', '获取菜单树');
INSERT INTO `sys_log` VALUES (138, '1', 'com.ems.system.controller.SysMenuController.getMenuTableTree()', '{  }', 15, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:41:17', '获取菜单的table树');
INSERT INTO `sys_log` VALUES (139, '1', 'com.ems.system.controller.SysMenuController.getMenuSelectTree()', '{null  }', 4, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:41:18', '获取下拉框里面的树');
INSERT INTO `sys_log` VALUES (140, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 6, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:42:18', '获取菜单树');
INSERT INTO `sys_log` VALUES (141, '1', 'com.ems.system.controller.SysMenuController.getMenuTableTree()', '{  }', 3, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:42:21', '获取菜单的table树');
INSERT INTO `sys_log` VALUES (142, '1', 'com.ems.system.controller.SysMenuController.getMenuSelectTree()', '{null  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:42:25', '获取下拉框里面的树');
INSERT INTO `sys_log` VALUES (143, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 6, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:43:01', '获取菜单树');
INSERT INTO `sys_log` VALUES (144, '1', 'com.ems.system.controller.SysMenuController.getMenuTableTree()', '{  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:43:04', '获取菜单的table树');
INSERT INTO `sys_log` VALUES (145, '1', 'com.ems.system.controller.SysMenuController.getMenuSelectTree()', '{null  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:43:05', '获取下拉框里面的树');
INSERT INTO `sys_log` VALUES (146, '1', 'com.ems.system.controller.SysMenuController.editMenu()', '{com.ems.system.entity.SysMenu@4505e01d  }', 6, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:43:18', '编辑菜单');
INSERT INTO `sys_log` VALUES (147, '1', 'com.ems.system.controller.SysMenuController.getMenuTableTree()', '{  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:43:18', '获取菜单的table树');
INSERT INTO `sys_log` VALUES (148, '1', 'com.ems.system.controller.SysMenuController.getMenuSelectTree()', '{null  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:43:20', '获取下拉框里面的树');
INSERT INTO `sys_log` VALUES (149, '1', 'com.ems.system.controller.SysMenuController.editMenu()', '{com.ems.system.entity.SysMenu@1bba2edb  }', 6, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:43:24', '编辑菜单');
INSERT INTO `sys_log` VALUES (150, '1', 'com.ems.system.controller.SysMenuController.getMenuTableTree()', '{  }', 1, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:43:24', '获取菜单的table树');
INSERT INTO `sys_log` VALUES (151, '1', 'com.ems.system.controller.SysMenuController.delMenu()', '{18  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:43:26', '删除菜单');
INSERT INTO `sys_log` VALUES (152, '1', 'com.ems.system.controller.SysMenuController.getMenuTableTree()', '{  }', 1, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:43:26', '获取菜单的table树');
INSERT INTO `sys_log` VALUES (153, '1', 'com.ems.system.controller.SysRoleController.getRoleList()', '{  }', 4, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:43:34', '获取角色列表');
INSERT INTO `sys_log` VALUES (154, '1', 'com.ems.system.controller.SysRoleController.editRole()', '{com.ems.system.entity.SysRole@26c656e4  }', 10, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:43:50', '编辑角色');
INSERT INTO `sys_log` VALUES (155, '1', 'com.ems.system.controller.SysRoleController.getRoleList()', '{  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:43:50', '获取角色列表');
INSERT INTO `sys_log` VALUES (156, '1', 'com.ems.system.controller.SysMenuController.getMenuTree()', '{ }', 16, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:45:17', '获取菜单树');
INSERT INTO `sys_log` VALUES (157, '1', 'com.ems.system.controller.SysRoleController.getRoleList()', '{  }', 16, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:45:19', '获取角色列表');
INSERT INTO `sys_log` VALUES (158, '1', 'com.ems.system.controller.SysRoleController.editRole()', '{com.ems.system.entity.SysRole@7e174613  }', 17, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:45:25', '编辑角色');
INSERT INTO `sys_log` VALUES (159, '1', 'com.ems.system.controller.SysRoleController.getRoleList()', '{  }', 4, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:45:25', '获取角色列表');
INSERT INTO `sys_log` VALUES (160, '1', 'com.ems.system.controller.SysRoleController.delRole()', '{4  }', 31, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:45:29', '删除角色');
INSERT INTO `sys_log` VALUES (161, '1', 'com.ems.system.controller.SysRoleController.getRoleList()', '{  }', 2, '0:0:0:0:0:0:0:1', 'admin', NULL, '2021-11-28 22:45:29', '获取角色列表');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL COMMENT '名称',
  `parent_id` bigint DEFAULT NULL COMMENT '父ID',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL COMMENT 'url',
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL COMMENT '类型（1菜单 2页面 3按钮）',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_german2_ci;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, NULL, '1', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (2, '用户管理', 1, '/user/index.html', '2', 1, NULL, '2021-11-22 14:28:45');
INSERT INTO `sys_menu` VALUES (3, '菜单管理', 1, '/menu/index.html', '2', 2, '2021-08-18 21:26:01', NULL);
INSERT INTO `sys_menu` VALUES (11, '日志管理', 0, NULL, '1', 2, '2021-08-23 22:00:33', '2021-11-23 09:22:16');
INSERT INTO `sys_menu` VALUES (12, '角色管理', 1, '/role/index.html', '2', 3, '2021-08-24 20:46:39', '2021-11-22 23:01:32');
INSERT INTO `sys_menu` VALUES (13, '菜单编辑', 3, '/menu/edit.html', '2', 1, '2021-11-20 09:36:01', NULL);
INSERT INTO `sys_menu` VALUES (14, '用户编辑', 2, '/user/edit.html', '2', 1, '2021-11-22 14:56:30', NULL);
INSERT INTO `sys_menu` VALUES (15, '角色编辑', 12, '/role/edit.html', '2', 1, '2021-11-22 22:49:32', NULL);
INSERT INTO `sys_menu` VALUES (16, '角色授权', 12, '/role/authorize.html', '2', 2, '2021-11-22 23:08:35', NULL);
INSERT INTO `sys_menu` VALUES (17, '日志记录', 11, '/log/index.html', '2', 1, '2021-11-23 09:32:38', '2021-11-23 09:32:48');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL COMMENT '角色代码',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL COMMENT '角色名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL COMMENT '备注',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_german2_ci;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, 'ROLE_ADMIN', '超级管理员', '2021-08-25 22:55:45', '系统唯一超级管理员，可操作任意功能', NULL);
INSERT INTO `sys_role` VALUES (2, 'ROLE_USER', '普通用户', '2021-11-24 22:47:44', '普通用户', NULL);
INSERT INTO `sys_role` VALUES (3, 'ROLE_TEST', '测试用户', '2021-11-24 22:48:04', '测试用户', '2021-11-24 23:30:32');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint DEFAULT NULL COMMENT '菜单ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_german2_ci;

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_german2_ci;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_user` VALUES (1, 1, 1, '2021-11-17 23:00:35', NULL);
INSERT INTO `sys_role_user` VALUES (2, 2, 2, '2021-11-27 21:13:05', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL COMMENT '邮箱',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL COMMENT '密码',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `enabled` bit(1) DEFAULT NULL COMMENT '状态（0停用 1启用）',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_german2_ci DEFAULT NULL COMMENT '昵称',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_german2_ci;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, '123@qq.com', 'admin', '$2a$10$RaxC7eKvHy1Sj.UTLUN3Be/3xhdA5yd08rsVcNaWnBq8muCdbY7j.', '2021-11-27 20:50:19', b'1', '超级管理员', NULL);
INSERT INTO `sys_user` VALUES (2, NULL, 'user', '$2a$10$b5mQxndMAYD3cOnqVyENHOFCRu7lgOY0etmNT5JRtX9RGz.Bkh.jC', '2021-11-27 21:13:05', b'0', '普通用户', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

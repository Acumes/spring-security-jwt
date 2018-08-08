/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : platform

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-08-08 10:37:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父ID',
  `parent_ids` varchar(2000) NOT NULL COMMENT '树ID',
  `name` varchar(100) NOT NULL COMMENT '菜单名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) DEFAULT '1' COMMENT '是否显示\n1：显示\n0：隐藏',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记\n1：删除\n0：未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('07fb63cf51d74e31b095d42b3dfb7686', '1caf32bb9f6f42e99b1d9413ebe84171', ',50223b0d0c014e848296f7580df517e7,1caf32bb9f6f42e99b1d9413ebe84171,', '修改', '20', null, null, '0', 'trip:user:edit', null, '2016-10-20 11:56:31', '2016-10-20 11:56:31', '0');
INSERT INTO `sys_menu` VALUES ('1caf32bb9f6f42e99b1d9413ebe84171', '50223b0d0c014e848296f7580df517e7', ',50223b0d0c014e848296f7580df517e7,', '用户信息', '10', 'app.trip.user.list', 'glyphicon glyphicon-qrcode', '1', '', '', '2016-10-17 10:40:33', '2016-10-20 11:55:45', '0');
INSERT INTO `sys_menu` VALUES ('50223b0d0c014e848296f7580df517e7', '', ',', '用户管理', '20', null, 'glyphicon glyphicon-user', '1', null, null, '2016-10-17 10:38:49', '2016-10-17 10:38:49', '0');
INSERT INTO `sys_menu` VALUES ('71', '', ',', '首页', '1', 'app.dashboard', 'glyphicon glyphicon-dashboard', '1', 'trip:dashboard:view', '', '2015-10-20 08:00:00', '2016-12-26 11:13:42', '0');
INSERT INTO `sys_menu` VALUES ('863b9d86e81f4e3599ce6e594c2e4932', '1caf32bb9f6f42e99b1d9413ebe84171', ',50223b0d0c014e848296f7580df517e7,1caf32bb9f6f42e99b1d9413ebe84171,', '查看', '10', null, null, '0', 'trip:user:view', null, '2016-10-20 11:56:08', '2016-10-20 11:56:08', '0');
INSERT INTO `sys_menu` VALUES ('92', '', '', '系统设置', '60', '', 'glyphicon glyphicon-book', '1', '', '', '2015-10-20 08:00:00', '2015-10-20 08:00:00', '0');
INSERT INTO `sys_menu` VALUES ('921', '92', '92,', '菜单管理', '30', 'app.sys.menu.list', 'glyphicon glyphicon-picture', '1', '', '', '2015-10-20 08:00:00', '2015-10-20 08:00:00', '0');
INSERT INTO `sys_menu` VALUES ('9211', '921', '92,921,', '查看', '30', '', '', '0', 'sys:menu:view', '', '2015-10-20 08:00:00', '2015-10-20 08:00:00', '0');
INSERT INTO `sys_menu` VALUES ('9212', '921', '92,921,', '修改', '40', '', '', '0', 'sys:menu:edit', '', '2015-10-20 08:00:00', '2015-10-20 08:00:00', '0');
INSERT INTO `sys_menu` VALUES ('923', '92', '92,', '用户管理', '10', 'app.sys.user.list', 'glyphicon glyphicon-tag', '1', '', '', '2015-10-20 08:00:00', '2016-10-09 16:11:37', '0');
INSERT INTO `sys_menu` VALUES ('9231', '923', '92,923,', '查看', '30', '', '', '0', 'sys:user:view', '', '2015-10-20 08:00:00', '2016-10-12 16:28:45', '0');
INSERT INTO `sys_menu` VALUES ('9232', '923', '92,923,', '修改', '40', '', '', '0', 'sys:user:edit', '', '2015-10-20 08:00:00', '2015-10-20 08:00:00', '0');
INSERT INTO `sys_menu` VALUES ('924', '92', '92,', '角色管理', '20', 'app.sys.role.list', 'glyphicon  glyphicon-list-alt', '1', '', '', '2015-10-20 08:00:00', '2016-10-09 16:11:44', '0');
INSERT INTO `sys_menu` VALUES ('9241', '924', '92,924,', '查看', '30', '', '', '0', 'sys:role:view', '', '2015-10-20 08:00:00', '2015-10-20 08:00:00', '0');
INSERT INTO `sys_menu` VALUES ('9242', '924', '92,924,', '修改', '40', '', '', '0', 'sys:role:edit', '', '2015-10-20 08:00:00', '2015-10-20 08:00:00', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enabled` char(1) DEFAULT '1' COMMENT '是否可用\n1：可用\n0：停用',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记\n1：删除\n0：未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'ROLE_ADMIN', '1', '管理员角色', '2016-10-09 15:13:21', '2016-12-26 19:28:03', '0');
INSERT INTO `sys_role` VALUES ('2', 'ROLE_USER', '1', '用户角色', '2016-10-09 15:13:24', '2016-10-14 10:44:16', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(36) NOT NULL COMMENT '角色ID',
  `menu_id` varchar(36) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '07fb63cf51d74e31b095d42b3dfb7686');
INSERT INTO `sys_role_menu` VALUES ('1', '1caf32bb9f6f42e99b1d9413ebe84171');
INSERT INTO `sys_role_menu` VALUES ('1', '50223b0d0c014e848296f7580df517e7');
INSERT INTO `sys_role_menu` VALUES ('1', '71');
INSERT INTO `sys_role_menu` VALUES ('1', '863b9d86e81f4e3599ce6e594c2e4932');
INSERT INTO `sys_role_menu` VALUES ('1', '92');
INSERT INTO `sys_role_menu` VALUES ('1', '921');
INSERT INTO `sys_role_menu` VALUES ('1', '9211');
INSERT INTO `sys_role_menu` VALUES ('1', '9212');
INSERT INTO `sys_role_menu` VALUES ('1', '923');
INSERT INTO `sys_role_menu` VALUES ('1', '9231');
INSERT INTO `sys_role_menu` VALUES ('1', '9232');
INSERT INTO `sys_role_menu` VALUES ('1', '924');
INSERT INTO `sys_role_menu` VALUES ('1', '9241');
INSERT INTO `sys_role_menu` VALUES ('1', '9242');
INSERT INTO `sys_role_menu` VALUES ('2', '71');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮件',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `enabled` char(1) DEFAULT '1' COMMENT '是否可用\n1：可用\n0：停用',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记\n1：删除\n0：未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name_UNIQUE` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1dc8f600508640688f150c6e04d5c953', 'admin1', '$2a$10$ZD6xxT.zFlxgzJxz6LCdQOOMES0v0eOZEJk2LoKKFITx.ipbB8rwa', '123123', '12312', '21312', '3123', '1', '3123131', null, null, '0');
INSERT INTO `sys_user` VALUES ('3', 'admin', '$2a$08$onHA58Qvc93qOZZNUTev4e89YRuRtfxrOM9F35WgLEwY84eGffy9W', 'admin', '295277302@qq.com', '124123123', '188299923', '1', '12312', null, null, null);
INSERT INTO `sys_user` VALUES ('4005c5b089dd4205a78343e6bf348cc6', 'admin8', '$2a$10$Kv53e8Ebsc/Pd5n7ASFKQegKI766R5CfCjeGjhCa8carsybJy2u96', 'admin8', 'admin8', 'admin8', 'admin8', '1', 'admin8', null, null, '0');
INSERT INTO `sys_user` VALUES ('53005f8d6835436ba4e5d6bda080d00d', 'admin6', '$2a$10$4onsys0ubgkkAYcuAK00lOHrLMDpV1XMHb8X/Pus/U3Ju8ba52Vye', 'admin6', 'admin6', 'admin6', 'admin6', '1', 'admin6', null, null, '0');
INSERT INTO `sys_user` VALUES ('5b4dae7582e040f48628365c63a5ad58', 'admin4', '$2a$10$kq5fSD52TsPExYp1UWDgf.L9xDacmkbLaYTg81OqMzu8O6EVb.xJu', 'admin4', 'admin4', 'admin4', 'admin4', '1', 'admin4', null, null, '0');
INSERT INTO `sys_user` VALUES ('5d4b56b8e32a4a7cb60bb85ac8727062', 'admin2', '$2a$10$HBKJjbOfYVI.fRIOkhgkAeP/m6DwgcbmwpYFFwreGuaJZbyQCkb.m', 'admin2', 'admin2', 'admin2', 'admin2', '1', 'admin2', null, null, '0');
INSERT INTO `sys_user` VALUES ('60c06c12f7114857a7865d4cc839d66d', 'admin9', '$2a$10$vSZ10RjSeygh4JBhaD6dZuCqijqlayZsI/rJWvTWvhLgFAZdwFlcq', 'admin9', 'admin9', 'admin9', 'admin9', '1', 'admin9', null, null, '0');
INSERT INTO `sys_user` VALUES ('62aa2374d4014ba99f41fc065272be1f', 'admin12', '$2a$10$bzDUfx.gOzohWBpFpllUzO7vSPm6DqQeWlJxi7X.Gu3iGNTEbu1kO', 'admin12', 'admin12', 'admin12', 'admin12', '1', 'admin12', null, null, '0');
INSERT INTO `sys_user` VALUES ('7d6d8a1bdfc146bd8829448a219fc550', 'admin11', '$2a$10$pQfQkweFcs4PYST.EOwK7eE312ZWvEzKX5AUIjmi5wrZJWgrX.m8y', 'admin11', 'admin11', 'admin11', 'admin11', '1', 'admin11', null, null, '0');
INSERT INTO `sys_user` VALUES ('c0fca810ad7e47b7821de90ef12c2412', 'admin3', '$2a$10$EU6K7eIMU4HLXZQjjR7TSONp.0gcTIaMgGgzqR1XA8dq1MoC/LhpS', 'admin3', 'admin3', 'admin3', 'admin3', '1', 'admin3', null, null, '0');
INSERT INTO `sys_user` VALUES ('dac7b9f4ccfb412ab099314e38f99e58', 'admin7', '$2a$10$hqGfO0wynYgxJ39QyMIc3..qBkk12bbVFWATpO4oY1L4N/yG0/mhu', 'admin7', 'admin7', 'admin7', 'admin7', '1', 'admin7', null, null, '0');
INSERT INTO `sys_user` VALUES ('fdc591ee81384848abfc55b2b03087ed', 'admin5', '$2a$10$h4hHewvAQY4sdrfwCyglfePVOD1RD3r6azrHogMd6H/u34rDwez8i', 'admin5', 'admin5', 'admin5', 'admin5', '1', 'admin5', null, null, '0');

-- ----------------------------
-- Table structure for sys_user_copy
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_copy`;
CREATE TABLE `sys_user_copy` (
  `id` int(36) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮件',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `enabled` char(1) DEFAULT '1' COMMENT '是否可用\n1：可用\n0：停用',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记\n1：删除\n0：未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name_UNIQUE` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user_copy
-- ----------------------------
INSERT INTO `sys_user_copy` VALUES ('3', 'admin', '$2a$08$onHA58Qvc93qOZZNUTev4e89YRuRtfxrOM9F35WgLEwY84eGffy9W', 'admin', '295277302@qq.com', '124123123', '188299923', '1', '12312', null, null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(36) NOT NULL COMMENT '用户ID',
  `role_id` varchar(36) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('1', '2');

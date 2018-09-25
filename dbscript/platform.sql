/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : platform

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-09-25 21:33:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cdm_sys_function
-- ----------------------------
DROP TABLE IF EXISTS `cdm_sys_function`;
CREATE TABLE `cdm_sys_function` (
  `function_id` int(11) NOT NULL COMMENT '功能编号',
  `p_function_id` int(11) DEFAULT NULL COMMENT '父功能编号',
  `function_title` varchar(60) DEFAULT NULL COMMENT '功能默认标题',
  `function_language` varchar(80) DEFAULT NULL COMMENT '国际化标识',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `function_flag` varchar(10) DEFAULT NULL COMMENT '功能类型-菜单、按钮',
  `function_url` varchar(200) DEFAULT NULL COMMENT '功能url',
  `index_no` decimal(12,0) DEFAULT NULL,
  `function_icon` varchar(60) DEFAULT NULL COMMENT '功能图标',
  `function_css` varchar(60) DEFAULT NULL COMMENT '功能样式',
  `pi_string` varchar(68) DEFAULT NULL COMMENT '权限拦截字符串',
  `pi_expression` varchar(68) DEFAULT NULL COMMENT '权限拦截表达式',
  `subsystem_id` varchar(20) DEFAULT NULL COMMENT '子系统标识',
  `create_user` varchar(45) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`function_id`),
  UNIQUE KEY `function_id_UNIQUE` (`function_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单功能';

-- ----------------------------
-- Records of cdm_sys_function
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_6', 'DEFAULT', '0,30 10 * ? * MON-FRI', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_6', 'DEFAULT', null, 'com.htf.common.config.job.ScheduleJobBean', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720016636F6D2E6874662E706F2E5363686564756C654A6F62932F4DB965EB1F130200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B78707400087461736B4265616E70740014302C3330202A202A203F202A204D4F4E2D4652497372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000067400047465737474000474657374740000737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0011000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'ZO07CBI51EA4Y1A1537868383640', '1537882416371', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_6', 'DEFAULT', 'TASK_6', 'DEFAULT', null, '1537884600000', '1537881030000', '5', 'WAITING', 'CRON', '1537408274000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720016636F6D2E6874662E706F2E5363686564756C654A6F62932F4DB965EB1F130200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B78707400087461736B4265616E70740015302C3330203130202A203F202A204D4F4E2D4652497372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000067400047465737474000474657374740000737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0011000000007800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('6', 'taskBean', 'test', 'test', '0,30 10 * ? * MON-FRI', '0', '', null);

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=724 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('46', '6', 'taskBean', 'test', 'test', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'taskBean\' available', '1', '2018-09-20 09:51:30');
INSERT INTO `schedule_job_log` VALUES ('47', '6', 'taskBean', 'test', 'test', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'taskBean\' available', '1', '2018-09-20 09:52:00');
INSERT INTO `schedule_job_log` VALUES ('48', '6', 'taskBean', 'test', 'test', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'taskBean\' available', '0', '2018-09-20 09:52:30');
INSERT INTO `schedule_job_log` VALUES ('49', '6', 'taskBean', 'test', 'test', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'taskBean\' available', '1', '2018-09-20 09:53:00');
INSERT INTO `schedule_job_log` VALUES ('50', '6', 'taskBean', 'test', 'test', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'taskBean\' available', '0', '2018-09-20 09:53:30');
INSERT INTO `schedule_job_log` VALUES ('51', '6', 'taskBean', 'test', 'test', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'taskBean\' available', '0', '2018-09-20 09:54:00');
INSERT INTO `schedule_job_log` VALUES ('52', '6', 'taskBean', 'test', 'test', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'taskBean\' available', '1', '2018-09-20 09:54:30');
INSERT INTO `schedule_job_log` VALUES ('53', '6', 'taskBean', 'test', 'test', '0', null, '1009', '2018-09-20 09:55:30');
INSERT INTO `schedule_job_log` VALUES ('54', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 09:56:00');
INSERT INTO `schedule_job_log` VALUES ('55', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-20 09:56:30');
INSERT INTO `schedule_job_log` VALUES ('56', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 09:57:00');
INSERT INTO `schedule_job_log` VALUES ('57', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-20 09:57:30');
INSERT INTO `schedule_job_log` VALUES ('58', '6', 'taskBean', 'test', 'test', '0', null, '1005', '2018-09-20 09:58:00');
INSERT INTO `schedule_job_log` VALUES ('59', '6', 'taskBean', 'test', 'test', '0', null, '9184', '2018-09-20 09:58:30');
INSERT INTO `schedule_job_log` VALUES ('60', '6', 'taskBean', 'test', 'test', '0', null, '23837', '2018-09-20 09:59:00');
INSERT INTO `schedule_job_log` VALUES ('61', '6', 'taskBean', 'test', 'test', '0', null, '29919', '2018-09-20 09:59:30');
INSERT INTO `schedule_job_log` VALUES ('62', '6', 'taskBean', 'test', 'test', '0', null, '2343', '2018-09-20 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('63', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:00:30');
INSERT INTO `schedule_job_log` VALUES ('64', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:01:00');
INSERT INTO `schedule_job_log` VALUES ('65', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:01:30');
INSERT INTO `schedule_job_log` VALUES ('66', '6', 'taskBean', 'test', 'test', '0', null, '1004', '2018-09-20 10:02:00');
INSERT INTO `schedule_job_log` VALUES ('67', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:02:30');
INSERT INTO `schedule_job_log` VALUES ('68', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:03:00');
INSERT INTO `schedule_job_log` VALUES ('69', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-20 10:03:30');
INSERT INTO `schedule_job_log` VALUES ('70', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 10:04:00');
INSERT INTO `schedule_job_log` VALUES ('71', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:04:30');
INSERT INTO `schedule_job_log` VALUES ('72', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:05:00');
INSERT INTO `schedule_job_log` VALUES ('73', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:05:30');
INSERT INTO `schedule_job_log` VALUES ('74', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:06:00');
INSERT INTO `schedule_job_log` VALUES ('75', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:06:30');
INSERT INTO `schedule_job_log` VALUES ('76', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:07:00');
INSERT INTO `schedule_job_log` VALUES ('77', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:07:30');
INSERT INTO `schedule_job_log` VALUES ('78', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:08:00');
INSERT INTO `schedule_job_log` VALUES ('79', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 10:08:30');
INSERT INTO `schedule_job_log` VALUES ('80', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:09:00');
INSERT INTO `schedule_job_log` VALUES ('81', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-20 10:09:30');
INSERT INTO `schedule_job_log` VALUES ('82', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-20 10:10:00');
INSERT INTO `schedule_job_log` VALUES ('83', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 10:10:30');
INSERT INTO `schedule_job_log` VALUES ('84', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:11:00');
INSERT INTO `schedule_job_log` VALUES ('85', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 10:11:30');
INSERT INTO `schedule_job_log` VALUES ('86', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 10:12:00');
INSERT INTO `schedule_job_log` VALUES ('87', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-20 10:12:30');
INSERT INTO `schedule_job_log` VALUES ('88', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:13:00');
INSERT INTO `schedule_job_log` VALUES ('89', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 10:13:30');
INSERT INTO `schedule_job_log` VALUES ('90', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:14:00');
INSERT INTO `schedule_job_log` VALUES ('91', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 10:14:30');
INSERT INTO `schedule_job_log` VALUES ('92', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-20 10:15:00');
INSERT INTO `schedule_job_log` VALUES ('93', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 10:15:30');
INSERT INTO `schedule_job_log` VALUES ('94', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-20 10:16:00');
INSERT INTO `schedule_job_log` VALUES ('95', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:16:30');
INSERT INTO `schedule_job_log` VALUES ('96', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-20 10:17:00');
INSERT INTO `schedule_job_log` VALUES ('97', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-20 10:17:30');
INSERT INTO `schedule_job_log` VALUES ('98', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 10:18:00');
INSERT INTO `schedule_job_log` VALUES ('99', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 10:18:30');
INSERT INTO `schedule_job_log` VALUES ('100', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-20 10:19:00');
INSERT INTO `schedule_job_log` VALUES ('101', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:19:30');
INSERT INTO `schedule_job_log` VALUES ('102', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 10:20:00');
INSERT INTO `schedule_job_log` VALUES ('103', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:20:30');
INSERT INTO `schedule_job_log` VALUES ('104', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 10:21:00');
INSERT INTO `schedule_job_log` VALUES ('105', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:21:30');
INSERT INTO `schedule_job_log` VALUES ('106', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:22:00');
INSERT INTO `schedule_job_log` VALUES ('107', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 10:22:30');
INSERT INTO `schedule_job_log` VALUES ('108', '6', 'taskBean', 'test', 'test', '0', null, '1004', '2018-09-20 10:23:00');
INSERT INTO `schedule_job_log` VALUES ('109', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:23:30');
INSERT INTO `schedule_job_log` VALUES ('110', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:24:00');
INSERT INTO `schedule_job_log` VALUES ('111', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:24:30');
INSERT INTO `schedule_job_log` VALUES ('112', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 10:25:00');
INSERT INTO `schedule_job_log` VALUES ('113', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:25:30');
INSERT INTO `schedule_job_log` VALUES ('114', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:26:00');
INSERT INTO `schedule_job_log` VALUES ('115', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:26:30');
INSERT INTO `schedule_job_log` VALUES ('116', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 10:27:00');
INSERT INTO `schedule_job_log` VALUES ('117', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 10:27:30');
INSERT INTO `schedule_job_log` VALUES ('118', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-20 10:28:00');
INSERT INTO `schedule_job_log` VALUES ('119', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:28:30');
INSERT INTO `schedule_job_log` VALUES ('120', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-20 10:29:00');
INSERT INTO `schedule_job_log` VALUES ('121', '6', 'taskBean', 'test', 'test', '0', null, '173186', '2018-09-20 10:29:30');
INSERT INTO `schedule_job_log` VALUES ('122', '6', 'taskBean', 'test', 'test', '0', null, '1254', '2018-09-20 10:32:22');
INSERT INTO `schedule_job_log` VALUES ('123', '6', 'taskBean', 'test', 'test', '0', null, '63932', '2018-09-20 10:32:30');
INSERT INTO `schedule_job_log` VALUES ('124', '6', 'taskBean', 'test', 'test', '0', null, '5502', '2018-09-20 10:33:34');
INSERT INTO `schedule_job_log` VALUES ('125', '6', 'taskBean', 'test', 'test', '0', null, '3038', '2018-09-20 10:34:00');
INSERT INTO `schedule_job_log` VALUES ('126', '6', 'taskBean', 'test', 'test', '0', null, '57871', '2018-09-20 10:36:51');
INSERT INTO `schedule_job_log` VALUES ('127', '6', 'taskBean', 'test', 'test', '0', null, '198558', '2018-09-20 10:34:30');
INSERT INTO `schedule_job_log` VALUES ('128', '6', 'taskBean', 'test', 'test', '0', null, '6310', '2018-09-20 10:39:00');
INSERT INTO `schedule_job_log` VALUES ('129', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:39:30');
INSERT INTO `schedule_job_log` VALUES ('130', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-20 10:40:00');
INSERT INTO `schedule_job_log` VALUES ('131', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-20 10:40:30');
INSERT INTO `schedule_job_log` VALUES ('132', '6', 'taskBean', 'test', 'test', '0', null, '1005', '2018-09-21 09:20:30');
INSERT INTO `schedule_job_log` VALUES ('133', '6', 'taskBean', 'test', 'test', '0', null, '1004', '2018-09-21 09:21:00');
INSERT INTO `schedule_job_log` VALUES ('134', '6', 'taskBean', 'test', 'test', '0', null, '1007', '2018-09-21 09:21:30');
INSERT INTO `schedule_job_log` VALUES ('135', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:22:00');
INSERT INTO `schedule_job_log` VALUES ('136', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:22:30');
INSERT INTO `schedule_job_log` VALUES ('137', '6', 'taskBean', 'test', 'test', '0', null, '1005', '2018-09-21 09:23:00');
INSERT INTO `schedule_job_log` VALUES ('138', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:23:30');
INSERT INTO `schedule_job_log` VALUES ('139', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:24:00');
INSERT INTO `schedule_job_log` VALUES ('140', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 09:24:30');
INSERT INTO `schedule_job_log` VALUES ('141', '6', 'taskBean', 'test', 'test', '0', null, '1006', '2018-09-21 09:25:30');
INSERT INTO `schedule_job_log` VALUES ('142', '6', 'taskBean', 'test', 'test', '0', null, '1096', '2018-09-21 09:26:02');
INSERT INTO `schedule_job_log` VALUES ('143', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 09:26:30');
INSERT INTO `schedule_job_log` VALUES ('144', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:27:00');
INSERT INTO `schedule_job_log` VALUES ('145', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:27:30');
INSERT INTO `schedule_job_log` VALUES ('146', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:28:00');
INSERT INTO `schedule_job_log` VALUES ('147', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:28:30');
INSERT INTO `schedule_job_log` VALUES ('148', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:29:00');
INSERT INTO `schedule_job_log` VALUES ('149', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:29:30');
INSERT INTO `schedule_job_log` VALUES ('150', '6', 'taskBean', 'test', 'test', '0', null, '1005', '2018-09-21 09:31:00');
INSERT INTO `schedule_job_log` VALUES ('151', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:31:30');
INSERT INTO `schedule_job_log` VALUES ('152', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:32:00');
INSERT INTO `schedule_job_log` VALUES ('153', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:32:30');
INSERT INTO `schedule_job_log` VALUES ('154', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:33:00');
INSERT INTO `schedule_job_log` VALUES ('155', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:33:30');
INSERT INTO `schedule_job_log` VALUES ('156', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:34:00');
INSERT INTO `schedule_job_log` VALUES ('157', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:34:30');
INSERT INTO `schedule_job_log` VALUES ('158', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:35:00');
INSERT INTO `schedule_job_log` VALUES ('159', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:35:30');
INSERT INTO `schedule_job_log` VALUES ('160', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:36:00');
INSERT INTO `schedule_job_log` VALUES ('161', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:36:30');
INSERT INTO `schedule_job_log` VALUES ('162', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:37:00');
INSERT INTO `schedule_job_log` VALUES ('163', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:37:30');
INSERT INTO `schedule_job_log` VALUES ('164', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:38:00');
INSERT INTO `schedule_job_log` VALUES ('165', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:38:30');
INSERT INTO `schedule_job_log` VALUES ('166', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:39:00');
INSERT INTO `schedule_job_log` VALUES ('167', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 09:39:30');
INSERT INTO `schedule_job_log` VALUES ('168', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:40:00');
INSERT INTO `schedule_job_log` VALUES ('169', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:40:30');
INSERT INTO `schedule_job_log` VALUES ('170', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:41:00');
INSERT INTO `schedule_job_log` VALUES ('171', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:41:30');
INSERT INTO `schedule_job_log` VALUES ('172', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 09:42:00');
INSERT INTO `schedule_job_log` VALUES ('173', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:42:30');
INSERT INTO `schedule_job_log` VALUES ('174', '6', 'taskBean', 'test', 'test', '0', null, '1008', '2018-09-21 09:44:00');
INSERT INTO `schedule_job_log` VALUES ('175', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:44:30');
INSERT INTO `schedule_job_log` VALUES ('176', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:45:12');
INSERT INTO `schedule_job_log` VALUES ('177', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:45:30');
INSERT INTO `schedule_job_log` VALUES ('178', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 09:46:00');
INSERT INTO `schedule_job_log` VALUES ('179', '6', 'taskBean', 'test', 'test', '0', null, '1005', '2018-09-21 09:46:30');
INSERT INTO `schedule_job_log` VALUES ('180', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:47:00');
INSERT INTO `schedule_job_log` VALUES ('181', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:47:30');
INSERT INTO `schedule_job_log` VALUES ('182', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:48:00');
INSERT INTO `schedule_job_log` VALUES ('183', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:48:30');
INSERT INTO `schedule_job_log` VALUES ('184', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:49:00');
INSERT INTO `schedule_job_log` VALUES ('185', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:49:30');
INSERT INTO `schedule_job_log` VALUES ('186', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:50:00');
INSERT INTO `schedule_job_log` VALUES ('187', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:50:30');
INSERT INTO `schedule_job_log` VALUES ('188', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:51:00');
INSERT INTO `schedule_job_log` VALUES ('189', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:51:30');
INSERT INTO `schedule_job_log` VALUES ('190', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:52:00');
INSERT INTO `schedule_job_log` VALUES ('191', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:52:30');
INSERT INTO `schedule_job_log` VALUES ('192', '6', 'taskBean', 'test', 'test', '0', null, '1005', '2018-09-21 09:53:00');
INSERT INTO `schedule_job_log` VALUES ('193', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:53:30');
INSERT INTO `schedule_job_log` VALUES ('194', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:54:00');
INSERT INTO `schedule_job_log` VALUES ('195', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:54:30');
INSERT INTO `schedule_job_log` VALUES ('196', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:55:00');
INSERT INTO `schedule_job_log` VALUES ('197', '6', 'taskBean', 'test', 'test', '0', null, '1191', '2018-09-21 09:55:30');
INSERT INTO `schedule_job_log` VALUES ('198', '6', 'taskBean', 'test', 'test', '0', null, '1089', '2018-09-21 09:56:00');
INSERT INTO `schedule_job_log` VALUES ('199', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-21 09:56:30');
INSERT INTO `schedule_job_log` VALUES ('200', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 09:57:00');
INSERT INTO `schedule_job_log` VALUES ('201', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:57:30');
INSERT INTO `schedule_job_log` VALUES ('202', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 09:58:00');
INSERT INTO `schedule_job_log` VALUES ('203', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 09:58:30');
INSERT INTO `schedule_job_log` VALUES ('204', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-21 09:59:00');
INSERT INTO `schedule_job_log` VALUES ('205', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 09:59:30');
INSERT INTO `schedule_job_log` VALUES ('206', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('207', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:00:30');
INSERT INTO `schedule_job_log` VALUES ('208', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:01:00');
INSERT INTO `schedule_job_log` VALUES ('209', '6', 'taskBean', 'test', 'test', '0', null, '1014', '2018-09-21 10:01:30');
INSERT INTO `schedule_job_log` VALUES ('210', '6', 'taskBean', 'test', 'test', '0', null, '1130', '2018-09-21 10:02:00');
INSERT INTO `schedule_job_log` VALUES ('211', '6', 'taskBean', 'test', 'test', '0', null, '1018', '2018-09-21 10:02:30');
INSERT INTO `schedule_job_log` VALUES ('212', '6', 'taskBean', 'test', 'test', '0', null, '1054', '2018-09-21 10:03:00');
INSERT INTO `schedule_job_log` VALUES ('213', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:03:30');
INSERT INTO `schedule_job_log` VALUES ('214', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:04:00');
INSERT INTO `schedule_job_log` VALUES ('215', '6', 'taskBean', 'test', 'test', '0', null, '1011', '2018-09-21 10:04:30');
INSERT INTO `schedule_job_log` VALUES ('216', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:05:00');
INSERT INTO `schedule_job_log` VALUES ('217', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-21 10:05:30');
INSERT INTO `schedule_job_log` VALUES ('218', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:06:00');
INSERT INTO `schedule_job_log` VALUES ('219', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:06:30');
INSERT INTO `schedule_job_log` VALUES ('220', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:07:00');
INSERT INTO `schedule_job_log` VALUES ('221', '6', 'taskBean', 'test', 'test', '0', null, '1075', '2018-09-21 10:07:30');
INSERT INTO `schedule_job_log` VALUES ('222', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:08:00');
INSERT INTO `schedule_job_log` VALUES ('223', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:08:30');
INSERT INTO `schedule_job_log` VALUES ('224', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:09:00');
INSERT INTO `schedule_job_log` VALUES ('225', '6', 'taskBean', 'test', 'test', '0', null, '1073', '2018-09-21 10:09:30');
INSERT INTO `schedule_job_log` VALUES ('226', '6', 'taskBean', 'test', 'test', '0', null, '1021', '2018-09-21 10:10:00');
INSERT INTO `schedule_job_log` VALUES ('227', '6', 'taskBean', 'test', 'test', '0', null, '1010', '2018-09-21 10:10:30');
INSERT INTO `schedule_job_log` VALUES ('228', '6', 'taskBean', 'test', 'test', '0', null, '1009', '2018-09-21 10:11:00');
INSERT INTO `schedule_job_log` VALUES ('229', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:11:30');
INSERT INTO `schedule_job_log` VALUES ('230', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-21 10:12:00');
INSERT INTO `schedule_job_log` VALUES ('231', '6', 'taskBean', 'test', 'test', '0', null, '1023', '2018-09-21 10:12:30');
INSERT INTO `schedule_job_log` VALUES ('232', '6', 'taskBean', 'test', 'test', '0', null, '1014', '2018-09-21 10:13:00');
INSERT INTO `schedule_job_log` VALUES ('233', '6', 'taskBean', 'test', 'test', '0', null, '1023', '2018-09-21 10:13:30');
INSERT INTO `schedule_job_log` VALUES ('234', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:14:00');
INSERT INTO `schedule_job_log` VALUES ('235', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:14:30');
INSERT INTO `schedule_job_log` VALUES ('236', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:15:00');
INSERT INTO `schedule_job_log` VALUES ('237', '6', 'taskBean', 'test', 'test', '0', null, '1033', '2018-09-21 10:15:30');
INSERT INTO `schedule_job_log` VALUES ('238', '6', 'taskBean', 'test', 'test', '0', null, '1012', '2018-09-21 10:16:00');
INSERT INTO `schedule_job_log` VALUES ('239', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:16:30');
INSERT INTO `schedule_job_log` VALUES ('240', '6', 'taskBean', 'test', 'test', '0', null, '1030', '2018-09-21 10:17:00');
INSERT INTO `schedule_job_log` VALUES ('241', '6', 'taskBean', 'test', 'test', '0', null, '1007', '2018-09-21 10:17:30');
INSERT INTO `schedule_job_log` VALUES ('242', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:18:00');
INSERT INTO `schedule_job_log` VALUES ('243', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:18:30');
INSERT INTO `schedule_job_log` VALUES ('244', '6', 'taskBean', 'test', 'test', '0', null, '1013', '2018-09-21 10:19:00');
INSERT INTO `schedule_job_log` VALUES ('245', '6', 'taskBean', 'test', 'test', '0', null, '1016', '2018-09-21 10:19:30');
INSERT INTO `schedule_job_log` VALUES ('246', '6', 'taskBean', 'test', 'test', '0', null, '1015', '2018-09-21 10:20:00');
INSERT INTO `schedule_job_log` VALUES ('247', '6', 'taskBean', 'test', 'test', '0', null, '1013', '2018-09-21 10:20:30');
INSERT INTO `schedule_job_log` VALUES ('248', '6', 'taskBean', 'test', 'test', '0', null, '1018', '2018-09-21 10:21:00');
INSERT INTO `schedule_job_log` VALUES ('249', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:21:30');
INSERT INTO `schedule_job_log` VALUES ('250', '6', 'taskBean', 'test', 'test', '0', null, '1117', '2018-09-21 10:22:00');
INSERT INTO `schedule_job_log` VALUES ('251', '6', 'taskBean', 'test', 'test', '0', null, '1028', '2018-09-21 10:22:30');
INSERT INTO `schedule_job_log` VALUES ('252', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:23:00');
INSERT INTO `schedule_job_log` VALUES ('253', '6', 'taskBean', 'test', 'test', '0', null, '1015', '2018-09-21 10:23:30');
INSERT INTO `schedule_job_log` VALUES ('254', '6', 'taskBean', 'test', 'test', '0', null, '1017', '2018-09-21 10:24:00');
INSERT INTO `schedule_job_log` VALUES ('255', '6', 'taskBean', 'test', 'test', '0', null, '1011', '2018-09-21 10:24:30');
INSERT INTO `schedule_job_log` VALUES ('256', '6', 'taskBean', 'test', 'test', '0', null, '1044', '2018-09-21 10:25:00');
INSERT INTO `schedule_job_log` VALUES ('257', '6', 'taskBean', 'test', 'test', '0', null, '1094', '2018-09-21 10:25:30');
INSERT INTO `schedule_job_log` VALUES ('258', '6', 'taskBean', 'test', 'test', '0', null, '1092', '2018-09-21 10:26:00');
INSERT INTO `schedule_job_log` VALUES ('259', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:26:30');
INSERT INTO `schedule_job_log` VALUES ('260', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:27:00');
INSERT INTO `schedule_job_log` VALUES ('261', '6', 'taskBean', 'test', 'test', '0', null, '1083', '2018-09-21 10:27:30');
INSERT INTO `schedule_job_log` VALUES ('262', '6', 'taskBean', 'test', 'test', '0', null, '1050', '2018-09-21 10:28:00');
INSERT INTO `schedule_job_log` VALUES ('263', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:28:30');
INSERT INTO `schedule_job_log` VALUES ('264', '6', 'taskBean', 'test', 'test', '0', null, '1186', '2018-09-21 10:29:00');
INSERT INTO `schedule_job_log` VALUES ('265', '6', 'taskBean', 'test', 'test', '0', null, '1006', '2018-09-21 10:29:30');
INSERT INTO `schedule_job_log` VALUES ('266', '6', 'taskBean', 'test', 'test', '0', null, '1082', '2018-09-21 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('267', '6', 'taskBean', 'test', 'test', '0', null, '1013', '2018-09-21 10:30:30');
INSERT INTO `schedule_job_log` VALUES ('268', '6', 'taskBean', 'test', 'test', '0', null, '1052', '2018-09-21 10:31:00');
INSERT INTO `schedule_job_log` VALUES ('269', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:31:30');
INSERT INTO `schedule_job_log` VALUES ('270', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:32:00');
INSERT INTO `schedule_job_log` VALUES ('271', '6', 'taskBean', 'test', 'test', '0', null, '1007', '2018-09-21 10:32:30');
INSERT INTO `schedule_job_log` VALUES ('272', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:33:00');
INSERT INTO `schedule_job_log` VALUES ('273', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 10:33:30');
INSERT INTO `schedule_job_log` VALUES ('274', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:34:00');
INSERT INTO `schedule_job_log` VALUES ('275', '6', 'taskBean', 'test', 'test', '0', null, '1009', '2018-09-21 10:34:30');
INSERT INTO `schedule_job_log` VALUES ('276', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:35:00');
INSERT INTO `schedule_job_log` VALUES ('277', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:35:30');
INSERT INTO `schedule_job_log` VALUES ('278', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:36:00');
INSERT INTO `schedule_job_log` VALUES ('279', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:36:30');
INSERT INTO `schedule_job_log` VALUES ('280', '6', 'taskBean', 'test', 'test', '0', null, '1022', '2018-09-21 10:37:00');
INSERT INTO `schedule_job_log` VALUES ('281', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:37:30');
INSERT INTO `schedule_job_log` VALUES ('282', '6', 'taskBean', 'test', 'test', '0', null, '1013', '2018-09-21 10:38:00');
INSERT INTO `schedule_job_log` VALUES ('283', '6', 'taskBean', 'test', 'test', '0', null, '1051', '2018-09-21 10:38:30');
INSERT INTO `schedule_job_log` VALUES ('284', '6', 'taskBean', 'test', 'test', '0', null, '1019', '2018-09-21 10:39:00');
INSERT INTO `schedule_job_log` VALUES ('285', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:39:30');
INSERT INTO `schedule_job_log` VALUES ('286', '6', 'taskBean', 'test', 'test', '0', null, '1129', '2018-09-21 10:40:00');
INSERT INTO `schedule_job_log` VALUES ('287', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 10:40:30');
INSERT INTO `schedule_job_log` VALUES ('288', '6', 'taskBean', 'test', 'test', '0', null, '1017', '2018-09-21 10:41:00');
INSERT INTO `schedule_job_log` VALUES ('289', '6', 'taskBean', 'test', 'test', '0', null, '1008', '2018-09-21 10:41:30');
INSERT INTO `schedule_job_log` VALUES ('290', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 10:42:00');
INSERT INTO `schedule_job_log` VALUES ('291', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:42:30');
INSERT INTO `schedule_job_log` VALUES ('292', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 10:43:00');
INSERT INTO `schedule_job_log` VALUES ('293', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:43:30');
INSERT INTO `schedule_job_log` VALUES ('294', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:44:00');
INSERT INTO `schedule_job_log` VALUES ('295', '6', 'taskBean', 'test', 'test', '0', null, '9137', '2018-09-21 10:44:30');
INSERT INTO `schedule_job_log` VALUES ('296', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:45:00');
INSERT INTO `schedule_job_log` VALUES ('297', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 10:45:30');
INSERT INTO `schedule_job_log` VALUES ('298', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:46:00');
INSERT INTO `schedule_job_log` VALUES ('299', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:46:30');
INSERT INTO `schedule_job_log` VALUES ('300', '6', 'taskBean', 'test', 'test', '0', null, '1064', '2018-09-21 10:47:00');
INSERT INTO `schedule_job_log` VALUES ('301', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:47:30');
INSERT INTO `schedule_job_log` VALUES ('302', '6', 'taskBean', 'test', 'test', '0', null, '1007', '2018-09-21 10:48:00');
INSERT INTO `schedule_job_log` VALUES ('303', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:48:30');
INSERT INTO `schedule_job_log` VALUES ('304', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 10:49:00');
INSERT INTO `schedule_job_log` VALUES ('305', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:49:30');
INSERT INTO `schedule_job_log` VALUES ('306', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:50:00');
INSERT INTO `schedule_job_log` VALUES ('307', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:50:30');
INSERT INTO `schedule_job_log` VALUES ('308', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 10:51:00');
INSERT INTO `schedule_job_log` VALUES ('309', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:51:30');
INSERT INTO `schedule_job_log` VALUES ('310', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:52:00');
INSERT INTO `schedule_job_log` VALUES ('311', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:52:30');
INSERT INTO `schedule_job_log` VALUES ('312', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:53:00');
INSERT INTO `schedule_job_log` VALUES ('313', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:53:30');
INSERT INTO `schedule_job_log` VALUES ('314', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 10:54:00');
INSERT INTO `schedule_job_log` VALUES ('315', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 10:54:30');
INSERT INTO `schedule_job_log` VALUES ('316', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:55:00');
INSERT INTO `schedule_job_log` VALUES ('317', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:55:30');
INSERT INTO `schedule_job_log` VALUES ('318', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 10:56:00');
INSERT INTO `schedule_job_log` VALUES ('319', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:56:30');
INSERT INTO `schedule_job_log` VALUES ('320', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:57:05');
INSERT INTO `schedule_job_log` VALUES ('321', '6', 'taskBean', 'test', 'test', '0', null, '1005', '2018-09-21 10:57:30');
INSERT INTO `schedule_job_log` VALUES ('322', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:58:00');
INSERT INTO `schedule_job_log` VALUES ('323', '6', 'taskBean', 'test', 'test', '0', null, '1004', '2018-09-21 10:58:30');
INSERT INTO `schedule_job_log` VALUES ('324', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 10:59:00');
INSERT INTO `schedule_job_log` VALUES ('325', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 10:59:30');
INSERT INTO `schedule_job_log` VALUES ('326', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('327', '6', 'taskBean', 'test', 'test', '0', null, '1031', '2018-09-21 11:00:30');
INSERT INTO `schedule_job_log` VALUES ('328', '6', 'taskBean', 'test', 'test', '0', null, '1008', '2018-09-21 11:01:00');
INSERT INTO `schedule_job_log` VALUES ('329', '6', 'taskBean', 'test', 'test', '0', null, '1009', '2018-09-21 11:01:30');
INSERT INTO `schedule_job_log` VALUES ('330', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:02:00');
INSERT INTO `schedule_job_log` VALUES ('331', '6', 'taskBean', 'test', 'test', '0', null, '1014', '2018-09-21 11:02:30');
INSERT INTO `schedule_job_log` VALUES ('332', '6', 'taskBean', 'test', 'test', '0', null, '1011', '2018-09-21 11:03:00');
INSERT INTO `schedule_job_log` VALUES ('333', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-21 11:03:30');
INSERT INTO `schedule_job_log` VALUES ('334', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:04:00');
INSERT INTO `schedule_job_log` VALUES ('335', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:04:30');
INSERT INTO `schedule_job_log` VALUES ('336', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 11:05:00');
INSERT INTO `schedule_job_log` VALUES ('337', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 11:05:30');
INSERT INTO `schedule_job_log` VALUES ('338', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 11:06:00');
INSERT INTO `schedule_job_log` VALUES ('339', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:06:30');
INSERT INTO `schedule_job_log` VALUES ('340', '6', 'taskBean', 'test', 'test', '0', null, '1019', '2018-09-21 11:07:00');
INSERT INTO `schedule_job_log` VALUES ('341', '6', 'taskBean', 'test', 'test', '0', null, '1111', '2018-09-21 11:07:30');
INSERT INTO `schedule_job_log` VALUES ('342', '6', 'taskBean', 'test', 'test', '0', null, '1052', '2018-09-21 11:08:00');
INSERT INTO `schedule_job_log` VALUES ('343', '6', 'taskBean', 'test', 'test', '0', null, '1016', '2018-09-21 11:08:30');
INSERT INTO `schedule_job_log` VALUES ('344', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 11:09:00');
INSERT INTO `schedule_job_log` VALUES ('345', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:09:30');
INSERT INTO `schedule_job_log` VALUES ('346', '6', 'taskBean', 'test', 'test', '0', null, '1044', '2018-09-21 11:10:00');
INSERT INTO `schedule_job_log` VALUES ('347', '6', 'taskBean', 'test', 'test', '0', null, '1019', '2018-09-21 11:10:30');
INSERT INTO `schedule_job_log` VALUES ('348', '6', 'taskBean', 'test', 'test', '0', null, '1010', '2018-09-21 11:11:00');
INSERT INTO `schedule_job_log` VALUES ('349', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:11:30');
INSERT INTO `schedule_job_log` VALUES ('350', '6', 'taskBean', 'test', 'test', '0', null, '1030', '2018-09-21 11:12:00');
INSERT INTO `schedule_job_log` VALUES ('351', '6', 'taskBean', 'test', 'test', '0', null, '1006', '2018-09-21 11:12:30');
INSERT INTO `schedule_job_log` VALUES ('352', '6', 'taskBean', 'test', 'test', '0', null, '1069', '2018-09-21 11:13:00');
INSERT INTO `schedule_job_log` VALUES ('353', '6', 'taskBean', 'test', 'test', '0', null, '1043', '2018-09-21 11:13:30');
INSERT INTO `schedule_job_log` VALUES ('354', '6', 'taskBean', 'test', 'test', '0', null, '1008', '2018-09-21 11:14:00');
INSERT INTO `schedule_job_log` VALUES ('355', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 11:14:30');
INSERT INTO `schedule_job_log` VALUES ('356', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:15:00');
INSERT INTO `schedule_job_log` VALUES ('357', '6', 'taskBean', 'test', 'test', '0', null, '1011', '2018-09-21 11:15:30');
INSERT INTO `schedule_job_log` VALUES ('358', '6', 'taskBean', 'test', 'test', '0', null, '1104', '2018-09-21 11:16:00');
INSERT INTO `schedule_job_log` VALUES ('359', '6', 'taskBean', 'test', 'test', '0', null, '1021', '2018-09-21 11:16:30');
INSERT INTO `schedule_job_log` VALUES ('360', '6', 'taskBean', 'test', 'test', '0', null, '1029', '2018-09-21 11:17:00');
INSERT INTO `schedule_job_log` VALUES ('361', '6', 'taskBean', 'test', 'test', '0', null, '1074', '2018-09-21 11:17:30');
INSERT INTO `schedule_job_log` VALUES ('362', '6', 'taskBean', 'test', 'test', '0', null, '1073', '2018-09-21 11:18:00');
INSERT INTO `schedule_job_log` VALUES ('363', '6', 'taskBean', 'test', 'test', '0', null, '1160', '2018-09-21 11:18:30');
INSERT INTO `schedule_job_log` VALUES ('364', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:19:00');
INSERT INTO `schedule_job_log` VALUES ('365', '6', 'taskBean', 'test', 'test', '0', null, '1029', '2018-09-21 11:19:30');
INSERT INTO `schedule_job_log` VALUES ('366', '6', 'taskBean', 'test', 'test', '0', null, '1046', '2018-09-21 11:20:00');
INSERT INTO `schedule_job_log` VALUES ('367', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 11:20:30');
INSERT INTO `schedule_job_log` VALUES ('368', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:21:00');
INSERT INTO `schedule_job_log` VALUES ('369', '6', 'taskBean', 'test', 'test', '0', null, '1010', '2018-09-21 11:21:30');
INSERT INTO `schedule_job_log` VALUES ('370', '6', 'taskBean', 'test', 'test', '0', null, '1007', '2018-09-21 11:22:00');
INSERT INTO `schedule_job_log` VALUES ('371', '6', 'taskBean', 'test', 'test', '0', null, '1166', '2018-09-21 11:22:30');
INSERT INTO `schedule_job_log` VALUES ('372', '6', 'taskBean', 'test', 'test', '0', null, '1059', '2018-09-21 11:23:00');
INSERT INTO `schedule_job_log` VALUES ('373', '6', 'taskBean', 'test', 'test', '0', null, '1018', '2018-09-21 11:23:30');
INSERT INTO `schedule_job_log` VALUES ('374', '6', 'taskBean', 'test', 'test', '0', null, '1024', '2018-09-21 11:24:00');
INSERT INTO `schedule_job_log` VALUES ('375', '6', 'taskBean', 'test', 'test', '0', null, '1012', '2018-09-21 11:24:30');
INSERT INTO `schedule_job_log` VALUES ('376', '6', 'taskBean', 'test', 'test', '0', null, '1038', '2018-09-21 11:25:00');
INSERT INTO `schedule_job_log` VALUES ('377', '6', 'taskBean', 'test', 'test', '0', null, '1049', '2018-09-21 11:25:30');
INSERT INTO `schedule_job_log` VALUES ('378', '6', 'taskBean', 'test', 'test', '0', null, '1006', '2018-09-21 11:26:00');
INSERT INTO `schedule_job_log` VALUES ('379', '6', 'taskBean', 'test', 'test', '0', null, '1015', '2018-09-21 11:26:30');
INSERT INTO `schedule_job_log` VALUES ('380', '6', 'taskBean', 'test', 'test', '0', null, '1043', '2018-09-21 11:27:00');
INSERT INTO `schedule_job_log` VALUES ('381', '6', 'taskBean', 'test', 'test', '0', null, '1027', '2018-09-21 11:27:30');
INSERT INTO `schedule_job_log` VALUES ('382', '6', 'taskBean', 'test', 'test', '0', null, '1145', '2018-09-21 11:28:00');
INSERT INTO `schedule_job_log` VALUES ('383', '6', 'taskBean', 'test', 'test', '0', null, '1117', '2018-09-21 11:28:30');
INSERT INTO `schedule_job_log` VALUES ('384', '6', 'taskBean', 'test', 'test', '0', null, '1021', '2018-09-21 11:29:00');
INSERT INTO `schedule_job_log` VALUES ('385', '6', 'taskBean', 'test', 'test', '0', null, '1028', '2018-09-21 11:29:30');
INSERT INTO `schedule_job_log` VALUES ('386', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('387', '6', 'taskBean', 'test', 'test', '0', null, '1012', '2018-09-21 11:30:30');
INSERT INTO `schedule_job_log` VALUES ('388', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:31:00');
INSERT INTO `schedule_job_log` VALUES ('389', '6', 'taskBean', 'test', 'test', '0', null, '1010', '2018-09-21 11:31:30');
INSERT INTO `schedule_job_log` VALUES ('390', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:32:00');
INSERT INTO `schedule_job_log` VALUES ('391', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:32:30');
INSERT INTO `schedule_job_log` VALUES ('392', '6', 'taskBean', 'test', 'test', '0', null, '1017', '2018-09-21 11:33:00');
INSERT INTO `schedule_job_log` VALUES ('393', '6', 'taskBean', 'test', 'test', '0', null, '1009', '2018-09-21 11:33:30');
INSERT INTO `schedule_job_log` VALUES ('394', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 11:34:00');
INSERT INTO `schedule_job_log` VALUES ('395', '6', 'taskBean', 'test', 'test', '0', null, '1010', '2018-09-21 11:34:30');
INSERT INTO `schedule_job_log` VALUES ('396', '6', 'taskBean', 'test', 'test', '0', null, '1011', '2018-09-21 11:35:00');
INSERT INTO `schedule_job_log` VALUES ('397', '6', 'taskBean', 'test', 'test', '0', null, '1007', '2018-09-21 11:35:30');
INSERT INTO `schedule_job_log` VALUES ('398', '6', 'taskBean', 'test', 'test', '0', null, '1051', '2018-09-21 11:36:00');
INSERT INTO `schedule_job_log` VALUES ('399', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 11:36:30');
INSERT INTO `schedule_job_log` VALUES ('400', '6', 'taskBean', 'test', 'test', '0', null, '1054', '2018-09-21 11:37:00');
INSERT INTO `schedule_job_log` VALUES ('401', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:37:30');
INSERT INTO `schedule_job_log` VALUES ('402', '6', 'taskBean', 'test', 'test', '0', null, '1015', '2018-09-21 11:38:00');
INSERT INTO `schedule_job_log` VALUES ('403', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 11:38:30');
INSERT INTO `schedule_job_log` VALUES ('404', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:39:00');
INSERT INTO `schedule_job_log` VALUES ('405', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 11:39:30');
INSERT INTO `schedule_job_log` VALUES ('406', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 11:40:00');
INSERT INTO `schedule_job_log` VALUES ('407', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 11:40:30');
INSERT INTO `schedule_job_log` VALUES ('408', '6', 'taskBean', 'test', 'test', '0', null, '1012', '2018-09-21 11:41:00');
INSERT INTO `schedule_job_log` VALUES ('409', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:41:30');
INSERT INTO `schedule_job_log` VALUES ('410', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:42:00');
INSERT INTO `schedule_job_log` VALUES ('411', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-21 11:42:30');
INSERT INTO `schedule_job_log` VALUES ('412', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:43:00');
INSERT INTO `schedule_job_log` VALUES ('413', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:43:30');
INSERT INTO `schedule_job_log` VALUES ('414', '6', 'taskBean', 'test', 'test', '0', null, '1079', '2018-09-21 11:44:00');
INSERT INTO `schedule_job_log` VALUES ('415', '6', 'taskBean', 'test', 'test', '0', null, '1016', '2018-09-21 11:44:30');
INSERT INTO `schedule_job_log` VALUES ('416', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 11:45:00');
INSERT INTO `schedule_job_log` VALUES ('417', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-21 11:45:30');
INSERT INTO `schedule_job_log` VALUES ('418', '6', 'taskBean', 'test', 'test', '0', null, '1023', '2018-09-21 11:46:00');
INSERT INTO `schedule_job_log` VALUES ('419', '6', 'taskBean', 'test', 'test', '0', null, '1008', '2018-09-21 11:46:30');
INSERT INTO `schedule_job_log` VALUES ('420', '6', 'taskBean', 'test', 'test', '0', null, '1091', '2018-09-21 11:47:00');
INSERT INTO `schedule_job_log` VALUES ('421', '6', 'taskBean', 'test', 'test', '0', null, '1043', '2018-09-21 11:47:30');
INSERT INTO `schedule_job_log` VALUES ('422', '6', 'taskBean', 'test', 'test', '0', null, '1007', '2018-09-21 11:48:00');
INSERT INTO `schedule_job_log` VALUES ('423', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:48:30');
INSERT INTO `schedule_job_log` VALUES ('424', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-21 11:49:00');
INSERT INTO `schedule_job_log` VALUES ('425', '6', 'taskBean', 'test', 'test', '0', null, '1009', '2018-09-21 11:49:30');
INSERT INTO `schedule_job_log` VALUES ('426', '6', 'taskBean', 'test', 'test', '0', null, '1066', '2018-09-21 11:50:00');
INSERT INTO `schedule_job_log` VALUES ('427', '6', 'taskBean', 'test', 'test', '0', null, '1016', '2018-09-21 11:50:30');
INSERT INTO `schedule_job_log` VALUES ('428', '6', 'taskBean', 'test', 'test', '0', null, '1143', '2018-09-21 11:51:00');
INSERT INTO `schedule_job_log` VALUES ('429', '6', 'taskBean', 'test', 'test', '0', null, '1106', '2018-09-21 11:51:30');
INSERT INTO `schedule_job_log` VALUES ('430', '6', 'taskBean', 'test', 'test', '0', null, '1028', '2018-09-21 11:52:00');
INSERT INTO `schedule_job_log` VALUES ('431', '6', 'taskBean', 'test', 'test', '0', null, '1012', '2018-09-21 11:52:30');
INSERT INTO `schedule_job_log` VALUES ('432', '6', 'taskBean', 'test', 'test', '0', null, '1031', '2018-09-21 11:53:01');
INSERT INTO `schedule_job_log` VALUES ('433', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-21 11:53:30');
INSERT INTO `schedule_job_log` VALUES ('434', '6', 'taskBean', 'test', 'test', '0', null, '1130', '2018-09-21 11:54:00');
INSERT INTO `schedule_job_log` VALUES ('435', '6', 'taskBean', 'test', 'test', '0', null, '1219', '2018-09-21 11:54:30');
INSERT INTO `schedule_job_log` VALUES ('436', '6', 'taskBean', 'test', 'test', '0', null, '1005', '2018-09-25 15:01:30');
INSERT INTO `schedule_job_log` VALUES ('437', '6', 'taskBean', 'test', 'test', '0', null, '1005', '2018-09-25 15:03:30');
INSERT INTO `schedule_job_log` VALUES ('438', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 15:04:00');
INSERT INTO `schedule_job_log` VALUES ('439', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:04:30');
INSERT INTO `schedule_job_log` VALUES ('440', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 15:05:00');
INSERT INTO `schedule_job_log` VALUES ('441', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 15:05:30');
INSERT INTO `schedule_job_log` VALUES ('442', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 15:06:00');
INSERT INTO `schedule_job_log` VALUES ('443', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 15:06:30');
INSERT INTO `schedule_job_log` VALUES ('444', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:07:00');
INSERT INTO `schedule_job_log` VALUES ('445', '6', 'taskBean', 'test', 'test', '0', null, '1009', '2018-09-25 15:07:30');
INSERT INTO `schedule_job_log` VALUES ('446', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:08:00');
INSERT INTO `schedule_job_log` VALUES ('447', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:08:30');
INSERT INTO `schedule_job_log` VALUES ('448', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:09:00');
INSERT INTO `schedule_job_log` VALUES ('449', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:09:30');
INSERT INTO `schedule_job_log` VALUES ('450', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:10:00');
INSERT INTO `schedule_job_log` VALUES ('451', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:10:30');
INSERT INTO `schedule_job_log` VALUES ('452', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:11:00');
INSERT INTO `schedule_job_log` VALUES ('453', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:11:30');
INSERT INTO `schedule_job_log` VALUES ('454', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 15:12:00');
INSERT INTO `schedule_job_log` VALUES ('455', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:12:30');
INSERT INTO `schedule_job_log` VALUES ('456', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:13:00');
INSERT INTO `schedule_job_log` VALUES ('457', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:13:30');
INSERT INTO `schedule_job_log` VALUES ('458', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 15:14:00');
INSERT INTO `schedule_job_log` VALUES ('459', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:14:30');
INSERT INTO `schedule_job_log` VALUES ('460', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:15:00');
INSERT INTO `schedule_job_log` VALUES ('461', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:15:30');
INSERT INTO `schedule_job_log` VALUES ('462', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:16:00');
INSERT INTO `schedule_job_log` VALUES ('463', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:16:30');
INSERT INTO `schedule_job_log` VALUES ('464', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:17:00');
INSERT INTO `schedule_job_log` VALUES ('465', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:17:30');
INSERT INTO `schedule_job_log` VALUES ('466', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 15:18:00');
INSERT INTO `schedule_job_log` VALUES ('467', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:18:30');
INSERT INTO `schedule_job_log` VALUES ('468', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:19:00');
INSERT INTO `schedule_job_log` VALUES ('469', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:19:30');
INSERT INTO `schedule_job_log` VALUES ('470', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:20:00');
INSERT INTO `schedule_job_log` VALUES ('471', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:20:30');
INSERT INTO `schedule_job_log` VALUES ('472', '6', 'taskBean', 'test', 'test', '0', null, '1018', '2018-09-25 15:21:00');
INSERT INTO `schedule_job_log` VALUES ('473', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:21:30');
INSERT INTO `schedule_job_log` VALUES ('474', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 15:22:00');
INSERT INTO `schedule_job_log` VALUES ('475', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 15:22:30');
INSERT INTO `schedule_job_log` VALUES ('476', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:23:00');
INSERT INTO `schedule_job_log` VALUES ('477', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:23:50');
INSERT INTO `schedule_job_log` VALUES ('478', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:24:00');
INSERT INTO `schedule_job_log` VALUES ('479', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:24:30');
INSERT INTO `schedule_job_log` VALUES ('480', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:25:00');
INSERT INTO `schedule_job_log` VALUES ('481', '6', 'taskBean', 'test', 'test', '0', null, '75584', '2018-09-25 15:25:30');
INSERT INTO `schedule_job_log` VALUES ('482', '6', 'taskBean', 'test', 'test', '0', null, '1005', '2018-09-25 15:30:30');
INSERT INTO `schedule_job_log` VALUES ('483', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 15:31:30');
INSERT INTO `schedule_job_log` VALUES ('484', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:32:00');
INSERT INTO `schedule_job_log` VALUES ('485', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:32:30');
INSERT INTO `schedule_job_log` VALUES ('486', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:33:00');
INSERT INTO `schedule_job_log` VALUES ('487', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:33:30');
INSERT INTO `schedule_job_log` VALUES ('488', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:34:00');
INSERT INTO `schedule_job_log` VALUES ('489', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:35:30');
INSERT INTO `schedule_job_log` VALUES ('490', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:36:00');
INSERT INTO `schedule_job_log` VALUES ('491', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:36:30');
INSERT INTO `schedule_job_log` VALUES ('492', '6', 'taskBean', 'test', 'test', '0', null, '1020', '2018-09-25 15:37:00');
INSERT INTO `schedule_job_log` VALUES ('493', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 15:37:30');
INSERT INTO `schedule_job_log` VALUES ('494', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:38:00');
INSERT INTO `schedule_job_log` VALUES ('495', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:38:30');
INSERT INTO `schedule_job_log` VALUES ('496', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:39:00');
INSERT INTO `schedule_job_log` VALUES ('497', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 15:40:30');
INSERT INTO `schedule_job_log` VALUES ('498', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:41:00');
INSERT INTO `schedule_job_log` VALUES ('499', '6', 'taskBean', 'test', 'test', '0', null, '1006', '2018-09-25 15:42:30');
INSERT INTO `schedule_job_log` VALUES ('500', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:43:00');
INSERT INTO `schedule_job_log` VALUES ('501', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 15:43:30');
INSERT INTO `schedule_job_log` VALUES ('502', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:44:00');
INSERT INTO `schedule_job_log` VALUES ('503', '6', 'taskBean', 'test', 'test', '0', null, '1024', '2018-09-25 15:46:30');
INSERT INTO `schedule_job_log` VALUES ('504', '6', 'taskBean', 'test', 'test', '0', null, '1011', '2018-09-25 15:47:00');
INSERT INTO `schedule_job_log` VALUES ('505', '6', 'taskBean', 'test', 'test', '0', null, '1005', '2018-09-25 15:48:30');
INSERT INTO `schedule_job_log` VALUES ('506', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:49:00');
INSERT INTO `schedule_job_log` VALUES ('507', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:49:30');
INSERT INTO `schedule_job_log` VALUES ('508', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:50:00');
INSERT INTO `schedule_job_log` VALUES ('509', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:50:30');
INSERT INTO `schedule_job_log` VALUES ('510', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:51:00');
INSERT INTO `schedule_job_log` VALUES ('511', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:51:30');
INSERT INTO `schedule_job_log` VALUES ('512', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:52:00');
INSERT INTO `schedule_job_log` VALUES ('513', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 15:52:30');
INSERT INTO `schedule_job_log` VALUES ('514', '6', 'taskBean', 'test', 'test', '0', null, '1009', '2018-09-25 15:54:00');
INSERT INTO `schedule_job_log` VALUES ('515', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 15:54:30');
INSERT INTO `schedule_job_log` VALUES ('516', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:55:00');
INSERT INTO `schedule_job_log` VALUES ('517', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:55:30');
INSERT INTO `schedule_job_log` VALUES ('518', '6', 'taskBean', 'test', 'test', '0', null, '4618', '2018-09-25 15:56:00');
INSERT INTO `schedule_job_log` VALUES ('519', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 15:56:30');
INSERT INTO `schedule_job_log` VALUES ('520', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 15:57:00');
INSERT INTO `schedule_job_log` VALUES ('521', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:57:30');
INSERT INTO `schedule_job_log` VALUES ('522', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 15:58:00');
INSERT INTO `schedule_job_log` VALUES ('523', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:58:30');
INSERT INTO `schedule_job_log` VALUES ('524', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 15:59:00');
INSERT INTO `schedule_job_log` VALUES ('525', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 15:59:30');
INSERT INTO `schedule_job_log` VALUES ('526', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('527', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 16:00:30');
INSERT INTO `schedule_job_log` VALUES ('528', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:01:00');
INSERT INTO `schedule_job_log` VALUES ('529', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:01:30');
INSERT INTO `schedule_job_log` VALUES ('530', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:02:00');
INSERT INTO `schedule_job_log` VALUES ('531', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:02:30');
INSERT INTO `schedule_job_log` VALUES ('532', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:03:00');
INSERT INTO `schedule_job_log` VALUES ('533', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 16:03:30');
INSERT INTO `schedule_job_log` VALUES ('534', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:04:00');
INSERT INTO `schedule_job_log` VALUES ('535', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:04:30');
INSERT INTO `schedule_job_log` VALUES ('536', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:05:00');
INSERT INTO `schedule_job_log` VALUES ('537', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:05:30');
INSERT INTO `schedule_job_log` VALUES ('538', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:06:00');
INSERT INTO `schedule_job_log` VALUES ('539', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:06:30');
INSERT INTO `schedule_job_log` VALUES ('540', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:07:00');
INSERT INTO `schedule_job_log` VALUES ('541', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:07:30');
INSERT INTO `schedule_job_log` VALUES ('542', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:08:00');
INSERT INTO `schedule_job_log` VALUES ('543', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:08:30');
INSERT INTO `schedule_job_log` VALUES ('544', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 16:09:00');
INSERT INTO `schedule_job_log` VALUES ('545', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:09:30');
INSERT INTO `schedule_job_log` VALUES ('546', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 16:10:00');
INSERT INTO `schedule_job_log` VALUES ('547', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:10:30');
INSERT INTO `schedule_job_log` VALUES ('548', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:11:00');
INSERT INTO `schedule_job_log` VALUES ('549', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:11:30');
INSERT INTO `schedule_job_log` VALUES ('550', '6', 'taskBean', 'test', 'test', '0', null, '1019', '2018-09-25 16:12:00');
INSERT INTO `schedule_job_log` VALUES ('551', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:12:30');
INSERT INTO `schedule_job_log` VALUES ('552', '6', 'taskBean', 'test', 'test', '0', null, '1011', '2018-09-25 16:13:00');
INSERT INTO `schedule_job_log` VALUES ('553', '6', 'taskBean', 'test', 'test', '0', null, '1005', '2018-09-25 16:13:30');
INSERT INTO `schedule_job_log` VALUES ('554', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:14:00');
INSERT INTO `schedule_job_log` VALUES ('555', '6', 'taskBean', 'test', 'test', '0', null, '1007', '2018-09-25 16:14:30');
INSERT INTO `schedule_job_log` VALUES ('556', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:15:00');
INSERT INTO `schedule_job_log` VALUES ('557', '6', 'taskBean', 'test', 'test', '0', null, '1015', '2018-09-25 16:15:30');
INSERT INTO `schedule_job_log` VALUES ('558', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 16:16:00');
INSERT INTO `schedule_job_log` VALUES ('559', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 16:16:30');
INSERT INTO `schedule_job_log` VALUES ('560', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:17:00');
INSERT INTO `schedule_job_log` VALUES ('561', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:17:30');
INSERT INTO `schedule_job_log` VALUES ('562', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:18:00');
INSERT INTO `schedule_job_log` VALUES ('563', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:18:30');
INSERT INTO `schedule_job_log` VALUES ('564', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:19:00');
INSERT INTO `schedule_job_log` VALUES ('565', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:19:30');
INSERT INTO `schedule_job_log` VALUES ('566', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:20:00');
INSERT INTO `schedule_job_log` VALUES ('567', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 16:20:30');
INSERT INTO `schedule_job_log` VALUES ('568', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:21:00');
INSERT INTO `schedule_job_log` VALUES ('569', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 16:21:30');
INSERT INTO `schedule_job_log` VALUES ('570', '6', 'taskBean', 'test', 'test', '0', null, '1019', '2018-09-25 16:22:00');
INSERT INTO `schedule_job_log` VALUES ('571', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 16:22:30');
INSERT INTO `schedule_job_log` VALUES ('572', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:23:00');
INSERT INTO `schedule_job_log` VALUES ('573', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:23:30');
INSERT INTO `schedule_job_log` VALUES ('574', '6', 'taskBean', 'test', 'test', '0', null, '1007', '2018-09-25 16:24:00');
INSERT INTO `schedule_job_log` VALUES ('575', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:24:30');
INSERT INTO `schedule_job_log` VALUES ('576', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:25:00');
INSERT INTO `schedule_job_log` VALUES ('577', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:25:30');
INSERT INTO `schedule_job_log` VALUES ('578', '6', 'taskBean', 'test', 'test', '0', null, '98204', '2018-09-25 16:26:31');
INSERT INTO `schedule_job_log` VALUES ('579', '6', 'taskBean', 'test', 'test', '0', null, '8944', '2018-09-25 16:28:00');
INSERT INTO `schedule_job_log` VALUES ('580', '6', 'taskBean', 'test', 'test', '0', null, '68947', '2018-09-25 16:27:00');
INSERT INTO `schedule_job_log` VALUES ('581', '6', 'taskBean', 'test', 'test', '0', null, '38626', '2018-09-25 16:27:31');
INSERT INTO `schedule_job_log` VALUES ('582', '6', 'taskBean', 'test', 'test', '0', null, '129018', '2018-09-25 16:26:00');
INSERT INTO `schedule_job_log` VALUES ('583', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:28:30');
INSERT INTO `schedule_job_log` VALUES ('584', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:29:00');
INSERT INTO `schedule_job_log` VALUES ('585', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:29:30');
INSERT INTO `schedule_job_log` VALUES ('586', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('587', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:30:30');
INSERT INTO `schedule_job_log` VALUES ('588', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:31:00');
INSERT INTO `schedule_job_log` VALUES ('589', '6', 'taskBean', 'test', 'test', '0', null, '1038', '2018-09-25 16:31:30');
INSERT INTO `schedule_job_log` VALUES ('590', '6', 'taskBean', 'test', 'test', '0', null, '1061', '2018-09-25 16:32:00');
INSERT INTO `schedule_job_log` VALUES ('591', '6', 'taskBean', 'test', 'test', '0', null, '1085', '2018-09-25 16:32:30');
INSERT INTO `schedule_job_log` VALUES ('592', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:33:00');
INSERT INTO `schedule_job_log` VALUES ('593', '6', 'taskBean', 'test', 'test', '0', null, '1184', '2018-09-25 16:34:31');
INSERT INTO `schedule_job_log` VALUES ('594', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:36:24');
INSERT INTO `schedule_job_log` VALUES ('595', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 16:37:00');
INSERT INTO `schedule_job_log` VALUES ('596', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:37:30');
INSERT INTO `schedule_job_log` VALUES ('597', '6', 'taskBean', 'test', 'test', '0', null, '1005', '2018-09-25 16:38:00');
INSERT INTO `schedule_job_log` VALUES ('598', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:38:30');
INSERT INTO `schedule_job_log` VALUES ('599', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:39:00');
INSERT INTO `schedule_job_log` VALUES ('600', '6', 'taskBean', 'test', 'test', '0', null, '1004', '2018-09-25 16:39:30');
INSERT INTO `schedule_job_log` VALUES ('601', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:40:00');
INSERT INTO `schedule_job_log` VALUES ('602', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:40:30');
INSERT INTO `schedule_job_log` VALUES ('603', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:41:00');
INSERT INTO `schedule_job_log` VALUES ('604', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 16:41:30');
INSERT INTO `schedule_job_log` VALUES ('605', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:42:01');
INSERT INTO `schedule_job_log` VALUES ('606', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:42:30');
INSERT INTO `schedule_job_log` VALUES ('607', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:43:00');
INSERT INTO `schedule_job_log` VALUES ('608', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:43:30');
INSERT INTO `schedule_job_log` VALUES ('609', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:44:00');
INSERT INTO `schedule_job_log` VALUES ('610', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 16:44:30');
INSERT INTO `schedule_job_log` VALUES ('611', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:45:00');
INSERT INTO `schedule_job_log` VALUES ('612', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:45:30');
INSERT INTO `schedule_job_log` VALUES ('613', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:46:00');
INSERT INTO `schedule_job_log` VALUES ('614', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:46:30');
INSERT INTO `schedule_job_log` VALUES ('615', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 16:47:00');
INSERT INTO `schedule_job_log` VALUES ('616', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:47:30');
INSERT INTO `schedule_job_log` VALUES ('617', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:48:00');
INSERT INTO `schedule_job_log` VALUES ('618', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:48:30');
INSERT INTO `schedule_job_log` VALUES ('619', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 16:49:00');
INSERT INTO `schedule_job_log` VALUES ('620', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:49:30');
INSERT INTO `schedule_job_log` VALUES ('621', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:50:01');
INSERT INTO `schedule_job_log` VALUES ('622', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:50:30');
INSERT INTO `schedule_job_log` VALUES ('623', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:51:00');
INSERT INTO `schedule_job_log` VALUES ('624', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:51:30');
INSERT INTO `schedule_job_log` VALUES ('625', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 16:52:01');
INSERT INTO `schedule_job_log` VALUES ('626', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:52:30');
INSERT INTO `schedule_job_log` VALUES ('627', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 16:53:00');
INSERT INTO `schedule_job_log` VALUES ('628', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 16:53:30');
INSERT INTO `schedule_job_log` VALUES ('629', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 16:54:00');
INSERT INTO `schedule_job_log` VALUES ('630', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:54:30');
INSERT INTO `schedule_job_log` VALUES ('631', '6', 'taskBean', 'test', 'test', '0', null, '1004', '2018-09-25 16:55:00');
INSERT INTO `schedule_job_log` VALUES ('632', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 16:55:30');
INSERT INTO `schedule_job_log` VALUES ('633', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:56:00');
INSERT INTO `schedule_job_log` VALUES ('634', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:56:30');
INSERT INTO `schedule_job_log` VALUES ('635', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:57:00');
INSERT INTO `schedule_job_log` VALUES ('636', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:57:30');
INSERT INTO `schedule_job_log` VALUES ('637', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:58:00');
INSERT INTO `schedule_job_log` VALUES ('638', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 16:58:30');
INSERT INTO `schedule_job_log` VALUES ('639', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:59:00');
INSERT INTO `schedule_job_log` VALUES ('640', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 16:59:30');
INSERT INTO `schedule_job_log` VALUES ('641', '6', 'taskBean', 'test', 'test', '0', null, '1126', '2018-09-25 17:01:04');
INSERT INTO `schedule_job_log` VALUES ('642', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:01:30');
INSERT INTO `schedule_job_log` VALUES ('643', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:02:00');
INSERT INTO `schedule_job_log` VALUES ('644', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:02:30');
INSERT INTO `schedule_job_log` VALUES ('645', '6', 'taskBean', 'test', 'test', '0', null, '1076', '2018-09-25 17:03:08');
INSERT INTO `schedule_job_log` VALUES ('646', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:03:30');
INSERT INTO `schedule_job_log` VALUES ('647', '6', 'taskBean', 'test', 'test', '0', null, '1006', '2018-09-25 17:04:00');
INSERT INTO `schedule_job_log` VALUES ('648', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:04:30');
INSERT INTO `schedule_job_log` VALUES ('649', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:05:00');
INSERT INTO `schedule_job_log` VALUES ('650', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:05:30');
INSERT INTO `schedule_job_log` VALUES ('651', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:06:00');
INSERT INTO `schedule_job_log` VALUES ('652', '6', 'taskBean', 'test', 'test', '0', null, '1006', '2018-09-25 17:06:30');
INSERT INTO `schedule_job_log` VALUES ('653', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:07:00');
INSERT INTO `schedule_job_log` VALUES ('654', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:07:30');
INSERT INTO `schedule_job_log` VALUES ('655', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:08:00');
INSERT INTO `schedule_job_log` VALUES ('656', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:08:30');
INSERT INTO `schedule_job_log` VALUES ('657', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:09:00');
INSERT INTO `schedule_job_log` VALUES ('658', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 17:09:30');
INSERT INTO `schedule_job_log` VALUES ('659', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:10:00');
INSERT INTO `schedule_job_log` VALUES ('660', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:10:30');
INSERT INTO `schedule_job_log` VALUES ('661', '6', 'taskBean', 'test', 'test', '0', null, '1007', '2018-09-25 17:12:00');
INSERT INTO `schedule_job_log` VALUES ('662', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:12:30');
INSERT INTO `schedule_job_log` VALUES ('663', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:13:00');
INSERT INTO `schedule_job_log` VALUES ('664', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 17:13:30');
INSERT INTO `schedule_job_log` VALUES ('665', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:14:00');
INSERT INTO `schedule_job_log` VALUES ('666', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:14:30');
INSERT INTO `schedule_job_log` VALUES ('667', '6', 'taskBean', 'test', 'test', '0', null, '1005', '2018-09-25 17:15:00');
INSERT INTO `schedule_job_log` VALUES ('668', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:15:30');
INSERT INTO `schedule_job_log` VALUES ('669', '6', 'taskBean', 'test', 'test', '0', null, '1021', '2018-09-25 17:16:00');
INSERT INTO `schedule_job_log` VALUES ('670', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:16:30');
INSERT INTO `schedule_job_log` VALUES ('671', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:17:00');
INSERT INTO `schedule_job_log` VALUES ('672', '6', 'taskBean', 'test', 'test', '0', null, '1004', '2018-09-25 17:17:30');
INSERT INTO `schedule_job_log` VALUES ('673', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:18:00');
INSERT INTO `schedule_job_log` VALUES ('674', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:18:30');
INSERT INTO `schedule_job_log` VALUES ('675', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:19:00');
INSERT INTO `schedule_job_log` VALUES ('676', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 17:19:30');
INSERT INTO `schedule_job_log` VALUES ('677', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:20:00');
INSERT INTO `schedule_job_log` VALUES ('678', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 17:20:30');
INSERT INTO `schedule_job_log` VALUES ('679', '6', 'taskBean', 'test', 'test', '0', null, '1006', '2018-09-25 17:21:00');
INSERT INTO `schedule_job_log` VALUES ('680', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 17:21:30');
INSERT INTO `schedule_job_log` VALUES ('681', '6', 'taskBean', 'test', 'test', '0', null, '1005', '2018-09-25 17:22:00');
INSERT INTO `schedule_job_log` VALUES ('682', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 17:22:30');
INSERT INTO `schedule_job_log` VALUES ('683', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:23:00');
INSERT INTO `schedule_job_log` VALUES ('684', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 17:23:30');
INSERT INTO `schedule_job_log` VALUES ('685', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:24:00');
INSERT INTO `schedule_job_log` VALUES ('686', '6', 'taskBean', 'test', 'test', '0', null, '1007', '2018-09-25 17:24:30');
INSERT INTO `schedule_job_log` VALUES ('687', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:25:00');
INSERT INTO `schedule_job_log` VALUES ('688', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:25:30');
INSERT INTO `schedule_job_log` VALUES ('689', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:26:00');
INSERT INTO `schedule_job_log` VALUES ('690', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:26:30');
INSERT INTO `schedule_job_log` VALUES ('691', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:27:00');
INSERT INTO `schedule_job_log` VALUES ('692', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:27:30');
INSERT INTO `schedule_job_log` VALUES ('693', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:28:00');
INSERT INTO `schedule_job_log` VALUES ('694', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:28:30');
INSERT INTO `schedule_job_log` VALUES ('695', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:29:00');
INSERT INTO `schedule_job_log` VALUES ('696', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:29:30');
INSERT INTO `schedule_job_log` VALUES ('697', '6', 'taskBean', 'test', 'test', '0', null, '1004', '2018-09-25 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('698', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:30:30');
INSERT INTO `schedule_job_log` VALUES ('699', '6', 'taskBean', 'test', 'test', '0', null, '1003', '2018-09-25 17:31:00');
INSERT INTO `schedule_job_log` VALUES ('700', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:31:30');
INSERT INTO `schedule_job_log` VALUES ('701', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:32:00');
INSERT INTO `schedule_job_log` VALUES ('702', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:32:30');
INSERT INTO `schedule_job_log` VALUES ('703', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:33:00');
INSERT INTO `schedule_job_log` VALUES ('704', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:33:30');
INSERT INTO `schedule_job_log` VALUES ('705', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 17:34:00');
INSERT INTO `schedule_job_log` VALUES ('706', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:34:30');
INSERT INTO `schedule_job_log` VALUES ('707', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:35:00');
INSERT INTO `schedule_job_log` VALUES ('708', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 17:35:30');
INSERT INTO `schedule_job_log` VALUES ('709', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:36:00');
INSERT INTO `schedule_job_log` VALUES ('710', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 17:36:30');
INSERT INTO `schedule_job_log` VALUES ('711', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:37:00');
INSERT INTO `schedule_job_log` VALUES ('712', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 17:37:30');
INSERT INTO `schedule_job_log` VALUES ('713', '6', 'taskBean', 'test', 'test', '0', null, '1000', '2018-09-25 17:38:00');
INSERT INTO `schedule_job_log` VALUES ('714', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:38:30');
INSERT INTO `schedule_job_log` VALUES ('715', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 17:39:00');
INSERT INTO `schedule_job_log` VALUES ('716', '6', 'taskBean', 'test', 'test', '0', null, '1005', '2018-09-25 18:10:00');
INSERT INTO `schedule_job_log` VALUES ('717', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 18:10:30');
INSERT INTO `schedule_job_log` VALUES ('718', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 19:10:00');
INSERT INTO `schedule_job_log` VALUES ('719', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 19:10:30');
INSERT INTO `schedule_job_log` VALUES ('720', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 20:10:00');
INSERT INTO `schedule_job_log` VALUES ('721', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 20:10:30');
INSERT INTO `schedule_job_log` VALUES ('722', '6', 'taskBean', 'test', 'test', '0', null, '1001', '2018-09-25 21:10:00');
INSERT INTO `schedule_job_log` VALUES ('723', '6', 'taskBean', 'test', 'test', '0', null, '1002', '2018-09-25 21:10:30');

-- ----------------------------
-- Table structure for sys_action_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_action_log`;
CREATE TABLE `sys_action_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `url` varchar(256) NOT NULL COMMENT '请求地址',
  `customer_id` varchar(45) DEFAULT NULL COMMENT '客户编码',
  `ip` varchar(68) NOT NULL COMMENT 'ip地址',
  `function_name` varchar(256) NOT NULL COMMENT '接口名',
  `start_time` date DEFAULT NULL COMMENT '请求时间',
  `end_time` date DEFAULT NULL COMMENT '响应时间',
  `res_json` text COMMENT '响应内容',
  `req_json` text COMMENT '请求内容',
  `create_time` datetime NOT NULL COMMENT '日志保存时间',
  `company_id` varchar(6) DEFAULT NULL COMMENT '公司编码',
  `status` int(2) DEFAULT NULL COMMENT '状态 ，1：成功，0：失败',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请求日志';

-- ----------------------------
-- Records of sys_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父ID',
  `name` varchar(100) NOT NULL COMMENT '菜单名称',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) DEFAULT '1' COMMENT '是否显示\n1：显示\n0：隐藏',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(36) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('00e2ba481f4c4a3ea96261f74c2fa754', '09dd1000fab84630bb2a56457f3c9343', 'API文档', '1', null, 'el-icon-ali-wendangdocument65', '1', 'sys:doc:swagger', 'API文档', '2018-09-17 17:35:30', '1dc8f600508640688f150c6e04d5c324', null, null);
INSERT INTO `sys_menu` VALUES ('09dd1000fab84630bb2a56457f3c9343', '', '文档管理', '62', null, 'el-icon-ali-wendangzhongxin', '1', 'sys:doc', '文档中心', '2018-09-17 16:31:59', '1dc8f600508640688f150c6e04d5c324', '2018-09-17 17:37:19', '1dc8f600508640688f150c6e04d5c324');
INSERT INTO `sys_menu` VALUES ('39c3ef2efa9f4a228f04489546566867', '92', '定时任务', '31', null, 'el-icon-ali-clock', '1', 'sys:task', '定时任务', '2018-09-18 10:46:31', '1dc8f600508640688f150c6e04d5c324', '2018-09-19 17:27:30', '1dc8f600508640688f150c6e04d5c324');
INSERT INTO `sys_menu` VALUES ('39fdf6f013a1430d87619137e9b1d187', 'f2d7b9ff4bef4457946da825d822f62f', 'SQL监控', '1', null, 'el-icon-ali-jiankong', '1', 'sys:monitor:druid', 'sql监控', '2018-09-17 16:30:23', '1dc8f600508640688f150c6e04d5c324', null, null);
INSERT INTO `sys_menu` VALUES ('533c3d178b934743904c8fe4ba5113a4', '923', '新增', '1', null, 'el-icon-plus', '1', 'sys:user:add', '用户新增', '2018-09-12 14:29:22', '1dc8f600508640688f150c6e04d5c324', null, null);
INSERT INTO `sys_menu` VALUES ('5f0a6fd67773402ebcc925326f15acbd', '924', '删除', '42', null, 'el-icon-delete', '1', 'sys:role:delete', '角色删除', '2018-09-13 14:49:39', '1dc8f600508640688f150c6e04d5c324', null, null);
INSERT INTO `sys_menu` VALUES ('6de499e34a934891aa878f8e7228a6cf', '921', '新增', '41', null, 'el-icon-plus', '1', 'sys:menu:add', '菜单新增', '2018-09-13 14:46:34', '1dc8f600508640688f150c6e04d5c324', '2018-09-13 14:48:56', '1dc8f600508640688f150c6e04d5c324');
INSERT INTO `sys_menu` VALUES ('6fc2b92c910244e19ed7510f0a657888', '923', '删除', '2', null, 'el-icon-delete', '1', 'sys:user:delete', '用户删除', '2018-09-12 14:22:01', '1dc8f600508640688f150c6e04d5c324', null, null);
INSERT INTO `sys_menu` VALUES ('71', '', '首页', '1', 'app.dashboard', 'el-icon-ali-dashboard', '1', 'sys:dashboard', '', '2015-10-20 08:00:00', null, '2016-12-26 11:13:42', null);
INSERT INTO `sys_menu` VALUES ('92', '', '系统管理', '60', '', 'el-icon-ali-dataCenter', '1', 'sys:datacenter', '', '2015-10-20 08:00:00', null, '2018-09-17 17:37:01', '1dc8f600508640688f150c6e04d5c324');
INSERT INTO `sys_menu` VALUES ('921', '92', '菜单管理', '30', 'app.sys.menu.list', 'el-icon-ali-menu', '1', 'sys:menu', '', '2015-10-20 08:00:00', null, '2015-10-20 08:00:00', null);
INSERT INTO `sys_menu` VALUES ('9211', '921', '查看', '30', '', 'el-icon-search', '1', 'sys:menu:view', '菜单查看', '2015-10-20 08:00:00', null, '2018-09-13 13:57:36', '1dc8f600508640688f150c6e04d5c324');
INSERT INTO `sys_menu` VALUES ('9212', '921', '修改', '40', '', 'el-icon-edit', '1', 'sys:menu:edit', '', '2015-10-20 08:00:00', null, '2018-09-13 13:41:15', '1dc8f600508640688f150c6e04d5c324');
INSERT INTO `sys_menu` VALUES ('923', '92', '用户管理', '10', 'app.sys.user.list', 'el-icon-ali-user', '1', 'sys:user', '', '2015-10-20 08:00:00', null, '2016-10-09 16:11:37', null);
INSERT INTO `sys_menu` VALUES ('9231', '923', '查看', '30', '', 'el-icon-search', '1', 'sys:user:view', '', '2015-10-20 08:00:00', null, '2018-09-13 14:49:07', '1dc8f600508640688f150c6e04d5c324');
INSERT INTO `sys_menu` VALUES ('9232', '923', '修改', '40', '', 'el-icon-edit', '1', 'sys:user:edit', '', '2015-10-20 08:00:00', null, '2018-09-13 13:46:22', '1dc8f600508640688f150c6e04d5c324');
INSERT INTO `sys_menu` VALUES ('924', '92', '角色管理', '20', 'app.sys.role.list', 'el-icon-ali-role', '1', 'sys:role', '', '2015-10-20 08:00:00', null, '2018-09-13 13:46:10', '1dc8f600508640688f150c6e04d5c324');
INSERT INTO `sys_menu` VALUES ('9241', '924', '查看', '30', '', 'el-icon-search', '1', 'sys:role:view', '角色查看', '2015-10-20 08:00:00', null, '2018-09-13 14:49:03', '1dc8f600508640688f150c6e04d5c324');
INSERT INTO `sys_menu` VALUES ('9242', '924', '修改', '40', '', 'el-icon-edit', '1', 'sys:role:edit', '', '2015-10-20 08:00:00', null, '2018-09-13 13:46:17', '1dc8f600508640688f150c6e04d5c324');
INSERT INTO `sys_menu` VALUES ('a3c18a8421e0450eb6e0443a4155062d', '921', '删除', '42', null, 'el-icon-delete', '1', 'sys:menu:delete', '菜单删除', '2018-09-13 14:46:59', '1dc8f600508640688f150c6e04d5c324', '2018-09-13 14:48:53', '1dc8f600508640688f150c6e04d5c324');
INSERT INTO `sys_menu` VALUES ('f2d7b9ff4bef4457946da825d822f62f', '', '监控管理', '61', null, 'el-icon-ali-jiankongzhongxin', '1', 'sys:monitor', '监控中心', '2018-09-17 16:29:10', '1dc8f600508640688f150c6e04d5c324', '2018-09-17 17:37:12', '1dc8f600508640688f150c6e04d5c324');
INSERT INTO `sys_menu` VALUES ('fff5ba86f8104039b70e5e9ed83e027a', '924', '新增', '41', null, 'el-icon-plus', '1', 'sys:role:add', '角色新增', '2018-09-13 14:48:34', '1dc8f600508640688f150c6e04d5c324', '2018-09-13 14:48:47', '1dc8f600508640688f150c6e04d5c324');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user` varchar(36) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `enabled` char(1) DEFAULT '1' COMMENT '是否可用\n1：可用\n0：停用',
  `update_user` varchar(36) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'ROLE_ADMIN', '管理员角色', '1dc8f600508640688f150c6e04d5c324', '2016-10-09 15:13:21', '1', null, null);
INSERT INTO `sys_role` VALUES ('2', 'ROLE_USER', '用户角色', '1dc8f600508640688f150c6e04d5c324', '2016-10-09 15:13:24', '1', null, null);
INSERT INTO `sys_role` VALUES ('5f928dc1266643e8bf7189e7defc6bed', 'fsdfsd', 'fdsfds', '1dc8f600508640688f150c6e04d5c324', '2018-09-14 10:53:09', '1', null, null);
INSERT INTO `sys_role` VALUES ('ffa8325fbe0c4119a497cac2d71d1ab8', 'ROLE_EDIT', '我已经被修改了。', '1dc8f600508640688f150c6e04d5c324', '2018-08-10 17:40:53', '1', '1dc8f600508640688f150c6e04d5c324', '2018-08-14 11:09:49');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(36) NOT NULL COMMENT '角色ID',
  `menu_id` varchar(36) NOT NULL COMMENT '菜单ID',
  `checked` varchar(1) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '00e2ba481f4c4a3ea96261f74c2fa754', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '09dd1000fab84630bb2a56457f3c9343', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '39c3ef2efa9f4a228f04489546566867', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '39fdf6f013a1430d87619137e9b1d187', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '533c3d178b934743904c8fe4ba5113a4', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '5f0a6fd67773402ebcc925326f15acbd', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '6de499e34a934891aa878f8e7228a6cf', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '6fc2b92c910244e19ed7510f0a657888', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '71', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '92', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '921', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '9211', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '9212', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '923', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '9231', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '9232', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '924', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '9241', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '9242', '1');
INSERT INTO `sys_role_menu` VALUES ('1', 'a3c18a8421e0450eb6e0443a4155062d', '1');
INSERT INTO `sys_role_menu` VALUES ('1', 'f2d7b9ff4bef4457946da825d822f62f', '1');
INSERT INTO `sys_role_menu` VALUES ('1', 'fff5ba86f8104039b70e5e9ed83e027a', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '533c3d178b934743904c8fe4ba5113a4', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '6fc2b92c910244e19ed7510f0a657888', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '71', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '92', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '923', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '9231', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '9232', '1');
INSERT INTO `sys_role_menu` VALUES ('5f928dc1266643e8bf7189e7defc6bed', '533c3d178b934743904c8fe4ba5113a4', '1');
INSERT INTO `sys_role_menu` VALUES ('5f928dc1266643e8bf7189e7defc6bed', '7366c24534224c23ae53dba2ce57bc2f', '1');
INSERT INTO `sys_role_menu` VALUES ('5f928dc1266643e8bf7189e7defc6bed', '92', '0');
INSERT INTO `sys_role_menu` VALUES ('5f928dc1266643e8bf7189e7defc6bed', '923', '0');
INSERT INTO `sys_role_menu` VALUES ('ffa8325fbe0c4119a497cac2d71d1ab8', '533c3d178b934743904c8fe4ba5113a4', '1');
INSERT INTO `sys_role_menu` VALUES ('ffa8325fbe0c4119a497cac2d71d1ab8', '6fc2b92c910244e19ed7510f0a657888', '1');
INSERT INTO `sys_role_menu` VALUES ('ffa8325fbe0c4119a497cac2d71d1ab8', '71', '1');
INSERT INTO `sys_role_menu` VALUES ('ffa8325fbe0c4119a497cac2d71d1ab8', '92', '0');
INSERT INTO `sys_role_menu` VALUES ('ffa8325fbe0c4119a497cac2d71d1ab8', '923', '0');

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
INSERT INTO `sys_user` VALUES ('1dc8f600508640688f150c6e04d5c324', 'admin', '$2a$08$onHA58Qvc93qOZZNUTev4e89YRuRtfxrOM9F35WgLEwY84eGffy9W', 'admin', '295277302@qq.com', '124123123', '188299923', '1', '12312', '2018-08-08 15:13:56', '2018-09-17 14:55:21', null);
INSERT INTO `sys_user` VALUES ('1dc8f600508640688f150c6e04d5c953', 'admin1', '$2a$10$ZD6xxT.zFlxgzJxz6LCdQOOMES0v0eOZEJk2LoKKFITx.ipbB8rwa', '123123', '12312', '21312', '3123', '1', '3123131', '2018-08-08 15:13:53', null, '0');
INSERT INTO `sys_user` VALUES ('3fcc7ec0afb24b2eb66e597cbe0abeb1', 'ddddsad', '$2a$10$1u6ZJntQRxq/GcP8pCuDUuAnnJ9Wf.nigIDh/1mDW3Ns7qSKlRpBC', 'ddddsad', 'ddddsad', 'ddddsad', 'ddddsad', '1', 'ddddsad', '2018-08-08 16:43:38', null, '0');
INSERT INTO `sys_user` VALUES ('4005c5b089dd4205a78343e6bf348cc6', 'admin8', '$2a$10$Kv53e8Ebsc/Pd5n7ASFKQegKI766R5CfCjeGjhCa8carsybJy2u96', 'admin8', 'admin8', 'admin8', 'admin8', '1', 'admin8', '2018-08-08 15:13:59', '2018-09-17 15:06:37', '0');
INSERT INTO `sys_user` VALUES ('53005f8d6835436ba4e5d6bda080d00d', 'admin6', '$2a$10$4onsys0ubgkkAYcuAK00lOHrLMDpV1XMHb8X/Pus/U3Ju8ba52Vye', 'admin6', 'admin6', 'admin6', 'admin6', '1', 'admin6', '2018-08-08 15:14:01', null, '0');
INSERT INTO `sys_user` VALUES ('5b4dae7582e040f48628365c63a5ad58', 'admin4', '$2a$10$kq5fSD52TsPExYp1UWDgf.L9xDacmkbLaYTg81OqMzu8O6EVb.xJu', 'admin4', 'admin4', 'admin4', 'admin4', '1', 'admin4', '2018-08-08 15:14:04', null, '0');
INSERT INTO `sys_user` VALUES ('5d4b56b8e32a4a7cb60bb85ac8727062', 'admin2', '$2a$10$HBKJjbOfYVI.fRIOkhgkAeP/m6DwgcbmwpYFFwreGuaJZbyQCkb.m', 'admin2', 'admin2', 'admin2', 'admin2', '1', 'admin2', '2018-08-08 15:14:06', null, '0');
INSERT INTO `sys_user` VALUES ('60c06c12f7114857a7865d4cc839d66d', 'admin9', '$2a$10$vSZ10RjSeygh4JBhaD6dZuCqijqlayZsI/rJWvTWvhLgFAZdwFlcq', 'admin9', 'admin9', 'admin9', 'admin9', '1', 'admin9', '2018-08-08 15:14:08', null, '0');
INSERT INTO `sys_user` VALUES ('bf2368598dc742278bc990af4d1e69d9', 'test1234', '$2a$10$rKGrDs55yNW9C8IrriEitOicdMl35tkLKuYVO01XOCyH0QY8SBk9i', 'test1234', 'test1234', 'test1234', 'test1234', '1', 'test1234', '2018-09-17 15:10:12', '2018-09-25 15:53:53', '0');
INSERT INTO `sys_user` VALUES ('c0fca810ad7e47b7821de90ef12c2412', 'admin3', '$2a$10$EU6K7eIMU4HLXZQjjR7TSONp.0gcTIaMgGgzqR1XA8dq1MoC/LhpS', 'admin3', 'admin3', 'admin3', 'admin3', '1', 'admin3', '2018-08-08 15:14:17', null, '0');
INSERT INTO `sys_user` VALUES ('dac7b9f4ccfb412ab099314e38f99e58', 'admin7', '$2a$10$hqGfO0wynYgxJ39QyMIc3..qBkk12bbVFWATpO4oY1L4N/yG0/mhu', 'admin7', 'admin7', 'admin7', 'admin7', '1', 'admin7', '2018-08-08 15:14:19', null, '0');
INSERT INTO `sys_user` VALUES ('f8c2b552542a4879bd45c641246bd408', 'asda', '$2a$10$t2D4XrSuE75zqCDIJ9n/v.poeDHIlap/5plc1y9gxC2aCKoZ.TLuC', 'dd', 'da', 'dd', 'ada', '1', 'asdda', '2018-09-25 15:56:41', null, '0');
INSERT INTO `sys_user` VALUES ('fdc591ee81384848abfc55b2b03087ed', 'admin5', '$2a$10$h4hHewvAQY4sdrfwCyglfePVOD1RD3r6azrHogMd6H/u34rDwez8i', 'admin5', 'admin5', 'admin5', 'admin5', '1', 'admin5', '2018-08-08 15:14:23', null, '0');

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
INSERT INTO `sys_user_role` VALUES ('1dc8f600508640688f150c6e04d5c324', '1');
INSERT INTO `sys_user_role` VALUES ('1dc8f600508640688f150c6e04d5c324', '2');
INSERT INTO `sys_user_role` VALUES ('4005c5b089dd4205a78343e6bf348cc6', '2');
INSERT INTO `sys_user_role` VALUES ('bf2368598dc742278bc990af4d1e69d9', 'ffa8325fbe0c4119a497cac2d71d1ab8');

-- ----------------------------
-- Table structure for trip_user
-- ----------------------------
DROP TABLE IF EXISTS `trip_user`;
CREATE TABLE `trip_user` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `mobile` varchar(64) NOT NULL COMMENT '手机',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `gender` char(1) DEFAULT NULL COMMENT '性别\n0：未知\n1：男\n2：女',
  `age` varchar(10) DEFAULT NULL COMMENT '年龄',
  `photo` varchar(100) DEFAULT NULL COMMENT '头像',
  `enabled` char(1) DEFAULT '1' COMMENT '是否可用\n0：冻结\n1：可用',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记\n1：删除\n0：未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_UNIQUE` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of trip_user
-- ----------------------------
INSERT INTO `trip_user` VALUES ('sadfsafsa1231231', '15820356452', '$2a$08$3A3626W4Nu26yOMLxyV/aeckGwsC2Od6JEW5RNDX7yLns5tzOIYdK', 'ewqeq', '1', '1', null, '1', 'eq', '2018-07-18 08:48:14', '2018-07-18 08:48:17', '0');

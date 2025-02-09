-- MySQL dump 10.13  Distrib 5.7.42, for Linux (x86_64)
--
-- Host: localhost    Database: smart_park
-- ------------------------------------------------------
-- Server version	5.7.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `smart_park`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `smart_park` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `smart_park`;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (1,'zn_park','园区',NULL,NULL,'ZnPark','crud','com.ruoyi.system','system','park','园区管理','zn','0','/','{}','admin','2023-07-05 17:58:03','','2023-07-05 18:42:00',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (1,'1','id','园区id','bigint(20)','Long','id','1','1',NULL,NULL,NULL,NULL,NULL,'EQ','input','',1,'admin','2023-07-05 17:58:03','','2023-07-05 18:42:00'),(2,'1','park_name','园区名称','varchar(64)','String','parkName','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2023-07-05 17:58:03','','2023-07-05 18:42:00'),(3,'1','create_id','创建人id','bigint(20)','Long','createId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-07-05 17:58:03','','2023-07-05 18:42:00'),(4,'1','create_by','创建人','varchar(32)','String','createBy','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',4,'admin','2023-07-05 17:58:03','','2023-07-05 18:42:00'),(5,'1','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2023-07-05 17:58:04','','2023-07-05 18:42:00'),(6,'1','update_id','更新人id','bigint(20)','Long','updateId','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-07-05 17:58:04','','2023-07-05 18:42:00'),(7,'1','update_by','更新人','varchar(32)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',7,'admin','2023-07-05 17:58:04','','2023-07-05 18:42:00'),(8,'1','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',8,'admin','2023-07-05 17:58:04','','2023-07-05 18:42:00'),(9,'1','is_delete','删除标记','tinyint(1)','Integer','isDelete','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2023-07-05 17:58:04','','2023-07-05 18:42:00'),(10,'1','delete_time','删除时间','datetime','Date','deleteTime','0','0',NULL,'1','1','1','1','EQ','datetime','',10,'admin','2023-07-05 17:58:04','','2023-07-05 18:42:00'),(11,'1','tenant_id','企业id','bigint(32)','Long','tenantId','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2023-07-05 17:58:04','','2023-07-05 18:42:00'),(12,'1','remark','备注','varchar(255)','String','remark','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',12,'admin','2023-07-05 17:58:04','','2023-07-05 18:42:00');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2023-07-05 15:36:00','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2023-07-05 15:36:00','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2023-07-05 15:36:00','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2023-07-05 15:36:00','',NULL,'是否开启注册用户功能（true开启，false关闭）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','根部门（不可改动）',0,'若依','15888888888','ry@qq.com','0','0','admin','2023-07-05 15:35:58','admin','2023-07-05 21:12:46',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-07-05 15:35:58','',NULL,NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-07-05 15:35:58','',NULL,NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-07-05 15:35:58','',NULL,NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','2','admin','2023-07-05 15:35:58','',NULL,NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2023-07-05 15:35:58','',NULL,NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','2','admin','2023-07-05 15:35:58','',NULL,NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','2','admin','2023-07-05 15:35:58','',NULL,NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-07-05 15:35:58','',NULL,NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-07-05 15:35:58','',NULL,NULL),(200,100,'0,100','御湖湾',0,NULL,NULL,NULL,'0','0','admin','2023-07-05 21:13:03','',NULL,NULL),(201,100,'0,100','正商华钻',0,NULL,NULL,NULL,'0','0','admin','2023-07-05 21:13:25','admin','2023-07-05 21:14:41',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2023-07-05 15:36:00','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2023-07-05 15:36:00','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2023-07-05 15:36:00','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2023-07-05 15:36:00','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2023-07-05 15:36:00','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2023-07-05 15:36:00','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2023-07-05 15:36:00','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2023-07-05 15:36:00','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2023-07-05 15:36:00','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2023-07-05 15:36:00','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2023-07-05 15:36:00','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2023-07-05 15:36:00','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2023-07-05 15:36:00','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2023-07-05 15:36:00','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2023-07-05 15:36:00','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2023-07-05 15:36:00','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2023-07-05 15:36:00','',NULL,'关闭状态'),(18,1,'新增','1','sys_oper_type','','info','N','0','admin','2023-07-05 15:36:00','',NULL,'新增操作'),(19,2,'修改','2','sys_oper_type','','info','N','0','admin','2023-07-05 15:36:00','',NULL,'修改操作'),(20,3,'删除','3','sys_oper_type','','danger','N','0','admin','2023-07-05 15:36:00','',NULL,'删除操作'),(21,4,'授权','4','sys_oper_type','','primary','N','0','admin','2023-07-05 15:36:00','',NULL,'授权操作'),(22,5,'导出','5','sys_oper_type','','warning','N','0','admin','2023-07-05 15:36:00','',NULL,'导出操作'),(23,6,'导入','6','sys_oper_type','','warning','N','0','admin','2023-07-05 15:36:00','',NULL,'导入操作'),(24,7,'强退','7','sys_oper_type','','danger','N','0','admin','2023-07-05 15:36:00','',NULL,'强退操作'),(25,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2023-07-05 15:36:00','',NULL,'生成操作'),(26,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2023-07-05 15:36:00','',NULL,'清空操作'),(27,1,'成功','0','sys_common_status','','primary','N','0','admin','2023-07-05 15:36:00','',NULL,'正常状态'),(28,2,'失败','1','sys_common_status','','danger','N','0','admin','2023-07-05 15:36:00','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2023-07-05 15:36:00','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2023-07-05 15:36:00','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2023-07-05 15:36:00','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2023-07-05 15:36:00','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2023-07-05 15:36:00','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2023-07-05 15:36:00','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2023-07-05 15:36:00','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2023-07-05 15:36:00','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2023-07-05 15:36:00','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2023-07-05 15:36:00','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2023-07-05 15:36:00','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2023-07-05 15:36:00','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2023-07-05 15:36:00','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示信息',
  `access_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','0','登录成功','2023-07-05 17:24:27'),(101,'admin','127.0.0.1','0','登录成功','2023-07-05 17:45:01'),(102,'admin','127.0.0.1','0','退出成功','2023-07-05 17:50:20'),(103,'admin','127.0.0.1','0','登录成功','2023-07-05 17:50:21'),(104,'admin','127.0.0.1','0','退出成功','2023-07-05 18:30:02'),(105,'正商华钻物业','127.0.0.1','1','用户密码错误','2023-07-05 18:30:17'),(106,'正商华钻物业','127.0.0.1','0','登录成功','2023-07-05 18:30:25'),(107,'正商华钻物业','127.0.0.1','0','退出成功','2023-07-05 18:30:33'),(108,'admin','127.0.0.1','0','登录成功','2023-07-05 18:30:37'),(109,'admin','127.0.0.1','0','退出成功','2023-07-05 18:33:45'),(110,'admin','127.0.0.1','0','登录成功','2023-07-05 18:33:47'),(111,'admin','127.0.0.1','0','退出成功','2023-07-05 18:33:51'),(112,'正商华钻物业','127.0.0.1','0','登录成功','2023-07-05 18:34:30'),(113,'正商华钻物业','127.0.0.1','0','退出成功','2023-07-05 18:34:44'),(114,'admin','127.0.0.1','0','登录成功','2023-07-05 18:34:48'),(115,'admin','127.0.0.1','0','退出成功','2023-07-05 18:36:21'),(116,'正商华钻物业','127.0.0.1','0','登录成功','2023-07-05 18:36:24'),(117,'正商华钻物业','127.0.0.1','0','退出成功','2023-07-05 18:37:46'),(118,'admin','127.0.0.1','0','登录成功','2023-07-05 18:37:54'),(119,'admin','127.0.0.1','0','退出成功','2023-07-05 18:44:32'),(120,'admin','127.0.0.1','0','登录成功','2023-07-05 18:44:34'),(121,'admin','127.0.0.1','0','退出成功','2023-07-05 18:50:44'),(122,'正商华钻物业','127.0.0.1','0','登录成功','2023-07-05 18:50:48'),(123,'正商华钻物业','127.0.0.1','0','退出成功','2023-07-05 18:51:01'),(124,'admin','127.0.0.1','0','登录成功','2023-07-05 18:51:04'),(125,'admin','127.0.0.1','0','退出成功','2023-07-05 18:51:23'),(126,'正商华钻物业','127.0.0.1','0','登录成功','2023-07-05 18:51:26'),(127,'正商华钻物业','127.0.0.1','0','退出成功','2023-07-05 18:52:45'),(128,'admin','127.0.0.1','0','登录成功','2023-07-05 18:53:01'),(129,'admin','127.0.0.1','0','退出成功','2023-07-05 18:56:04'),(130,'正商华钻物业','127.0.0.1','0','登录成功','2023-07-05 18:56:10'),(131,'正商华钻物业','127.0.0.1','0','退出成功','2023-07-05 18:56:33'),(132,'admin','127.0.0.1','0','登录成功','2023-07-05 18:57:47'),(133,'admin','127.0.0.1','0','退出成功','2023-07-05 21:02:12'),(134,'admin','127.0.0.1','0','登录成功','2023-07-05 21:02:20'),(135,'admin','127.0.0.1','0','退出成功','2023-07-05 21:38:53'),(136,'正商华钻物业','127.0.0.1','0','登录成功','2023-07-05 21:39:14'),(137,'admin','127.0.0.1','0','退出成功','2023-07-05 21:41:18'),(138,'正商华钻物业','127.0.0.1','0','登录成功','2023-07-05 21:41:22'),(139,'正商华钻物业','127.0.0.1','0','退出成功','2023-07-05 21:41:29'),(140,'admin','127.0.0.1','0','登录成功','2023-07-05 21:41:32'),(141,'admin','127.0.0.1','0','退出成功','2023-07-05 21:42:02'),(142,'正商华钻物业','127.0.0.1','0','登录成功','2023-07-05 21:42:05'),(143,'正商华钻物业','127.0.0.1','0','退出成功','2023-07-05 21:42:14'),(144,'admin','127.0.0.1','0','登录成功','2023-07-05 21:42:17'),(145,'admin','127.0.0.1','0','退出成功','2023-07-05 21:42:33'),(146,'正商华钻物业','127.0.0.1','0','登录成功','2023-07-05 21:42:36'),(147,'正商华钻物业','127.0.0.1','0','退出成功','2023-07-05 21:43:13'),(148,'admin','127.0.0.1','0','登录成功','2023-07-05 21:43:16'),(149,'正商华钻物业','127.0.0.1','0','退出成功','2023-07-05 21:53:45'),(150,'正商华钻物业','127.0.0.1','0','登录成功','2023-07-05 21:53:49'),(151,'正商华钻物业','127.0.0.1','0','退出成功','2023-07-06 10:16:13'),(152,'正商华钻物业','127.0.0.1','0','登录成功','2023-07-06 10:17:27'),(153,'admin','192.168.1.103','0','登录成功','2023-07-06 11:14:53'),(154,'admin','192.168.1.13','0','登录成功','2023-07-06 14:14:17'),(155,'admin','192.168.1.2','0','登录成功','2023-07-06 14:24:16'),(156,'admin','192.168.1.2','0','登录成功','2023-07-06 14:26:15'),(157,'admin','192.168.1.2','0','登录成功','2023-07-06 14:28:08'),(158,'admin','192.168.1.103','0','登录成功','2023-07-06 14:35:58'),(159,'admin','192.168.1.13','0','登录成功','2023-07-06 14:39:39'),(160,'正商华钻物业','127.0.0.1','0','退出成功','2023-07-06 15:10:08'),(161,'正商华钻物业','127.0.0.1','0','退出成功','2023-07-06 15:11:17'),(162,'正商华钻物业','127.0.0.1','0','登录成功','2023-07-06 15:11:19'),(163,'正商华钻物业','127.0.0.1','0','退出成功','2023-07-06 15:14:19'),(164,'正商华钻物业','127.0.0.1','0','登录成功','2023-07-06 15:14:23'),(165,'正商华钻物业','127.0.0.1','0','退出成功','2023-07-06 15:15:32'),(166,'正商华钻物业','127.0.0.1','0','登录成功','2023-07-06 15:15:42');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2014 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2023-07-05 15:35:59','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2023-07-05 15:35:59','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2023-07-05 15:35:59','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'',0,0,'M','0','0','','guide','admin','2023-07-05 15:35:59','',NULL,'若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2023-07-05 15:35:59','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2023-07-05 15:35:59','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2023-07-05 15:35:59','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2023-07-05 15:35:59','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2023-07-05 15:35:59','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2023-07-05 15:35:59','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2023-07-05 15:35:59','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2023-07-05 15:35:59','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2023-07-05 15:35:59','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2023-07-05 15:35:59','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2023-07-05 15:35:59','',NULL,'定时任务菜单'),(111,'Sentinel控制台',2,3,'http://localhost:8718','','',0,0,'C','0','0','monitor:sentinel:list','sentinel','admin','2023-07-05 15:35:59','',NULL,'流量控制菜单'),(112,'Nacos控制台',2,4,'http://localhost:8848/nacos','','',0,0,'C','0','0','monitor:nacos:list','nacos','admin','2023-07-05 15:35:59','',NULL,'服务治理菜单'),(113,'Admin控制台',2,5,'http://localhost:9100/login','','',0,0,'C','0','0','monitor:server:list','server','admin','2023-07-05 15:35:59','',NULL,'服务监控菜单'),(114,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2023-07-05 15:35:59','',NULL,'表单构建菜单'),(115,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2023-07-05 15:35:59','',NULL,'代码生成菜单'),(116,'系统接口',3,3,'http://localhost:8080/swagger-ui/index.html','','',0,0,'C','0','0','tool:swagger:list','swagger','admin','2023-07-05 15:35:59','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','system/operlog/index','',1,0,'C','0','0','system:operlog:list','form','admin','2023-07-05 15:35:59','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','system/logininfor/index','',1,0,'C','0','0','system:logininfor:list','logininfor','admin','2023-07-05 15:35:59','',NULL,'登录日志菜单'),(1001,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2023-07-05 15:35:59','',NULL,''),(1002,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2023-07-05 15:35:59','',NULL,''),(1003,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2023-07-05 15:35:59','',NULL,''),(1004,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2023-07-05 15:35:59','',NULL,''),(1005,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2023-07-05 15:35:59','',NULL,''),(1006,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2023-07-05 15:35:59','',NULL,''),(1007,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2023-07-05 15:35:59','',NULL,''),(1008,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2023-07-05 15:35:59','',NULL,''),(1009,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2023-07-05 15:35:59','',NULL,''),(1010,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2023-07-05 15:35:59','',NULL,''),(1011,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2023-07-05 15:35:59','',NULL,''),(1012,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2023-07-05 15:35:59','',NULL,''),(1013,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2023-07-05 15:35:59','',NULL,''),(1014,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2023-07-05 15:35:59','',NULL,''),(1015,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2023-07-05 15:35:59','',NULL,''),(1016,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2023-07-05 15:35:59','',NULL,''),(1017,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2023-07-05 15:35:59','',NULL,''),(1018,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2023-07-05 15:35:59','',NULL,''),(1019,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2023-07-05 15:35:59','',NULL,''),(1020,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2023-07-05 15:35:59','',NULL,''),(1021,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2023-07-05 15:35:59','',NULL,''),(1022,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2023-07-05 15:35:59','',NULL,''),(1023,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2023-07-05 15:35:59','',NULL,''),(1024,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2023-07-05 15:35:59','',NULL,''),(1025,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2023-07-05 15:35:59','',NULL,''),(1026,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2023-07-05 15:35:59','',NULL,''),(1027,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2023-07-05 15:35:59','',NULL,''),(1028,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2023-07-05 15:35:59','',NULL,''),(1029,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2023-07-05 15:35:59','',NULL,''),(1030,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2023-07-05 15:35:59','',NULL,''),(1031,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2023-07-05 15:35:59','',NULL,''),(1032,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2023-07-05 15:35:59','',NULL,''),(1033,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2023-07-05 15:35:59','',NULL,''),(1034,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2023-07-05 15:35:59','',NULL,''),(1035,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2023-07-05 15:35:59','',NULL,''),(1036,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2023-07-05 15:35:59','',NULL,''),(1037,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2023-07-05 15:35:59','',NULL,''),(1038,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2023-07-05 15:35:59','',NULL,''),(1039,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2023-07-05 15:35:59','',NULL,''),(1040,'操作查询',500,1,'#','','',1,0,'F','0','0','system:operlog:query','#','admin','2023-07-05 15:35:59','',NULL,''),(1041,'操作删除',500,2,'#','','',1,0,'F','0','0','system:operlog:remove','#','admin','2023-07-05 15:35:59','',NULL,''),(1042,'日志导出',500,4,'#','','',1,0,'F','0','0','system:operlog:export','#','admin','2023-07-05 15:35:59','',NULL,''),(1043,'登录查询',501,1,'#','','',1,0,'F','0','0','system:logininfor:query','#','admin','2023-07-05 15:35:59','',NULL,''),(1044,'登录删除',501,2,'#','','',1,0,'F','0','0','system:logininfor:remove','#','admin','2023-07-05 15:35:59','',NULL,''),(1045,'日志导出',501,3,'#','','',1,0,'F','0','0','system:logininfor:export','#','admin','2023-07-05 15:35:59','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2023-07-05 15:35:59','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2023-07-05 15:35:59','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2023-07-05 15:35:59','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2023-07-05 15:35:59','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2023-07-05 15:35:59','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2023-07-05 15:35:59','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2023-07-05 15:35:59','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2023-07-05 15:35:59','',NULL,''),(1054,'任务导出',110,7,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2023-07-05 15:35:59','',NULL,''),(1055,'生成查询',115,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2023-07-05 15:35:59','',NULL,''),(1056,'生成修改',115,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2023-07-05 15:35:59','',NULL,''),(1057,'生成删除',115,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2023-07-05 15:35:59','',NULL,''),(1058,'导入代码',115,2,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2023-07-05 15:35:59','',NULL,''),(1059,'预览代码',115,4,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2023-07-05 15:35:59','',NULL,''),(1060,'生成代码',115,5,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2023-07-05 15:35:59','',NULL,''),(2007,'园区管理',0,1,'park','park/index',NULL,1,0,'C','0','0','system:park:list','#','admin','2023-07-05 18:44:20','admin','2023-07-05 21:23:19','园区管理菜单'),(2008,'园区管理查询',2007,1,'#','',NULL,1,0,'F','0','0','system:park:query','#','admin','2023-07-05 18:44:20','',NULL,''),(2009,'园区管理新增',2007,2,'#','',NULL,1,0,'F','0','0','system:park:add','#','admin','2023-07-05 18:44:20','',NULL,''),(2010,'园区管理修改',2007,3,'#','',NULL,1,0,'F','0','0','system:park:edit','#','admin','2023-07-05 18:44:20','',NULL,''),(2011,'园区管理删除',2007,4,'#','',NULL,1,0,'F','0','0','system:park:remove','#','admin','2023-07-05 18:44:20','',NULL,''),(2012,'园区管理导出',2007,5,'#','',NULL,1,0,'F','0','0','system:park:export','#','admin','2023-07-05 18:44:20','',NULL,''),(2013,'用户列表',100,0,'',NULL,NULL,1,0,'F','0','0','system:user:list','#','admin','2023-07-06 15:13:51','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2023-07-05 15:36:01','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2023-07-05 15:36:01','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'菜单管理',1,'com.ruoyi.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"orderNum\":0,\"menuName\":\"园区管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"park\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 17:48:11'),(101,'代码生成',6,'com.ruoyi.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/gen/importTable','127.0.0.1','','zn_park','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 17:58:04'),(102,'代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/gen/batchGenCode','127.0.0.1','',NULL,NULL,0,NULL,'2023-07-05 18:00:24'),(103,'用户管理',1,'com.ruoyi.system.controller.SysUserController.add()','POST',1,'admin',NULL,'/user','127.0.0.1','','{\"admin\":false,\"password\":\"$2a$10$DNW03Tv60G6UVnYzCEsGCuelegPTuqaiPEtB2pbq7wVaen3sMdBgW\",\"postIds\":[],\"nickName\":\"正商华钻物业\",\"params\":{},\"userName\":\"正商华钻物业\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:29:45'),(104,'角色管理',1,'com.ruoyi.system.controller.SysRoleController.add()','POST',1,'admin',NULL,'/role','127.0.0.1','','{\"flag\":false,\"roleId\":100,\"admin\":false,\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"yqadmin\",\"roleName\":\"物业管理员\",\"deptIds\":[],\"menuIds\":[2000,2001,2002,2003,2004,2005,2006],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:33:33'),(105,'用户管理',2,'com.ruoyi.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/user','127.0.0.1','','{\"roles\":[],\"phonenumber\":\"\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"正商华钻物业\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"正商华钻物业\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[100],\"createTime\":1688552985000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:35:55'),(106,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":0,\"menuName\":\"园区管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"park\",\"children\":[],\"createTime\":1688550490000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:39:21'),(107,'代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/gen/batchGenCode','127.0.0.1','',NULL,NULL,0,NULL,'2023-07-05 18:42:10'),(108,'菜单管理',3,'com.ruoyi.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/menu/2006','127.0.0.1','',NULL,'{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}',0,NULL,'2023-07-05 18:42:59'),(109,'角色管理',2,'com.ruoyi.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','127.0.0.1','','{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1688553213000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"yqadmin\",\"roleName\":\"物业管理员\",\"menuIds\":[],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:43:11'),(110,'菜单管理',3,'com.ruoyi.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/menu/2001','127.0.0.1','',NULL,'{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}',0,NULL,'2023-07-05 18:43:21'),(111,'菜单管理',3,'com.ruoyi.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/menu/2002','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:43:25'),(112,'菜单管理',3,'com.ruoyi.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/menu/2003','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:43:27'),(113,'菜单管理',3,'com.ruoyi.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/menu/2004','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:43:29'),(114,'菜单管理',3,'com.ruoyi.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/menu/2005','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:43:32'),(115,'菜单管理',3,'com.ruoyi.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/menu/2006','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:43:34'),(116,'菜单管理',3,'com.ruoyi.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/menu/2001','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:43:37'),(117,'菜单管理',3,'com.ruoyi.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/menu/2000','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:43:40'),(118,'角色管理',2,'com.ruoyi.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','127.0.0.1','','{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1688553213000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"yqadmin\",\"roleName\":\"物业管理员\",\"menuIds\":[3,2007,2008,2009,2010,2011,2012],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:50:38'),(119,'角色管理',2,'com.ruoyi.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','127.0.0.1','','{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1688553213000,\"updateBy\":\"admin\",\"menuCheckStrictly\":false,\"roleKey\":\"yqadmin\",\"roleName\":\"物业管理员\",\"menuIds\":[2008,2009,2010,2011,2012],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:55:59'),(120,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"园区管理\",\"params\":{},\"isCache\":\"0\",\"path\":\"park\",\"component\":\"system/park/index\",\"children\":[],\"createTime\":1688553860000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"C\",\"perms\":\"system:park:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:58:50'),(121,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"园区管理\",\"params\":{},\"isCache\":\"0\",\"path\":\"park\",\"component\":\"system/park/index\",\"children\":[],\"createTime\":1688553860000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"C\",\"perms\":\"system:park:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:59:05'),(122,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"园区管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"park\",\"component\":\"system/park/index\",\"children\":[],\"createTime\":1688553860000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"C\",\"perms\":\"system:park:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 19:00:16'),(123,'角色管理',1,'com.ruoyi.system.controller.SysRoleController.add()','POST',1,'admin',NULL,'/role','127.0.0.1','','{\"flag\":false,\"roleId\":101,\"admin\":false,\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"finance\",\"roleName\":\"财务\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 20:05:53'),(124,'部门管理',2,'com.ruoyi.system.controller.SysDeptController.edit()','PUT',1,'admin',NULL,'/dept','127.0.0.1','','{\"deptName\":\"根部门（不可改动）\",\"leader\":\"若依\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1688542558000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"ry@qq.com\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 21:12:46'),(125,'部门管理',1,'com.ruoyi.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/dept','127.0.0.1','','{\"deptName\":\"御湖湾\",\"orderNum\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 21:13:04'),(126,'部门管理',1,'com.ruoyi.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/dept','127.0.0.1','','{\"deptName\":\"正商华钻\",\"orderNum\":\"1\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 21:13:25'),(127,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/101','127.0.0.1','',NULL,'{\"msg\":\"存在下级部门,不允许删除\",\"code\":500}',0,NULL,'2023-07-05 21:13:31'),(128,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/107','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 21:13:37'),(129,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/106','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 21:13:38'),(130,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/105','127.0.0.1','',NULL,'{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}',0,NULL,'2023-07-05 21:13:41'),(131,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/104','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 21:13:43'),(132,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/105','127.0.0.1','',NULL,'{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}',0,NULL,'2023-07-05 21:13:45'),(133,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/103','127.0.0.1','',NULL,'{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}',0,NULL,'2023-07-05 21:13:47'),(134,'用户管理',2,'com.ruoyi.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/user','127.0.0.1','','{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1688542559000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"ancestors\":\"0,100,101\",\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1688542559000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 21:14:00'),(135,'用户管理',2,'com.ruoyi.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/user','127.0.0.1','','{\"roles\":[{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"yqadmin\",\"roleName\":\"物业管理员\",\"status\":\"0\"}],\"phonenumber\":\"\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"正商华钻物业\",\"sex\":\"0\",\"deptId\":201,\"avatar\":\"\",\"params\":{},\"userName\":\"正商华钻物业\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[100],\"createTime\":1688552985000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 21:14:27'),(136,'部门管理',2,'com.ruoyi.system.controller.SysDeptController.edit()','PUT',1,'admin',NULL,'/dept','127.0.0.1','','{\"deptName\":\"正商华钻\",\"deptId\":201,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1688562805000,\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 21:14:41'),(137,'角色管理',2,'com.ruoyi.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','127.0.0.1','','{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1688553213000,\"updateBy\":\"admin\",\"menuCheckStrictly\":false,\"roleKey\":\"yqadmin\",\"roleName\":\"物业管理员\",\"menuIds\":[2007,2008,2009,2010,2011,2012],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 21:17:59'),(138,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"园区管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"/park/index\",\"component\":\"/park/index\",\"children\":[],\"createTime\":1688553860000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"C\",\"perms\":\"system:park:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 21:22:22'),(139,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"园区管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"park\",\"component\":\"/park/index\",\"children\":[],\"createTime\":1688553860000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"C\",\"perms\":\"system:park:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 21:23:03'),(140,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"园区管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"park\",\"component\":\"park/index\",\"children\":[],\"createTime\":1688553860000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"C\",\"perms\":\"system:park:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 21:23:19'),(141,'用户管理',1,'com.ruoyi.system.controller.SysUserController.add()','POST',1,'admin',NULL,'/user','127.0.0.1','','{\"admin\":false,\"password\":\"admin123\",\"postIds\":[],\"nickName\":\"正商华钻财务\",\"deptId\":201,\"params\":{},\"userName\":\"admin\",\"roleIds\":[101],\"status\":\"0\"}','{\"msg\":\"新增用户\'admin\'失败，登录账号已存在\",\"code\":500}',0,NULL,'2023-07-05 21:39:19'),(142,'用户管理',1,'com.ruoyi.system.controller.SysUserController.add()','POST',1,'admin',NULL,'/user','127.0.0.1','','{\"admin\":false,\"password\":\"$2a$10$YWiCJwt2RPLvsoBwiB7YM.olLsqo87rJi7P857.qbt.OBUsOUxU76\",\"postIds\":[],\"nickName\":\"正商华钻财务\",\"deptId\":201,\"params\":{},\"userName\":\"正商华钻财务\",\"userId\":101,\"createBy\":\"admin\",\"roleIds\":[101],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 21:39:37'),(143,'角色管理',2,'com.ruoyi.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','127.0.0.1','','{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1688553213000,\"updateBy\":\"admin\",\"menuCheckStrictly\":false,\"roleKey\":\"yqadmin\",\"roleName\":\"物业管理员\",\"menuIds\":[100,2007,2008,2009,2010,2011,2012],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 21:41:45'),(144,'角色管理',2,'com.ruoyi.system.controller.SysRoleController.dataScope()','PUT',1,'admin',NULL,'/role/dataScope','127.0.0.1','','{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"4\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1688553213000,\"menuCheckStrictly\":false,\"roleKey\":\"yqadmin\",\"roleName\":\"物业管理员\",\"deptIds\":[],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 21:41:58'),(145,'角色管理',2,'com.ruoyi.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','127.0.0.1','','{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"4\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1688553213000,\"updateBy\":\"admin\",\"menuCheckStrictly\":false,\"roleKey\":\"yqadmin\",\"roleName\":\"物业管理员\",\"menuIds\":[1,100,2007,2008,2009,2010,2011,2012],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 21:42:30'),(146,'用户管理',2,'com.ruoyi.system.controller.SysUserController.changeStatus()','PUT',1,'正商华钻物业',NULL,'/user/changeStatus','127.0.0.1','','{\"admin\":false,\"params\":{},\"userId\":101,\"status\":\"1\"}',NULL,1,'system:user:edit','2023-07-06 14:07:49'),(147,'用户管理',2,'com.ruoyi.system.controller.SysUserController.changeStatus()','PUT',1,'正商华钻物业',NULL,'/user/changeStatus','127.0.0.1','','{\"admin\":false,\"params\":{},\"userId\":101,\"status\":\"1\"}',NULL,1,'system:user:edit','2023-07-06 14:07:54'),(148,'用户管理',2,'com.ruoyi.system.controller.SysUserController.changeStatus()','PUT',1,'正商华钻物业',NULL,'/user/changeStatus','127.0.0.1','','{\"admin\":false,\"params\":{},\"userId\":101,\"status\":\"1\"}',NULL,1,'system:user:edit','2023-07-06 14:08:04'),(149,'角色管理',2,'com.ruoyi.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','192.168.1.103','','{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"4\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1688553213000,\"updateBy\":\"admin\",\"menuCheckStrictly\":false,\"roleKey\":\"yqadmin\",\"roleName\":\"物业管理员\",\"menuIds\":[1001,1002,1003,1004,1007,2007,2008,2009,2010,2011,2012],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 14:12:46'),(150,'角色管理',2,'com.ruoyi.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','192.168.1.13','','{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"4\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1688553213000,\"updateBy\":\"admin\",\"menuCheckStrictly\":false,\"roleKey\":\"yqadmin\",\"roleName\":\"物业管理员\",\"menuIds\":[1001,1002,1003,1004,1007,2007,2008,2009,2010,2011,2012],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 14:14:45'),(151,'用户管理',2,'com.ruoyi.system.controller.SysUserController.resetPwd()','PUT',1,'正商华钻物业',NULL,'/user/resetPwd','127.0.0.1','','{\"admin\":false,\"password\":\"123456\",\"params\":{},\"userId\":101}',NULL,1,'system:user:edit','2023-07-06 14:18:10'),(152,'用户管理',2,'com.ruoyi.system.controller.SysUserController.resetPwd()','PUT',1,'admin',NULL,'/user/resetPwd','192.168.1.13','','{\"admin\":false,\"password\":\"$2a$10$aBf5zJGN0TfCQeP0nxx3peZLArfUKKSau2tq6yYHN4cu9OrPYcpMe\",\"updateBy\":\"admin\",\"params\":{},\"userId\":100}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 14:25:55'),(153,'角色管理',2,'com.ruoyi.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','192.168.1.13','','{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"4\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1688553213000,\"updateBy\":\"admin\",\"menuCheckStrictly\":false,\"roleKey\":\"yqadmin\",\"roleName\":\"物业管理员\",\"menuIds\":[1001,1002,1003,1004,1007,1008,2007,2008,2009,2010,2011,2012],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 14:40:03'),(154,'园区',1,'com.ruoyi.system.controller.ZnParkController.add()','POST',1,'admin',NULL,'/park','192.168.1.103','','{\"parkName\":\"\",\"sysDeptId\":0,\"createBy\":\"admin\",\"deleted\":false,\"createTime\":\"2023-07-06T14:43:53.709\",\"createId\":1,\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 14:43:57'),(155,'园区',1,'com.ruoyi.system.controller.ZnParkController.add()','POST',1,'admin',NULL,'/park','192.168.1.103','','{\"parkName\":\"\",\"sysDeptId\":0,\"createBy\":\"admin\",\"deleted\":false,\"createTime\":\"2023-07-06T14:45:30.490\",\"createId\":1,\"id\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 14:45:33'),(156,'园区',2,'com.ruoyi.system.controller.ZnParkController.edit()','PUT',1,'admin',NULL,'/park','192.168.1.103','','{\"parkName\":\"1\",\"updateTime\":\"2023-07-06T14:51:45.804\",\"sysDeptId\":0,\"updateId\":1,\"updateBy\":\"admin\",\"id\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 14:51:49'),(157,'用户管理',2,'com.ruoyi.system.controller.SysUserController.resetPwd()','PUT',1,'正商华钻物业',NULL,'/user/resetPwd','127.0.0.1','','{\"admin\":false,\"password\":\"123456\",\"params\":{},\"userId\":101}',NULL,1,'system:user:edit','2023-07-06 14:56:35'),(158,'园区',3,'com.ruoyi.system.controller.ZnParkController.remove()','DELETE',1,'admin',NULL,'/park/1','192.168.1.103','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 14:59:57'),(159,'园区',3,'com.ruoyi.system.controller.ZnParkController.remove()','DELETE',1,'admin',NULL,'/park/1','192.168.1.103','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 15:03:29'),(160,'菜单管理',1,'com.ruoyi.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','192.168.1.13','','{\"visible\":\"0\",\"orderNum\":0,\"menuName\":\"用户列表\",\"params\":{},\"parentId\":100,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:user:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 15:13:51'),(161,'角色管理',2,'com.ruoyi.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','192.168.1.13','','{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"4\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1688553213000,\"updateBy\":\"admin\",\"menuCheckStrictly\":false,\"roleKey\":\"yqadmin\",\"roleName\":\"物业管理员\",\"menuIds\":[2013,1001,1002,1003,1004,1007,1008,2007,2008,2009,2010,2011,2012],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 15:14:01'),(162,'园区',3,'com.ruoyi.system.controller.ZnParkController.remove()','DELETE',1,'admin',NULL,'/park/0,1','192.168.1.103','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 15:15:46'),(163,'园区',1,'com.ruoyi.system.controller.ZnParkController.add()','POST',1,'admin',NULL,'/park','192.168.1.103','','{\"parkName\":\"测试\",\"sysDeptId\":0,\"createBy\":\"admin\",\"deleted\":false,\"createTime\":\"2023-07-06T15:25:18.396\",\"createId\":1,\"id\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 15:25:21'),(164,'园区',2,'com.ruoyi.system.controller.ZnParkController.edit()','PUT',1,'admin',NULL,'/park','192.168.1.103','','{\"parkName\":\"1\",\"updateTime\":\"2023-07-06T15:27:05.868\",\"sysDeptId\":0,\"updateId\":1,\"updateBy\":\"admin\",\"id\":1}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-07-06 15:27:09'),(165,'园区',2,'com.ruoyi.system.controller.ZnParkController.edit()','PUT',1,'admin',NULL,'/park','192.168.1.103','','{\"parkName\":\"1111\",\"updateTime\":\"2023-07-06T15:27:24.892\",\"sysDeptId\":0,\"updateId\":1,\"updateBy\":\"admin\",\"id\":1}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-07-06 15:27:28'),(166,'园区',2,'com.ruoyi.system.controller.ZnParkController.edit()','PUT',1,'admin',NULL,'/park','192.168.1.103','','{\"parkName\":\"1111\",\"updateTime\":\"2023-07-06T15:28:05.500\",\"sysDeptId\":0,\"updateId\":1,\"updateBy\":\"admin\",\"id\":1}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-07-06 15:28:08'),(167,'园区',2,'com.ruoyi.system.controller.ZnParkController.edit()','PUT',1,'admin',NULL,'/park','192.168.1.103','','{\"parkName\":\"1111\",\"updateTime\":\"2023-07-06T15:28:20.802\",\"sysDeptId\":0,\"updateId\":1,\"updateBy\":\"admin\",\"id\":1}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-07-06 15:28:24'),(168,'园区',2,'com.ruoyi.system.controller.ZnParkController.edit()','PUT',1,'admin',NULL,'/park','192.168.1.103','','{\"parkName\":\"1111\",\"updateTime\":\"2023-07-06T15:28:58.017\",\"sysDeptId\":0,\"updateId\":1,\"updateBy\":\"admin\",\"id\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 15:29:01'),(169,'园区',3,'com.ruoyi.system.controller.ZnParkController.remove()','DELETE',1,'admin',NULL,'/park/0,1','192.168.1.103','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 15:29:35'),(170,'用户管理',2,'com.ruoyi.system.controller.SysUserController.resetPwd()','PUT',1,'正商华钻物业',NULL,'/user/resetPwd','127.0.0.1','','{\"admin\":false,\"password\":\"$2a$10$fCr/uAWnJ1sIMG1CqBshdelDXlNpvw2.dp/UloMybFKF.TDXnscRS\",\"updateBy\":\"正商华钻物业\",\"params\":{},\"userId\":101}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 15:29:51'),(171,'园区',3,'com.ruoyi.system.controller.ZnParkController.remove()','DELETE',1,'admin',NULL,'/park/0,1,2','192.168.1.103','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 15:29:58'),(172,'园区',3,'com.ruoyi.system.controller.ZnParkController.remove()','DELETE',1,'admin',NULL,'/park/1,2','192.168.1.103','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 15:32:57'),(173,'用户管理',2,'com.ruoyi.system.controller.SysUserController.changeStatus()','PUT',1,'正商华钻物业',NULL,'/user/changeStatus','127.0.0.1','','{\"admin\":false,\"updateBy\":\"正商华钻物业\",\"params\":{},\"userId\":101,\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 15:33:00'),(174,'用户管理',2,'com.ruoyi.system.controller.SysUserController.changeStatus()','PUT',1,'正商华钻物业',NULL,'/user/changeStatus','127.0.0.1','','{\"admin\":false,\"updateBy\":\"正商华钻物业\",\"params\":{},\"userId\":101,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 15:33:02'),(175,'用户管理',1,'com.ruoyi.system.controller.SysUserController.add()','POST',1,'正商华钻物业',NULL,'/user','127.0.0.1','','{\"admin\":false,\"password\":\"$2a$10$reQUqfpYa1E3e5MSFNYQCuDE0leF5NurA8BLKm5uug9yRTWzEm4Pu\",\"nickName\":\"欧才政\",\"params\":{},\"userName\":\"17637620971\",\"userId\":102,\"createBy\":\"正商华钻物业\",\"roleIds\":[101],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 15:36:44'),(176,'用户管理',1,'com.ruoyi.system.controller.SysUserController.add()','POST',1,'正商华钻物业',NULL,'/user','127.0.0.1','','{\"admin\":false,\"password\":\"$2a$10$KB2Oz0RJJGGepgt.GpmlLumiMvNdNF9RhUTS9g2Uvx12Yd7hNSLi.\",\"nickName\":\"欧财政\",\"deptId\":201,\"params\":{},\"userName\":\"17637620971\",\"userId\":103,\"createBy\":\"正商华钻物业\",\"roleIds\":[101],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 15:59:25'),(177,'用户管理',3,'com.ruoyi.system.controller.SysUserController.remove()','DELETE',1,'正商华钻物业',NULL,'/user/103','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-06 16:01:26');
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2023-07-05 15:35:59','',NULL,''),(2,'se','项目经理',2,'0','admin','2023-07-05 15:35:59','',NULL,''),(3,'hr','人力资源',3,'0','admin','2023-07-05 15:35:59','',NULL,''),(4,'user','普通员工',4,'0','admin','2023-07-05 15:35:59','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2023-07-05 15:35:59','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2023-07-05 15:35:59','',NULL,'普通角色'),(100,'物业管理员','yqadmin',0,'4',0,1,'0','0','admin','2023-07-05 18:33:33','admin','2023-07-06 15:14:01',NULL),(101,'财务','finance',0,'1',1,1,'0','0','admin','2023-07-05 20:05:53','',NULL,NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(100,1001),(100,1002),(100,1003),(100,1004),(100,1007),(100,1008),(100,2007),(100,2008),(100,2009),(100,2010),(100,2011),(100,2012),(100,2013);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-07-05 15:35:59','admin','2023-07-05 15:35:59','',NULL,'管理员'),(2,100,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-07-05 15:35:59','admin','2023-07-05 15:35:59','admin','2023-07-05 21:14:00','测试员'),(100,201,'正商华钻物业','正商华钻物业','00','','','0','','$2a$10$aBf5zJGN0TfCQeP0nxx3peZLArfUKKSau2tq6yYHN4cu9OrPYcpMe','0','0','',NULL,'admin','2023-07-05 18:29:45','admin','2023-07-06 14:25:55',NULL),(101,201,'正商华钻财务','正商华钻财务','00','','','0','','$2a$10$fCr/uAWnJ1sIMG1CqBshdelDXlNpvw2.dp/UloMybFKF.TDXnscRS','0','0','',NULL,'admin','2023-07-05 21:39:36','正商华钻物业','2023-07-06 15:33:02',NULL),(103,201,'17637620971','欧财政','00','','','0','','$2a$10$KB2Oz0RJJGGepgt.GpmlLumiMvNdNF9RhUTS9g2Uvx12Yd7hNSLi.','0','2','',NULL,'正商华钻物业','2023-07-06 15:59:24','',NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(100,100),(101,101),(102,101);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zn_park`
--

DROP TABLE IF EXISTS `zn_park`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zn_park` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '园区id',
  `park_name` varchar(64) DEFAULT NULL COMMENT '园区名称',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '企业id',
  `sys_dept_id` bigint(20) DEFAULT NULL COMMENT '系统部门id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='园区';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zn_park`
--

LOCK TABLES `zn_park` WRITE;
/*!40000 ALTER TABLE `zn_park` DISABLE KEYS */;
INSERT INTO `zn_park` VALUES (1,'1',1,'admin','2023-07-06 14:43:54',1,'admin','2023-07-06 15:32:54',0,NULL,NULL,0,NULL),(2,'1111',1,'admin','2023-07-06 14:45:30',1,'admin','2023-07-06 15:32:54',0,NULL,NULL,0,NULL),(3,'测试',1,'admin','2023-07-06 15:25:18',NULL,NULL,NULL,0,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `zn_park` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-06  8:08:22

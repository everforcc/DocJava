-- 1. 卡券表
-- show create table mt_confirm_log;
select * from mt_confirm_log;

-- 2. 修改主键数据类型
--                                   ID` int   NOT NULL  COMMENT '自增ID',
ALTER TABLE `mt_confirm_log` MODIFY `ID` bigint NOT NULL COMMENT 'ID';

-- 3. 增加字段
ALTER TABLE `mt_confirm_log` ADD `up_flag` int DEFAULT '0' COMMENT '0 未上传 1 上传中 2 已上传';
ALTER TABLE `mt_confirm_log` ADD `up_count` int DEFAULT '0' COMMENT '上传次数';
ALTER TABLE `mt_confirm_log` ADD `up_msg` varchar(255) DEFAULT NULL COMMENT '上传信息';
ALTER TABLE `mt_confirm_log` ADD `up_id` varchar(255) DEFAULT NULL COMMENT '上传ID';
ALTER TABLE `mt_confirm_log` ADD `zn_device_sn_var` varchar(255) DEFAULT NULL COMMENT '设备编号';
# ALTER TABLE `mt_confirm_log` ADD `remark` varchar(100) DEFAULT NULL COMMENT '备注';
ALTER TABLE `mt_confirm_log` ADD `del_flag` tinyint DEFAULT '0' COMMENT '删除标识';
ALTER TABLE `mt_confirm_log` ADD `create_id` BIGINT(20) DEFAULT NULL COMMENT '创建者ID';
ALTER TABLE `mt_confirm_log` ADD  `create_by` VARCHAR(50) DEFAULT NULL COMMENT '创建者';
ALTER TABLE `mt_confirm_log` ADD  `update_id` BIGINT(20) DEFAULT NULL COMMENT '更新者ID';
ALTER TABLE `mt_confirm_log` ADD  `update_by` VARCHAR(50) DEFAULT NULL COMMENT '更新者';
ALTER TABLE `mt_confirm_log` ADD  `create_dept` BIGINT(20) DEFAULT NULL COMMENT '创建者部门';

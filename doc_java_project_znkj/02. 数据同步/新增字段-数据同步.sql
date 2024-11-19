
show create table mt_user;

select * from mt_user;

ALTER TABLE `mt_user` MODIFY `ID` bigint NOT NULL COMMENT '会员ID';
ALTER TABLE `mt_user` ADD `up_flag` int DEFAULT '0' COMMENT '0 未上传 1 上传中 2 已上传';
ALTER TABLE `mt_user` ADD `up_count` int DEFAULT '0' COMMENT '上传次数';
ALTER TABLE `mt_user` ADD `up_msg` varchar(255) DEFAULT NULL COMMENT '上传信息';
ALTER TABLE `mt_user` ADD `up_id` varchar(255) DEFAULT NULL COMMENT '上传ID';
ALTER TABLE `mt_user` ADD `zn_device_sn_var` varchar(255) DEFAULT NULL COMMENT '设备编号';
ALTER TABLE `mt_user` ADD `remark` varchar(100) DEFAULT NULL COMMENT '备注';
ALTER TABLE `mt_user` ADD `del_flag` tinyint DEFAULT '0' COMMENT '删除标识';
ALTER TABLE `mt_user` ADD `create_id` BIGINT(20) DEFAULT NULL COMMENT '创建者ID';
ALTER TABLE `mt_user` ADD  `create_by` VARCHAR(50) DEFAULT NULL COMMENT '创建者';
ALTER TABLE `mt_user` ADD  `update_id` BIGINT(20) DEFAULT NULL COMMENT '更新者ID';
ALTER TABLE `mt_user` ADD  `update_by` VARCHAR(50) DEFAULT NULL COMMENT '更新者';
ALTER TABLE `mt_user` ADD  `create_dept` BIGINT(20) DEFAULT NULL COMMENT '创建者部门';

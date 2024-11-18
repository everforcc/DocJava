select * from mt_user;
ALTER TABLE `mt_user` ADD `create_id` BIGINT(20) DEFAULT NULL COMMENT '创建者ID';
ALTER TABLE `mt_user` ADD  `create_by` VARCHAR(50) DEFAULT NULL COMMENT '创建者';
ALTER TABLE `mt_user` ADD  `update_id` BIGINT(20) DEFAULT NULL COMMENT '更新者ID';
ALTER TABLE `mt_user` ADD  `update_by` VARCHAR(50) DEFAULT NULL COMMENT '更新者';
ALTER TABLE `mt_user` ADD  `create_dept` BIGINT(20) DEFAULT NULL COMMENT '创建者部门';

-- ALTER TABLE `mt_user` ADD  `del_flag` TINYINT(1) DEFAULT NULL COMMENT '删除标识';
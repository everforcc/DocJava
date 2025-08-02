select * from zn_local;
ALTER TABLE `zn_local` ADD COLUMN `guide_process` tinyint(1) NULL DEFAULT 1 COMMENT '引导页进度 1 第一页 5 结束' AFTER `remark`;
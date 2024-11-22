
-- todo 流程待确定
-- 删除外键
ALTER TABLE mt_merchant DROP PRIMARY KEY;
-- 修改数据类型
ALTER TABLE `mt_merchant` MODIFY `ID` bigint NOT NULL COMMENT 'ID';
-- 增加主键
ALTER TABLE mt_merchant ADD PRIMARY KEY (ID);




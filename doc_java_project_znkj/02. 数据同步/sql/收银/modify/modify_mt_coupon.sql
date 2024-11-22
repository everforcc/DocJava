-- 1. 查看创建脚本
show create table mt_coupon;

-- 2. 组装关联商户id脚本
--                                                 COUPON_ID        int            default 0         null comment '卡券ID',
SELECT concat('ALTER TABLE ', TABLE_NAME, ' MODIFY `coupon_id` bigint  DEFAULT ''0'' null COMMENT ''卡券ID'';') as s
FROM INFORMATION_SCHEMA.Columns
WHERE COLUMN_NAME = 'coupon_id';

-- 3. modify脚本
ALTER TABLE mt_confirm_log MODIFY `coupon_id` bigint  DEFAULT '0' null COMMENT '卡券ID';
ALTER TABLE mt_coupon_goods MODIFY `coupon_id` bigint  not null COMMENT '卡券ID';
ALTER TABLE mt_open_gift MODIFY `coupon_id` bigint  DEFAULT '0' not null COMMENT '卡券ID';
ALTER TABLE mt_send_log MODIFY `coupon_id` bigint  DEFAULT '0' null COMMENT '卡券ID';
ALTER TABLE mt_user_coupon MODIFY `coupon_id` bigint  DEFAULT '0' not null COMMENT '卡券ID';

-- 1. 查看创建脚本
show create table mt_user;

-- 2. 组装关联 会员id脚本
SELECT concat('ALTER TABLE ', TABLE_NAME, ' MODIFY `user_id` bigint NOT NULL DEFAULT ''0'' COMMENT ''用户ID'';') as s
FROM INFORMATION_SCHEMA.Columns
WHERE COLUMN_NAME = 'user_id';

-- 3. 修改会员id
ALTER TABLE mt_address MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID';
ALTER TABLE mt_balance MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID';
ALTER TABLE mt_cart MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID';
ALTER TABLE mt_commission_cash MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID';
ALTER TABLE mt_commission_log MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID';
ALTER TABLE mt_commission_relation MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID';
ALTER TABLE mt_confirm_log MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '卡券所属用户ID';
ALTER TABLE mt_give MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID';
ALTER TABLE mt_message MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID';
ALTER TABLE mt_open_gift_item MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID';
ALTER TABLE mt_order MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID';
ALTER TABLE mt_order_address MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID';
ALTER TABLE mt_point MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID';
ALTER TABLE mt_refund MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID';
ALTER TABLE mt_send_log MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID';
ALTER TABLE mt_staff MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID';
ALTER TABLE mt_user_action MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID';
ALTER TABLE mt_user_coupon MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID';

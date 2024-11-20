-- mt_user
-- ALTER TABLE `mt_user` MODIFY `ID` bigint NOT NULL COMMENT '会员ID';
SELECT concat('ALTER TABLE ', TABLE_NAME, ' MODIFY `user_id` bigint NOT NULL DEFAULT ''0'' COMMENT ''用户ID'';') as s
FROM INFORMATION_SCHEMA.Columns
WHERE COLUMN_NAME = 'user_id';

-- 修改会员id
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


--
# show create table mt_address;
# show create table mt_balance;

-- modify
-- 更新错了恢复数据
# ALTER TABLE mt_address
#     MODIFY `ID` int(11) auto_increment comment '自增ID';
# ALTER TABLE mt_balance
#     MODIFY `ID` int(11) auto_increment comment '自增ID';
# ALTER TABLE mt_cart
#     MODIFY `ID` int(11) auto_increment comment '自增ID';
# ALTER TABLE mt_commission_cash
#     MODIFY `ID` int(11) auto_increment comment '自增ID';
# ALTER TABLE mt_commission_log
#     MODIFY `ID` int(11) auto_increment comment '自增ID';
# ALTER TABLE mt_commission_relation
#     MODIFY `ID` int(11) auto_increment comment '自增ID';
# ALTER TABLE mt_confirm_log
#     MODIFY `ID` int(11) auto_increment comment '自增ID';
# ALTER TABLE mt_give
#     MODIFY `ID` int(11) auto_increment comment '自增ID';
# ALTER TABLE mt_message
#     MODIFY `ID` int(11) auto_increment comment '自增ID';
# ALTER TABLE mt_open_gift_item
#     MODIFY `ID` int(11) auto_increment comment '自增ID';
# ALTER TABLE mt_order
#     MODIFY `ID` int(11) auto_increment comment '自增ID';
# ALTER TABLE mt_order_address
#     MODIFY `ID` int(11) auto_increment comment '自增ID';
# ALTER TABLE mt_point
#     MODIFY `ID` int(11) auto_increment comment '自增ID';
# ALTER TABLE mt_refund
#     MODIFY `ID` int(11) auto_increment comment '自增ID';
# ALTER TABLE mt_send_log
#     MODIFY `ID` int(11) auto_increment comment '自增ID';
# ALTER TABLE mt_staff
#     MODIFY `ID` int(11) auto_increment comment '自增ID';
# ALTER TABLE mt_user_action
#     MODIFY `ID` int(11) auto_increment comment '自增ID';
# ALTER TABLE mt_user_coupon
#     MODIFY `ID` int(11) auto_increment comment '自增ID';

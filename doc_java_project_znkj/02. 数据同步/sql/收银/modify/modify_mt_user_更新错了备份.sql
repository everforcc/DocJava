
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

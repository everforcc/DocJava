-- mt_user
-- ALTER TABLE `mt_user` MODIFY `ID` bigint NOT NULL COMMENT '��ԱID';
SELECT concat('ALTER TABLE ', TABLE_NAME, ' MODIFY `user_id` bigint NOT NULL DEFAULT ''0'' COMMENT ''�û�ID'';') as s
FROM INFORMATION_SCHEMA.Columns
WHERE COLUMN_NAME = 'user_id';

-- �޸Ļ�Աid
ALTER TABLE mt_address MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '�û�ID';
ALTER TABLE mt_balance MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '�û�ID';
ALTER TABLE mt_cart MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '�û�ID';
ALTER TABLE mt_commission_cash MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '�û�ID';
ALTER TABLE mt_commission_log MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '�û�ID';
ALTER TABLE mt_commission_relation MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '�û�ID';
ALTER TABLE mt_confirm_log MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '��ȯ�����û�ID';
ALTER TABLE mt_give MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '�û�ID';
ALTER TABLE mt_message MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '�û�ID';
ALTER TABLE mt_open_gift_item MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '�û�ID';
ALTER TABLE mt_order MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '�û�ID';
ALTER TABLE mt_order_address MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '�û�ID';
ALTER TABLE mt_point MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '�û�ID';
ALTER TABLE mt_refund MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '�û�ID';
ALTER TABLE mt_send_log MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '�û�ID';
ALTER TABLE mt_staff MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '�û�ID';
ALTER TABLE mt_user_action MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '�û�ID';
ALTER TABLE mt_user_coupon MODIFY `user_id` bigint NOT NULL DEFAULT '0' COMMENT '�û�ID';


--
# show create table mt_address;
# show create table mt_balance;

-- modify
-- ���´��˻ָ�����
# ALTER TABLE mt_address
#     MODIFY `ID` int(11) auto_increment comment '����ID';
# ALTER TABLE mt_balance
#     MODIFY `ID` int(11) auto_increment comment '����ID';
# ALTER TABLE mt_cart
#     MODIFY `ID` int(11) auto_increment comment '����ID';
# ALTER TABLE mt_commission_cash
#     MODIFY `ID` int(11) auto_increment comment '����ID';
# ALTER TABLE mt_commission_log
#     MODIFY `ID` int(11) auto_increment comment '����ID';
# ALTER TABLE mt_commission_relation
#     MODIFY `ID` int(11) auto_increment comment '����ID';
# ALTER TABLE mt_confirm_log
#     MODIFY `ID` int(11) auto_increment comment '����ID';
# ALTER TABLE mt_give
#     MODIFY `ID` int(11) auto_increment comment '����ID';
# ALTER TABLE mt_message
#     MODIFY `ID` int(11) auto_increment comment '����ID';
# ALTER TABLE mt_open_gift_item
#     MODIFY `ID` int(11) auto_increment comment '����ID';
# ALTER TABLE mt_order
#     MODIFY `ID` int(11) auto_increment comment '����ID';
# ALTER TABLE mt_order_address
#     MODIFY `ID` int(11) auto_increment comment '����ID';
# ALTER TABLE mt_point
#     MODIFY `ID` int(11) auto_increment comment '����ID';
# ALTER TABLE mt_refund
#     MODIFY `ID` int(11) auto_increment comment '����ID';
# ALTER TABLE mt_send_log
#     MODIFY `ID` int(11) auto_increment comment '����ID';
# ALTER TABLE mt_staff
#     MODIFY `ID` int(11) auto_increment comment '����ID';
# ALTER TABLE mt_user_action
#     MODIFY `ID` int(11) auto_increment comment '����ID';
# ALTER TABLE mt_user_coupon
#     MODIFY `ID` int(11) auto_increment comment '����ID';

-- 1. �鿴�����ű�
show create table mt_user;

-- 2. ��װ���� ��Աid�ű�
SELECT concat('ALTER TABLE ', TABLE_NAME, ' MODIFY `user_id` bigint NOT NULL DEFAULT ''0'' COMMENT ''�û�ID'';') as s
FROM INFORMATION_SCHEMA.Columns
WHERE COLUMN_NAME = 'user_id';

-- 3. �޸Ļ�Աid
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

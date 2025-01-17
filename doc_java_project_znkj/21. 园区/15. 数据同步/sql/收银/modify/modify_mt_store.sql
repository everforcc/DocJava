-- 1. �鿴�����ű�
show create table mt_store;

-- 2. ��װ���� ����id�ű�
SELECT concat('ALTER TABLE ', TABLE_NAME, ' MODIFY `store_id` bigint NULL DEFAULT ''0'' COMMENT ''����ID'';') as s
FROM INFORMATION_SCHEMA.Columns
WHERE COLUMN_NAME = 'store_id';

-- 3. alter �ű�
ALTER TABLE mt_article MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT 'Ŀ¼ID';
ALTER TABLE mt_balance MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '��������ID';
ALTER TABLE mt_banner MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '��������ID';
ALTER TABLE mt_book MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_book_item MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_cart MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_commission_cash MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_commission_log MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_commission_rule MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_commission_rule_item MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_confirm_log MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '��������ID';
ALTER TABLE mt_coupon MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_coupon_group MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_freight MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_give MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_goods MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '��������ID';
ALTER TABLE mt_goods_cate MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '��������ID';
ALTER TABLE mt_open_gift MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_order MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '��������ID';
ALTER TABLE mt_point MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_printer MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_refund MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_send_log MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_setting MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_settlement MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_sms_sended_log MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_sms_template MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_staff MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_stock MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_table MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_user MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '��������ID';
ALTER TABLE mt_user_action MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE mt_user_coupon MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT 'ʹ�õ���ID';
ALTER TABLE mt_user_group MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';
ALTER TABLE t_account MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '��������ID';
ALTER TABLE t_action_log MODIFY `store_id` bigint NULL DEFAULT '0' COMMENT '����ID';


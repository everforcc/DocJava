-- 1. �鿴�����ű�
show create table mt_coupon;

-- 2. ��װ�����̻�id�ű�
--                                                 COUPON_ID        int            default 0         null comment '��ȯID',
SELECT concat('ALTER TABLE ', TABLE_NAME, ' MODIFY `coupon_id` bigint  DEFAULT ''0'' null COMMENT ''��ȯID'';') as s
FROM INFORMATION_SCHEMA.Columns
WHERE COLUMN_NAME = 'coupon_id';

-- 3. modify�ű�
ALTER TABLE mt_confirm_log MODIFY `coupon_id` bigint  DEFAULT '0' null COMMENT '��ȯID';
ALTER TABLE mt_coupon_goods MODIFY `coupon_id` bigint  not null COMMENT '��ȯID';
ALTER TABLE mt_open_gift MODIFY `coupon_id` bigint  DEFAULT '0' not null COMMENT '��ȯID';
ALTER TABLE mt_send_log MODIFY `coupon_id` bigint  DEFAULT '0' null COMMENT '��ȯID';
ALTER TABLE mt_user_coupon MODIFY `coupon_id` bigint  DEFAULT '0' not null COMMENT '��ȯID';

-- select e.COUPON_ID,e.* from mt_order e where e.COUPON_ID = '0';
-- �޸��ֶ�
ALTER TABLE mt_order MODIFY COUPON_ID VARCHAR(255) DEFAULT '' comment '��ȯID';
-- ������ʷ����
update mt_order set COUPON_ID = '' where COUPON_ID = '0';

-- ʹ�ÿ�ȯ�Ķ���
SELECT e.COUPON_ID, e.*
FROM mt_order e
where e.COUPON_ID != '';

-- ���ݶ����Ų�ѯ
select e.AMOUNT, e.DISCOUNT, e.PAY_AMOUNT, e.*
from mt_order e
where e.ORDER_SN = '202410221737421703777';

-- ��ʱ����
SELECT e.REMARK, e.CREATE_TIME, e.COUPON_ID, e.*
FROM mt_order e
where e.REMARK = '��ʱδ֧��ȡ��'
order by e.REMARK desc;

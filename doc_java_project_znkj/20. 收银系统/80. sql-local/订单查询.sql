
-- ������ �û���ȯ�������ϵ
SELECT e.COUPON_ID,e.* FROM mt_order e where e.COUPON_ID != '';
select * from mt_user_coupon e where e.ID in (165,167,157);
select * from mt_coupon e;

-- ��ʱ�����鿴
SELECT e.REMARK, e.CREATE_TIME, e.COUPON_ID, e.*
FROM mt_order e
order by e.REMARK desc;

select e.AMOUNT,e.DISCOUNT,e.PAY_AMOUNT,e.* from mt_order e where e.ORDER_SN = '202410221737421703777';

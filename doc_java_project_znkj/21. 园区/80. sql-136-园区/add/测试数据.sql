
-- sn, user
select e.sn,e.MERCHANT_ID,e.STORE_ID,e.* from mt_user e
where e.sn = '666688887777';

-- store
select * from mt_store e
where e.sn = '666688887777';

-- �ƴο�
select * from mt_coupon e ;
select * from mt_user_coupon e ;
-- ��ȯ������¼
select * from mt_confirm_log e ;

-- sn, user
select e.sn,e.MERCHANT_ID,e.STORE_ID,e.* from mt_user e
where e.sn = '666688887777';

-- store
select * from mt_store e
where e.sn = '666688887777';

-- 计次卡
select * from mt_coupon e ;
select * from mt_user_coupon e ;
-- 卡券核销记录
select * from mt_confirm_log e ;
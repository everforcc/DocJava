-- 购物车
SELECT e.CREATE_TIME,e.* FROM mt_cart e order by e.CREATE_TIME desc ;

-- 测试 理发计次卡商品名 使用卡券
SELECT e.NUM,e.GOODS_ID,e.CREATE_TIME,e.* FROM mt_cart e
where e.ID = 214
order by e.CREATE_TIME desc ;
SELECT e.is_single_spec,e.* FROM mt_goods e where e.ID = '578';
select * from mt_coupon_goods e where e.GOODS_ID = 578 ;
select * from mt_coupon e where e.ID = 5;
select * from mt_user_coupon e
where e.COUPON_ID = 5 and e.USER_ID = 40 and e.STATUS = 'A' ;
-- 核销记录
select  e.CREATE_TIME, e.COUPON_ID,e.* from mt_confirm_log e
order by e.CREATE_TIME desc;
-- 核销合计
select count(*) from mt_confirm_log e
where e.COUPON_ID = 5;
select  e.CREATE_TIME, e.COUPON_ID,e.* from mt_confirm_log e
where e.COUPON_ID = 168;

-- 查询卡券状态
SELECT t.USER_ID,t.STATUS,t.COUPON_ID,t.* FROM mt_user_coupon t WHERE t.ID = 166;
SELECT t.USER_ID,t.STATUS,t.COUPON_ID,t.* FROM mt_user_coupon t WHERE t.ID = 168;

select e.OUT_RULE,e.* from mt_coupon e
where e.ID in (5,6);

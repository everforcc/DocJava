-- 购物车
SELECT e.CREATE_TIME,e.* FROM mt_cart e order by e.CREATE_TIME desc ;

-- 测试 理发计次卡商品名 使用卡券
SELECT e.NUM,e.GOODS_ID,e.CREATE_TIME,e.* FROM mt_cart e
where e.ID = 214
order by e.CREATE_TIME desc ;

SELECT e.is_single_spec,e.* FROM mt_goods e where e.ID = '578';

-- 核销记录
select  e.CREATE_TIME, e.COUPON_ID,e.* from mt_confirm_log e
where e.COUPON_ID = 168
order by e.CREATE_TIME desc;

-- 核销合计
select count(*) from mt_confirm_log e
where e.COUPON_ID = 5;

-- 查询卡券状态
SELECT t.USER_ID,t.STATUS,t.COUPON_ID,t.* FROM mt_user_coupon t WHERE t.ID = 166;

select e.OUT_RULE,e.* from mt_coupon e
where e.ID in (5,6);

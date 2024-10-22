
-- 卡券表
SELECT * FROM mt_coupon e;
-- 卡券商品表
SELECT * FROM mt_coupon_goods;
-- 优惠券组
SELECT * FROM mt_coupon_group;
-- 会员卡券表
SELECT * FROM mt_user_coupon e;

-- 根据商品ID查询出可用的卡券ID
-- 卡券ID，商品ID
SELECT e.coupon_id,e.goods_id,e.* FROM mt_coupon_goods e;

-- 某个用户是否有这个卡券ID
SELECT e.coupon_id,e.* FROM mt_user_coupon e
WHERE e.type = 'T' AND e.user_id = 12 AND e.status = 'A' AND e.coupon_id IN (3,5) ;

select * from mt_user e
where e.ID = '4';

--
SELECT t.USER_ID,t.COUPON_ID,t.* FROM mt_user_coupon t
WHERE t.STATUS in ('A') and t.USER_ID = 4;

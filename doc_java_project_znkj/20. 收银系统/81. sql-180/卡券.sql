
-- 卡券表
SELECT e.STATUS,e.* FROM mt_coupon e
where e.STATUS = 'D';

-- 卡券商品表
SELECT * FROM mt_coupon_goods;
SELECT * FROM mt_coupon_goods e
where e.GOODS_ID = 714;


-- 优惠券组
SELECT * FROM mt_coupon_group;
-- 会员卡券表
SELECT * FROM mt_user_coupon e
where e.COUPON_ID = 60
and e.STATUS = 'B';

-- 714

SELECT e.STATUS,e.* FROM mt_coupon e
where e.ID = 87;
SELECT e.STATUS,e.* FROM mt_coupon_goods e
where e.COUPON_ID = 87;
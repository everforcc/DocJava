-- 卡券表
SELECT *
FROM mt_coupon e;

-- 卡券商品表
SELECT *
FROM mt_coupon_goods;

-- 优惠券组
SELECT *
FROM mt_coupon_group;

-- 会员卡券表
SELECT e.COUPON_ID, e.STATUS, e.*
FROM mt_user_coupon e
where e.USER_ID = 40
  and e.COUPON_ID = 5
  and e.ID in (170, 173, 174, 175)
order by e.CREATE_TIME desc;


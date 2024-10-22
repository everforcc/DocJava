-- 卡券表
SELECT * FROM mt_coupon e;
-- 卡券商品表
SELECT * FROM mt_coupon_goods;
-- 优惠券组
SELECT * FROM mt_coupon_group;
-- 会员卡券表
SELECT * FROM mt_user_coupon e;

SELECT * FROM mt_coupon e where e.ID in (5,6);

SELECT e.TYPE,e.COUPON_ID,e.STATUS,e.CREATE_TIME,e.* FROM mt_user_coupon e
where e.USER_ID = 40
and e.STATUS = 'A'
and e.TYPE='T';

-- 卡券表
SELECT e.STATUS,e.* FROM mt_coupon e
where e.TYPE = 'T'
and e.NAME = '测试计次卡'
and e.STATUS = 'A';

-- 卡券商品表
-- mt_coupon.id和 mt_goods.id 关联
SELECT * FROM mt_coupon_goods;

-- 优惠券组
-- 很少用到
SELECT * FROM mt_coupon_group;

-- 会员卡券表
SELECT e.USER_ID,e.* FROM mt_user_coupon e
where e.USER_ID = 40;
select * from mt_user e
where e.ID = 40;
-- 根据ID查询
select *
from mt_user_coupon e
where e.ID in (165, 167, 157);

-- 某个用户是否有这个卡券ID
SELECT e.coupon_id,e.* FROM mt_user_coupon e
WHERE e.type = 'T' AND e.user_id = 12
AND e.status = 'A' AND e.coupon_id IN (3,5) ;

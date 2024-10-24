-- 查询用户信息
SELECT * FROM mt_user;

-- 购物车
SELECT e.NUM,e.GOODS_ID,e.CREATE_TIME,e.* FROM mt_cart e order by e.CREATE_TIME desc ;

-- 商品
SELECT e.is_single_spec,e.* FROM mt_goods e where e.ID = '578';

-- 商品和卡券关联
select * from mt_coupon_goods e where e.GOODS_ID = 578 ;

-- 卡券信息
select * from mt_coupon e where e.ID = 5;

-- 卡券分配用户
select * from mt_user_coupon e
where e.COUPON_ID = 5 and e.USER_ID = 40 and e.STATUS = 'A' ;


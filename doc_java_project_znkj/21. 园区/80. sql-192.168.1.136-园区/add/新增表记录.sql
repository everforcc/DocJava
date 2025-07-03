-- 新增表名记录，直接查询使用，至于随后同步的结果就先不管了，自己手动录入数据
-- 缺少一个经销商账号和sn关联的表，就先写死几个

-- 用户
select * from mt_user e ;
-- 店铺
select * from mt_store e ;
-- 计次卡
select * from mt_coupon e ;
select * from mt_user_coupon e ;
-- 卡券核销记录
select * from mt_confirm_log e ;

-- 优惠券
select * from zn_cashier_card e ;
select * from zn_cashier_card_store e ;
-- 广告

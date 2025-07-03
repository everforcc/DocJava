
-- 广告表
SELECT e.del_flag,e.status,e.* FROM zn_cashier_adver e;
-- 优惠券表
SELECT e.del_flag,e.status,e.* FROM zn_cashier_card e ORDER BY e.id DESC;
-- 优惠券和店铺关联表
SELECT e.* FROM zn_cashier_card_store e ORDER BY e.id DESC;

-- 同步表
-- 用户表
SELECT * FROM mt_user ;
SELECT * FROM mt_store ;
SELECT * FROM mt_user_coupon ;
SELECT * FROM mt_coupon ;
SELECT * FROM mt_confirm_log ;

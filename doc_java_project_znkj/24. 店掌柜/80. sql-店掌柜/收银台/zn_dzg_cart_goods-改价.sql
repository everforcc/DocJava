
-- 测试商品结算改价
-- 购物车新增四个商品
-- 111111111 111111112 233456789
-- 数量 1 1 2
-- 价格 3 3 5
-- 抵扣后 3 3 5 = 11
-- 改价 10 元 3个商品

-- 最终结算价格为
-- 3个商品 10元

SELECT *
FROM zn_dzg_product e
WHERE e.name like '%可乐%';

-- 会员卡
select * from zn_dzg_card_member e ;
-- 会员卡商品
select * from zn_dzg_card_member_product e ;


-- 购物车
select * from zn_dzg_cart_goods e
where e.cart_id = 1897214504005689346;





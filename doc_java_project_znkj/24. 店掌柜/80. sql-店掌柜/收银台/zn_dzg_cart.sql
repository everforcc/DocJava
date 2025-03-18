
-- 商品
select *
from zn_dzg_product e
where e.id = 1894221408124956674
  and e.barcode = '123456789';

select * from zn_dzg_card_member e ;
SELECT *
FROM zn_dzg_product e
WHERE e.name like '%可乐%';

select * from zn_dzg_card_member_product e ;

-- 价签
-- 8795687210500
select *
from zn_dzg_price_tag e
where e.code = 1;

-- 233
-- 1894217210645868545 1894217458202079234 1894217471640629249
-- 234
-- 1894217513076158466
-- 购物车
select *
from zn_dzg_cart e;

-- 新增购物车编号
select e.num
from zn_dzg_cart e
where e.num not in (1, 2, 3, 4);


-- 购物车商品
select *
from zn_dzg_cart_goods e;

-- 新增购物车商品，计算价格
UPDATE zn_dzg_cart_goods
SET goods_end_price = goods_unit_price * (goods_num + 1),
    goods_num   = goods_num + 1
WHERE goods_id = 1894221408124956674
  AND cart_id = 1894217513076158466;


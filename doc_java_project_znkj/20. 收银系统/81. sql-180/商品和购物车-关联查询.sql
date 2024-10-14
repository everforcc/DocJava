-- 商品
SELECT e.stock,e.weight,e.IS_SINGLE_SPEC,e.price,e.* FROM mt_goods e
ORDER BY e.id DESC;
SELECT e.stock,e.weight,e.IS_SINGLE_SPEC,e.* FROM mt_goods e
WHERE e.id = 582
ORDER BY e.id DESC;
 
-- 最新的购物车
SELECT e.weight,e.num,e.IS_SINGLE_SPEC,e.* FROM mt_cart e ORDER BY e.id DESC;
SELECT e.weight,e.num,e.IS_SINGLE_SPEC,e.* FROM mt_cart e 
WHERE e.id = 162 ORDER BY e.id DESC;

-- 商品和购物车关联查询
SELECT e.weight,e.num,e.IS_SINGLE_SPEC,g.IS_SINGLE_SPEC,g.price,e.goods_id,e.* FROM mt_cart e,mt_goods g
WHERE e.STATUS = 'A' AND e.user_id = 2 AND e.merchant_id = 1 AND e.hang_no = '' 
AND e.goods_id = g.id;

-- 设备 本地配置
SELECT * FROM zn_local e;


-- 商品规格
select * from mt_goods_spec e
where e.GOODS_ID = 602;
-- 商品库存
select * from mt_goods_sku e
where e.GOODS_ID = 602;
-- 商品规格 倒序
select * from mt_goods_spec e order by e.ID desc;
-- 商品库存 倒序
select * from mt_goods_sku e order by e.ID desc;


--
select * from mt_goods_sku e
where e.SKU_NO = 172281307418530;

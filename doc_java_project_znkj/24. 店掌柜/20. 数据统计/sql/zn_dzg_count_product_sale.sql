-- 商品销售记录

-- 订单
select * from zn_dzg_order zdo
where zdo.status = 2;

-- 订单商品
select * from zn_dzg_order_goods zdog
where zdog.order_id in
      (select zdo.id
       from zn_dzg_order zdo
       where zdo.status = 2);
-- 订单金额
select * from zn_dzg_order_money zdom;

-- 订单和商品关联
select zdog.*
from zn_dzg_order_goods zdog
where zdog.order_id in
      (select zdo.id
       from zn_dzg_order zdo
       where zdo.status = 2)
group by zdog.goods_id;

-- 订单和金额关联
select *
from zn_dzg_order_goods zdog
         left join zn_dzg_order_money zdom on zdog.order_id = zdom.order_id
where zdom.order_type = 2;


-- 卡券，线上，线下 CASE when
select zdog.goods_name product_name,
       zdog.goods_id product_id,
       zdp.inventory as inventory,
       zdp.spec_name as spec_name,
       sum(zdog.goods_num)    sale_num,
       sum(zdog.goods_weight) sale_weight,
       sum(zdog.end_price)    sale_amount,
       sum(IF(zdom.pay_type = 1, zdog.end_price, 0))
           as pay_online,
       sum(IF(zdom.pay_type = 2, zdog.end_price, 0))
           as pay_outline,
       sum(IF(zdom.pay_type = 3, zdog.end_price, 0))
           as pay_card,
       sum(IF(zdom.pay_type not in (1,2,3) or zdom.pay_type is null, zdom.amount, 0))
           as pay_else,
       zdom.order_type
from zn_dzg_order_goods zdog
         left join zn_dzg_order_money zdom on zdog.order_id = zdom.order_id
        left join zn_dzg_product zdp on zdog.goods_id = zdp.id
where zdog.order_id in
      (select zdo.id
       from zn_dzg_order zdo
       where zdo.status = 2)
  and zdom.order_type = 1
group by zdog.goods_id;

-- 库存， 规格，
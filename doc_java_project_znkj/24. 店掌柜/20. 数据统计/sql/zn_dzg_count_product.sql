-- 商品销售记录

-- 订单
select *
from zn_dzg_order zdo
where zdo.status = 2;
-- 订单商品
select *
from zn_dzg_order_goods zdog
where zdog.order_id in
      (select zdo.id
       from zn_dzg_order zdo
       where zdo.status = 2);
-- 订单金额
select *
from zn_dzg_order_money zdom;
;

-- 订单和商品关联
select zdog.*
from zn_dzg_order_goods zdog
where zdog.order_id in
      (select zdo.id
       from zn_dzg_order zdo
       where zdo.status = 2)
group by zdog.goods_id;
;


-- 订单和金额关联
select *
from zn_dzg_order_goods zdog
         left join zn_dzg_order_money zdom on zdog.order_id = zdom.order_id
where zdom.order_type = 2;

-- 卡券，线上，线下
select zdog.goods_name,
       zdog.goods_id,
       zdog.goods_num    '销售数量',
       zdog.goods_weight '销售重量',
       zdog.end_price    '销售金额',
       zdom.order_type
from zn_dzg_order_goods zdog
         left join zn_dzg_order_money zdom on zdog.order_id = zdom.order_id
where zdog.order_id in
      (select zdo.id
       from zn_dzg_order zdo
       where zdo.status = 2)
  and zdom.order_type = 2
group by zdog.goods_id;

-- 卡券，线上，线下
select zdog.goods_name,
       zdog.goods_id,
       sum(zdog.goods_num)    '销售数量',
       sum(zdog.goods_weight) '销售重量',
       sum(zdog.end_price)    '销售金额',
       zdom.order_type
from zn_dzg_order_goods zdog
         left join zn_dzg_order_money zdom on zdog.order_id = zdom.order_id
where zdog.order_id in
      (select zdo.id
       from zn_dzg_order zdo
       where zdo.status = 2)
  and zdom.order_type = 2
group by zdog.goods_id;

-- 库存， 规格，
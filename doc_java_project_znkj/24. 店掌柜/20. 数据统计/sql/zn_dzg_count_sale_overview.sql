-- zn_dzg_count_sale_overview

-- 营业概况 每天统计一次

select *
from zn_dzg_order zdo
where zdo.status = 2;

select zdom.amount, zdom.pay_type
from zn_dzg_order_money zdom
         left join zn_dzg_order zdo on zdo.id = zdom.order_id
where zdo.status = 2
  and (zdom.pay_type not in (1,2,3) or zdom.pay_type is null );

-- sum
select sum(zdom.amount)
from zn_dzg_order_money zdom
         left join zn_dzg_order zdo on zdo.id = zdom.order_id
where zdo.status = 2;

-- 1
select sum(zdom.amount)
from zn_dzg_order_money zdom
         left join zn_dzg_order zdo on zdo.id = zdom.order_id
where zdo.status = 2 and zdom.pay_type = 1;

-- 2
select sum(zdom.amount)
from zn_dzg_order_money zdom
         left join zn_dzg_order zdo on zdo.id = zdom.order_id
where zdo.status = 2 and zdom.pay_type = 2;

-- 3
select sum(zdom.amount)
from zn_dzg_order_money zdom
         left join zn_dzg_order zdo on zdo.id = zdom.order_id
where zdo.status = 2 and zdom.pay_type = 3;

-- 123
select sum(zdom.amount)
from zn_dzg_order_money zdom
         left join zn_dzg_order zdo on zdo.id = zdom.order_id
where zdo.status = 2 and zdom.pay_type in (1,2,3);

-- 卡销售数量
select count(1)
from zn_dzg_order_money zdom
         left join zn_dzg_order zdo on zdo.id = zdom.order_id
where zdo.status = 2 and zdom.order_type = 2;

-- 卡销售金额
select sum(zdom.amount)
from zn_dzg_order_money zdom
         left join zn_dzg_order zdo on zdo.id = zdom.order_id
where zdo.status = 2 and zdom.order_type = 2;

-- 卡续费金额
select sum(zdom.amount)
from zn_dzg_order_money zdom
         left join zn_dzg_order zdo on zdo.id = zdom.order_id
where zdo.status = 2 and zdom.order_type = 4;

-- todo 缺少退款汇总
-- zn_dzg_count_sale_overview
select
       sum(zdom.amount) as pay_count,
       sum(case
           when zdom.order_type = 1 and zdom.pay_type = 1 then zdom.amount
           else 0
           end)
           as pay_online,
       sum(case
           when zdom.order_type = 1 and zdom.pay_type = 2 then zdom.amount
           else 0
           end)
           as pay_outline,
       sum(case
           when zdom.order_type = 1 and zdom.pay_type = 3 then zdom.amount
           else 0
           end)
           as pay_card,
       sum(case
           when zdom.order_type = 1 and (zdom.pay_type not in (1,2,3) or zdom.pay_type is null) then zdom.amount
           else 0
           end)
           as pay_else,
       sum(case
           when zdom.order_type = 2 then 1
           else 0
           end)
           as card_sale_num,
       sum(case
           when zdom.order_type = 2 then zdom.amount
           else 0
           end)
           as card_sale_money,
       sum(case
           when zdom.order_type = 4 then zdom.amount
           else 0
           end)
           as card_recharge_money,
       sum(case
           when zdom.order_type = 1 then 1
           else 0
           end)
           as order_count,
       sum(case
           when zdom.order_type = 1 and zdo.member_id is not null then 1
           else 0
           end)
           as order_member_count,
       sum(case
           when zdom.order_type = 1 and zdo.member_id is null then 1
           else 0
           end)
           as order_visitor_count
from zn_dzg_order_money zdom
         left join zn_dzg_order zdo on zdo.id = zdom.order_id
where zdo.status = 2;
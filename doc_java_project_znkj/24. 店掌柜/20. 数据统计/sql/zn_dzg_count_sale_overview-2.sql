select
       sum(zdom.amount) as pay_count,
       sum(IF(zdom.order_type = 1 and zdom.pay_type = 1, zdom.amount, 0))
           as pay_online,
       sum(IF(zdom.order_type = 1 and zdom.pay_type = 2, zdom.amount, 0))
           as pay_outline,
       sum(IF(zdom.order_type = 1 and zdom.pay_type = 3, zdom.amount, 0))
           as pay_card,
       sum(IF(zdom.order_type = 1 and (zdom.pay_type not in (1, 2, 3) or zdom.pay_type is null), zdom.amount, 0))
           as pay_else,
       sum(IF(zdom.order_type = 2, 1, 0))
           as card_sale_num,
       sum(IF(zdom.order_type = 2, zdom.amount, 0))
           as card_sale_money,
       sum(IF(zdom.order_type = 4, zdom.amount, 0))
           as card_recharge_money,
       sum(IF(zdom.order_type = 1, 1, 0))
           as order_count,
       sum(IF(zdom.order_type = 1 and zdo.member_id is not null, 1, 0))
           as order_member_count,
       sum(IF(zdom.order_type = 1 and zdo.member_id is null, 1, 0))
           as order_visitor_count
from zn_dzg_order_money zdom
         left join zn_dzg_order zdo on zdo.id = zdom.order_id
where zdo.status = 2 and zdo.del_flag = 0
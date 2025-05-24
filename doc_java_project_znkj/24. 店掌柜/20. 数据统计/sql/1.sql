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
                     as order_visitor_count,
    sum(zdor.amount) pay_refund
#             STR_TO_DATE(#{start}, '%Y-%m-%d') countTime
from zn_dzg_order_money zdom
         left join zn_dzg_order zdo on zdo.id = zdom.order_id
         left join zn_dzg_order_refund zdor on zdor.order_id = zdom.order_id
where zdo.status in (2, 4) and zdo.del_flag = 0
  and zdo.create_time between '2025-05-19T00:00' and '2025-05-19T23:59';





select
    zdom.order_id,zdom.amount
from zn_dzg_order_money zdom
         left join zn_dzg_order zdo on zdo.id = zdom.order_id
         left join zn_dzg_order_refund zdor on zdor.order_id = zdom.order_id
where zdo.status in (2, 4) and zdo.del_flag = 0 and zdom.order_type = 1 and zdom.pay_type = 1
  and zdo.create_time between '2025-05-19T00:00' and '2025-05-19T23:59';

select *
from zn_dzg_order_money zdom where zdom.order_id = 1924304561810616322;

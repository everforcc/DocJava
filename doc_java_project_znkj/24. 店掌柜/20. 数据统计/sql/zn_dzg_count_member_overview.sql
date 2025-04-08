-- zn_dzg_count_member_overview

-- 新增会员数
select *
from zn_dzg_member zdm
where zdm.del_flag = 0
  and zdm.create_time between '2025-04-07 17:00:00' and '2025-04-08 19:00:00'
;

-- 交易额, 交易订单数量
select sum(1) count_order_num,
       sum(zdom.amount) count_amount
from zn_dzg_order zdo
         left join zn_dzg_order_money zdom on zdom.order_id = zdo.id
where zdo.status = 2
  and zdo.member_id is not null
and zdo.create_time between '2025-04-07 17:00:00' and '2025-04-08 19:00:00';
--
select zdom.amount,zdo.*
from zn_dzg_order zdo
left join zn_dzg_order_money zdom on zdom.order_id = zdo.id
where zdo.status = 2
  and zdo.member_id is not null
  and zdo.create_time between '2025-04-07 17:00:00' and '2025-04-08 19:00:00';

--


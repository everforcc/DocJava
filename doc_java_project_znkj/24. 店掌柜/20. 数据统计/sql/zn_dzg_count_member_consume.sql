
--
-- zn_dzg_count_member_consume

select zdo.member_id member_id,
       zdm.phone member_phone,
       zdm.gender member_gender,
       sum(zdom.amount) count_amount
from zn_dzg_order zdo
left join zn_dzg_member zdm on zdo.member_id = zdm.id
left join zn_dzg_order_money zdom on zdo.id = zdom.order_id
where zdo.member_id is not null and zdo.status = 2
  and zdo.create_time between '2025-04-07 17:00:00' and '2025-04-08 19:00:00'
group by zdo.member_id
;

select * from zn_dzg_order zdo
where zdo.member_id is not null
group by zdo.member_id;

select zdo.member_id,sum(zdo.end_price) from zn_dzg_order zdo
where zdo.member_id is not null
group by zdo.member_id
;

-- 1907330299637407745
select * from zn_dzg_order_money e
where e.order_id = 1907330299637407745;

select sum(zdom.amount) from zn_dzg_order_money zdom
where zdom.order_id in(
select zdo.id from zn_dzg_order zdo
where zdo.member_id is not null and zdo.status = 2
  and zdo.create_time between '2025-04-07 17:00:00' and '2025-04-08 17:00:00')
;

-- ≤È—Ø∂©µ•œÍ«È
-- 1909502340430348289
-- 1909524288883441666
select * from zn_dzg_order zdo
where zdo.id in (1909502340430348289,1909524288883441666,1909545710670364674,1909546181757812738);
-- 1909546181757812738
select * from zn_dzg_order_money zdom
where zdom.order_id = 1909546181757812738;


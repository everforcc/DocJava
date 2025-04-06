select e.status, e.un_pay_status, e.create_time, e.type, e.end_price, e.extra_price, e.*
from zn_dzg_order e
-- where e.status = 1
  -- and e.un_pay_status = 1
order by e.create_time desc;

-- 1908809352496201729
-- 1908809260066324482
select e.*
from zn_dzg_order_goods e
where e.order_id = 1908809352496201729
order by e.create_time desc
;

select *
from sys_user e
order by e.create_time desc;

-- 1908772182184091649
select * from zn_dzg_order_goods e
where e.order_id = 1908785976285261826;
-- 1908772182020513793
select * from zn_dzg_card_member_recharge_log e
where e.id = 1908773789969866753;
-- 1908772181940822017
select * from zn_dzg_card_member e
where e.id = 1908773789936312321;

--

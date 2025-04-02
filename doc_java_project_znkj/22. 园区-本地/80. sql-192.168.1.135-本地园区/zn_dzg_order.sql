select e.status, e.un_pay_status, e.create_time, e.type, e.end_price, e.extra_price, e.*
from zn_dzg_order e
where e.status = 1
  and e.un_pay_status = 1
order by e.create_time desc;

select e.*
from zn_dzg_order_goods e
where e.order_id = 1907346542348136449;

select *
from sys_user e
order by e.create_time desc;


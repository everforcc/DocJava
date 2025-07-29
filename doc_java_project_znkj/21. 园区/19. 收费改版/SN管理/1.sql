select count(zcd.consume)
from zn_coin_detail zcd
         join zn_pay_order zpo on zcd.order_id = zpo.id
where zpo.status = 1 and zpo.order_type in (0,4)
  and zpo.del_flag = 0
  and zpo.zn_device_sn_var = 'ZL0123456787';
-- count(zcd.consume)
-- 统计某个SN消费的金豆数
select sum(zcd.consume)
from zn_coin_detail zcd
where zcd.order_id in (
    select zpo.id from zn_pay_order zpo
    where zpo.status = 1 and zpo.order_type in (0,4)
    and zpo.del_flag = 0
    and zpo.zn_device_sn_var = 'ZL0123456787'
    );

select count(zcd.consume)
from zn_coin_detail zcd
where zcd.order_id in (1143320266223525888);

-- 1143320266223525888
select *
from zn_coin_detail zcd
where zcd.order_id = 1143320266223525888;
-- zn_dzg_count_sale_total

-- 今日
-- 销售额
select sum(zdom.amount)
from zn_dzg_order_money zdom
where zdom.order_id in
      (select zdo.id
       from zn_dzg_order zdo
       where zdo.status = 2)
and zdom.order_type in (1,2);

-- 订单数
select count(1)
from zn_dzg_order zdo
where zdo.status = 2;

-- 会员总数
select count(1)
from zn_dzg_member zdm
where zdm.del_flag = 0;

-- 卡总余额
select sum(zdcm.amounts)
from zn_dzg_card_member zdcm
where zdcm.del_flag = 0 and zdcm.status = 1 ;

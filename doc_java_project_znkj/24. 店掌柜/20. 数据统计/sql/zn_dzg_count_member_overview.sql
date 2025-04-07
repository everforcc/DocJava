-- zn_dzg_count_member_overview

-- 新增会员数
select count(1) count_new
from zn_dzg_member zdm
;

-- 交易额, 交易订单数量
select sum(1) count_order_num,
       sum(zdo.end_price) count_amount
from zn_dzg_order zdo
where zdo.status = 2
  and zdo.member_id is not null;

--
select zdo.*
from zn_dzg_order zdo
where zdo.status = 2
  and zdo.member_id is not null;

--


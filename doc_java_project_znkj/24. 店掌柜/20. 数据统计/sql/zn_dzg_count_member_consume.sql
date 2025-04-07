
-- zn_dzg_count_member_consume

select zdo.member_id member_id,
       zdo.member_name member_name,
       sum(zdo.end_price) count_amount
from zn_dzg_order zdo
where zdo.member_id is not null
group by zdo.member_id
;


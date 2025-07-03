delete from zn_dzg_count_card_sale;
delete from zn_dzg_count_member_consume;
delete from zn_dzg_count_member_overview;
delete from zn_dzg_count_product_category;
delete from zn_dzg_count_product_sale;
delete from zn_dzg_count_product_stock;
delete from zn_dzg_count_sale_overview;
delete from zn_dzg_count_sale_total;
-- delete from zn_dzg_count_time;


select sum(1)           count_order_num,
       sum(zdom.amount) count_amount
from zn_dzg_order zdo
         left join zn_dzg_order_money zdom on zdom.order_id = zdo.id
where zdo.status in (2, 4)
  and zdo.del_flag = 0
  and zdo.member_id is not null
  and zdo.create_time between '2025-04-24 00:00:00' and '2025-04-25 00:00:00';

select zdo.status,zdo.*
from zn_dzg_order zdo
where zdo.status in (2, 4) -- and zdo.del_flag = 0
  and zdo.member_id is not null
  and zdo.create_time between '2025-04-28 00:00:00' and '2025-04-29 00:00:00';

-- 云端数据同步
update zn_dzg_count_card_sale set up_flag = 0 , up_count = 0;
update zn_dzg_count_product_sale set up_flag = 0 , up_count = 0;
update zn_dzg_count_sale_total set up_flag = 0 , up_count = 0;
select * from zn_dzg_count_card_sale e;
select count(*) from zn_dzg_count_card_sale e;
select * from zn_dzg_count_product_sale e;
select count(*) from zn_dzg_count_product_sale e;
select * from zn_dzg_count_sale_total e;
select count(*) from zn_dzg_count_sale_total e;
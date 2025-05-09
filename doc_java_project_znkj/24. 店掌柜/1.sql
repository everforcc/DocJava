select sum(JSON_UNQUOTE(JSON_EXTRACT(data,'$.\"缴费金额\"')))
from zn_fee_dynamic_data
where id = 1915755135479365634;

select JSON_UNQUOTE(JSON_EXTRACT(data,'$.\"缴费金额\"'))
from zn_fee_dynamic_data;

select *
from zn_fee_dynamic_data  where JSON_UNQUOTE(JSON_EXTRACT(data,'$.\"电话号码\"')) = 15515636569;

select *
from zn_fee_dynamic_data where data like '%\"缴费金额\": \"30\"%';

/*某一天卡券的销售记录（销售额不包含卡续费的钱*/
select zdc.name card_name,
       zdcm.card_id card_id,
       count(1) sale_num,
       sum(zdcm.sale_price) sale_amount,
       sum(zdcm.amounts) card_balance,
       STR_TO_DATE('2025-04-29 00:00:00', '%Y-%m-%d') countTime
from zn_dzg_card_member zdcm
         left join zn_dzg_card zdc on zdcm.card_id = zdc.id
where zdcm.del_flag = 0
  and zdcm.create_time between '2025-04-29 00:00:00' and '2025-04-30 00:00:00'
group by zdcm.card_id;
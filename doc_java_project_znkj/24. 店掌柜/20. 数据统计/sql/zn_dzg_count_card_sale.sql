-- ¿¨ÏúÊÛ¼ÇÂ¼
-- zn_dzg_count_card_sale

select * from zn_dzg_card_member zdcm;

select zdc.name card_name,
       zdcm.card_id card_id,
       count(1) sale_num,
       sum(zdcm.sale_price) sale_amount,
       sum(zdcm.amounts) card_balance
from zn_dzg_card_member zdcm
left join zn_dzg_card zdc on zdcm.card_id = zdc.id
group by zdcm.card_id;




select * from zn_dzg_card e
where e.id = 123456789;

select e.amounts,e.discount,e.frequency_Limit,e.* from zn_dzg_card_member e
where e.id = 123456789;

select e.* from zn_dzg_card_member_product e
where e.card_member_id = 123456789;


select e.sale_type,e.* from zn_dzg_product e
where e.id in (1894221408124956676, 1894221408124956674);


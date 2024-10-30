select e.merchant_id,e.store_id,e.acct_id,e.* from t_account e
where e.account_name = 'admin';
#
update t_account set merchant_id = 0,store_id = 0
where acct_id = 2;

SELECT e.status,e.* FROM `t_source` e
where e.source_name = 'Éú³É´úÂë';

SELECT e.status,e.* FROM `t_source` e
where e.source_id = 188;

SELECT distinct e.merchant_id FROM `t_source` e
where e.source_id = 188;

update t_source set status = 'D'
where source_id = 187;


select * from t_account e;

select * from mt_merchant e;

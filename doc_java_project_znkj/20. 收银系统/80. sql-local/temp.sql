select e.acct_id,e.is_active,e.account_status,e.account_name,e.real_name,e.* from t_account e
where e.acct_id = 14;

SELECT t.MERCHANT_ID,t.* FROM mt_user t;

SELECT t.MOBILE,t.* FROM mt_user t WHERE t.MOBILE like '%4578%';

-- uploads/20241011/efd0e07fa00141d999224990c2f6f59b.png
-- ["uploads/20241011/efd0e07fa00141d999224990c2f6f59b.png"]
select * from mt_goods e
where e.LOGO like '%efd0e07fa00141d999224990c2f6f59b.png%';

SELECT *
FROM mt_goods_sku
WHERE goods_id = 605 AND status = 'A';

select e.merchant_id,e.* from t_account e
where e.account_name = 'admin';

select * from t_account_duty e;


SELECT distinct e.merchant_id FROM `t_source` e
where e.source_id = 188;

select e.merchant_id,e.store_id,e.acct_id,e.* from t_account e
where e.account_name = 'admin';
update t_account set merchant_id = 0,store_id = 0
where acct_id = 2;

select e.create_date,e.account_status,e.merchant_id,e.store_id,e.* from t_account e
order by e.create_date desc;

SELECT e.account_status,e.merchant_id,e.store_id,e.*
FROM t_account e
WHERE account_status <> -1 AND merchant_id = 1 AND store_id = 4 ORDER BY acct_id DESC LIMIT 10;

select e.acct_id, e.merchant_id, e.*
from t_account e;

select e.merchant_id,e.* from t_account e;

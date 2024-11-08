SELECT  JSON_EXTRACT(e.other_data, '$.req_seq_id') AS a,
        JSON_EXTRACT(e.other_data, '$.hf_seq_id') AS b,
       e.pay_amt
FROM zn_pay_order_record e
WHERE e.req_date = '20241106';

SELECT  sum(e.pay_amt)
FROM zn_pay_order_record e
WHERE e.req_date = '20241106';

select e.other_data
FROM zn_pay_order_record e
WHERE e.req_date = '20241107';



-- 设备信息
select * from zn_local e ;


-- Ô°ÇøÔÆ¶Ë 192.168.1.136 ÍË¿î
SELECT JSON_UNQUOTE(JSON_EXTRACT(e.other_data,'$.hf_seq_id')) AS hf_seq_id,e.pay_amt,e.req_date,e.create_time,e.other_data,e.* FROM zn_pay_order_record e
WHERE e.req_date = '20250121'
ORDER BY e.create_time DESC;

--
SELECT e.other_data,e.create_time,e.* FROM zn_pay_order_record e
where e.del_flag = 0
ORDER BY e.create_time DESC;

--
select e.create_time,e.* from zn_pay_order e
order by e.create_time desc;

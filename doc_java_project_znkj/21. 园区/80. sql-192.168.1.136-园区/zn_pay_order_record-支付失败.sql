-- todo ÷ß∏∂ ß∞‹¥¶¿Ì
-- 1102743280749256704
select e.status,
       JSON_EXTRACT(e.other_data, '$.req_seq_id') AS a,
       JSON_EXTRACT(e.other_data, '$.hf_seq_id') AS b ,
       JSON_EXTRACT(e.other_data, '$.resp_desc') AS c,
       JSON_EXTRACT(e.other_data, '$.bank_desc') AS d,
       e.notify_url,e.* from zn_pay_order_record e
where e.status = 1
order by e.create_time desc;


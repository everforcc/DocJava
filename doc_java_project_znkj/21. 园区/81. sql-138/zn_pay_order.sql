
select * from zn_pay_order e
order by e.create_time desc;

select * from zn_pay_order_record e
order by e.create_time desc;

SELECT json_unquote(JSON_EXTRACT(e.other_data,'$.hf_seq_id')) as otherDataHfSeqId,e.pay_amt,e.req_date,e.create_time,e.other_data,e.* FROM zn_pay_order_record e
order by e.create_time desc;

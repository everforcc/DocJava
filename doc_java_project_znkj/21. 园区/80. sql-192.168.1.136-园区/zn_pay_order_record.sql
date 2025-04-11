
select e.* from zn_pay_order_record e
where e.trade_type = 'A_MICROPAY';

select distinct e.order_type from zn_pay_order e ;

select e.* from zn_pay_order e
where e.order_type = 3;

select e.status,e.create_time,e.* from zn_pay_order e
where e.order_type = 5
order by e.create_time desc;
-- 1106683457842585600
select * from zn_pay_order_record e
where e.req_seqId = 1106683457842585600;



-- 1102743280749256704
select e.status,e.pay_amt,e.req_seqId,
       JSON_EXTRACT(e.other_data, '$.req_seq_id') AS a,
       JSON_EXTRACT(e.other_data, '$.hf_seq_id') AS b ,
       JSON_EXTRACT(e.other_data, '$.resp_desc') AS c,
       JSON_EXTRACT(e.other_data, '$.bank_desc') AS d,
       e.notify_url,e.* from zn_pay_order_record e
order by e.create_time desc;


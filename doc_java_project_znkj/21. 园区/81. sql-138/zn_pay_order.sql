select e.order_type, e.order_small_type, e.status, e.price, e.order_json, e.*
from zn_pay_order e
where e.order_type = 5
order by e.create_time desc;

select e.*
from zn_pay_order_record e
order by e.create_time desc;

-- http://125.40.67.238:8996/system/pay/notify/notify
SELECT json_unquote(JSON_EXTRACT(e.other_data, '$.hf_seq_id')) as otherDataHfSeqId,
       e.pay_amt,
       e.huifuId,
       e.req_date,
       e.create_time,
       e.other_data,
       e.*
FROM zn_pay_order_record e
where e.pay_amt is not null
order by e.create_time desc;

-- orderJson

select e.order_json, e.create_time, e.*
from zn_pay_order e
where e.zn_device_sn_var = 'ZL0123456788'
--  and e.status = 1
  and e.order_type = 0
order by e.create_time desc
;

select e.order_json, e.create_time, e.*
from zn_pay_order e
order by e.create_time desc;

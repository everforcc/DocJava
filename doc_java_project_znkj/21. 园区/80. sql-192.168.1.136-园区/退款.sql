-- 查询哪一天支付要退款的数据
SELECT e.other_data,e.* FROM zn_pay_order_record e
WHERE e.req_date = '20250611'
ORDER BY e.create_time DESC;

-- 没有 wm_concat
SELECT GROUP_CONCAT(e.other_data) FROM zn_pay_order_record e
WHERE e.req_date = '20241105'
GROUP BY e.req_date;

-- 某天需要退款的数据
SELECT  JSON_EXTRACT(e.other_data, '$.req_seq_id') AS a,
        JSON_EXTRACT(e.other_data, '$.hf_seq_id') AS b ,
       e.pay_amt
        -- ,e.create_time
FROM zn_pay_order_record e
 WHERE e.req_date = '20250611'
order by e.create_time desc;

-- 联合查询，暂时没用
SELECT bb.* FROM (
     SELECT  JSON_EXTRACT(e.other_data, '$.req_seq_id') AS a,
             JSON_EXTRACT(e.other_data, '$.hf_seq_id') AS b ,
             e.id
     FROM zn_pay_order_record e
     WHERE e.req_date = '20241106') aa
    LEFT JOIN zn_pay_order_record bb
        ON aa.id = bb.id
WHERE aa.a = '1051223210424672256';


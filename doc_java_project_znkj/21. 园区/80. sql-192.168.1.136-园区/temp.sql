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

-- 重置 事件 为原始状态
update zn_ais_event_data_details_operate
set
    acquire_time = NULL,
    process_time = NULL,
    create_time=now(),
    update_time=now()
where cloud_id = 103;

select e.acquire_time,e.process_time,e.* from zn_ais_event_data_details_operate e where e.cloud_id = 103;


SELECT
    e.*, a.contact_person leaseName, a.phone leasePhone
FROM
    zn_ais_event_data_details_operate e
        left join zn_device_lease a
            on e.zn_device_sn_var = a.zn_device_sn_var
WHERE
        e.id = 2 and e.process_id = ?;

SELECT e.acquire_time, e.* FROM zn_ais_event_data_details_operate e
WHERE del_flag=0 AND zn_device_sn_var = 'csff001' AND status = 1 AND acquire_time < ?;
-- csff001(String), 1(Integer), 2025-01-07T16:23:36.489930(LocalDateTime)

SELECT COUNT(*) AS total FROM zn_ais_event_data_details_operate
WHERE del_flag = 0 AND status = 0 AND zn_device_sn_var IN ('csqd001') AND create_time > ?;

select * from zn_event_process_staff e where e.user_phone = '15222222222';
select e.evaluate_level,count(e.evaluate_level) from zn_ais_event_data_details_operate e
where e.process_id = 1079454918504488960
group by e.evaluate_level;

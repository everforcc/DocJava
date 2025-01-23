select * from zn_event_process_staff e ;

--

select e.create_time,e.acquire_time,e.evaluate_url,e.process_picture,e.* from zn_ais_event_data_details_operate e

order by e.create_time desc;

-- where e.cloud_id = 1079850442848083968
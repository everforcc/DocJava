select * from zn_ais_event_data_details_operate e
where e.status = 1;

-- 1891415171296980992
select e.del_flag,e.* from zn_ais_event_data_details_operate e
where e.id = 1891415171296980992;

select count(*) from zn_ais_event_data_details_operate e;

delete from zn_ais_event_data_details_operate where id in(
(select a.id from
(select e.create_time,e.update_time,e.id,e.cloud_id,count(e.id) c from zn_ais_event_data_details_operate e
group by e.id) a
where a.c>1));

--
select * from zn_ais_event_data_details_operate a
where a.status = 0 and a.zn_device_sn_var in
(select e.zn_device_sn_var from zn_device_lease e
where e.dealer_id = 1834419293488418817
and e.manual_watch = 0);


select e.manual_watch,e.group_id,e.* from zn_device_lease e
where e.dealer_id = 1834419293488418817
and e.manual_watch = 0;

select e.create_time,e.* from zn_ais_event_data_details_operate e where
e.id = 1891415101289725952;

select e.create_time,e.del_flag,e.* from zn_ais_event_data_details_operate e
where e.id = 1892960327564312576
order by e.create_time desc;

select e.create_time,e.del_flag,e.* from zn_ais_event_data_details e
where e.id = 1892960327564312576;

select e.create_time,e.update_time,e.del_flag,e.* from zn_ais_event_data_details e
where e.id = 1892960327564312576;

select e.create_time,e.update_time,e.del_flag,e.* from zn_ais_event_data_details e
where e.zn_device_sn_var = 'ZL20250207000' order by e.create_time desc;



select e.create_time,e.update_time,e.up_flag,e.up_count,e.del_flag,e.* from zn_ais_event_data_details e
order by e.create_time asc ;

select * from zn_ais_event_data_details e
where e.up_flag = 2;



select e.group_id,e.* from zn_event_process_staff e where e.user_phone = '15222222222' ;

select * from zn_event_process_staff_group e where e.id = 1881550301102608384 ;

select e.camera_id,e.* from zn_ais_event_data_details_operate e
where e.id = 2000 and e.process_id = 1079454918504488960;

update zn_ais_event_data_details_operate set camera_id = 1869664776612081667
where camera_id = 1869664776612081666;

select e.* from zn_device_lease e
where e.zn_device_sn_var = 'ZL7391058264';

select * from zn_machine_camera e
where e.id = 1869664776612081667;

select e.id,count(e.id) from zn_machine_camera e
group by e.id;


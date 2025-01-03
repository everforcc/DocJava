
select count(*) from zn_camera e
where e.del_flag = 0;
select e.camera_snapshot,e.* from zn_camera e
where e.del_flag = 0;

select e.camera_snapshot,e.* from zn_camera e
where e.core_ip like '127%';
select e.camera_snapshot,e.* from zn_camera e
where e.ip = '127.0.0.2';
-- 127.0.0.2
select e.camera_snapshot,e.* from zn_camera e
where e.camera_id = 1107;
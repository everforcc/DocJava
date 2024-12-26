
select count(*) from zn_camera e
where e.del_flag = 0;
select e.camera_snapshot,e.* from zn_camera e
where e.del_flag = 0;


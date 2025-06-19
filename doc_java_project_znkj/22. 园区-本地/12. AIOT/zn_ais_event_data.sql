-- 0未处置，2已处置
select e.status,e.* from zn_ais_event_data e where e.status = 0 ;
select e.status,e.* from zn_ais_event_data e where e.status = 2 ;

-- 更新未处置事件的相机id

-- 更新已处置事件的相机id

-- aiot
-- 82 相机
select * from zn_machine_camera where id =1927632423394275330;
-- 84 相机
select * from zn_machine_camera where id =1927632423411052545;
-- 事件id
-- 1921134990448910336
select zaed.*
from zn_ais_event_data zaed where zaed.id = 1926988435716640768;

-- 当前事件有哪些相机
select distinct e.camera_id from zn_ais_event_data e;
-- 1927632423394275330
-- 1927632423411052545
-- 1920687117668179969

select zaed.camera_id, count(zaed.camera_id)
from zn_ais_event_data zaed group by zaed.camera_id;
select e.* from zn_device_lease e
where e.zn_device_sn_var = 'ZL5418276930';

-- ZL5418276930
-- 1829432510283517954
select zaedd.status,zaedd.create_time,zaedd.process_id,zaedd.*
from zn_ais_event_data_details_operate zaedd
where zaedd.zn_device_sn_var = 'ZL5418276930';

--
select zeps.work_status,zeps.* from zn_event_process_staff zeps
where zeps.dealer_Id = 1829432510283517954
and zeps.work_status = 1;


-- 1876524734010560512
select * from zn_event_process_rule e
where e.id = 1876524734010560512;

select e.group_id,e.* from zn_device_lease e where e.dealer_id = 1834419293488418817 and e.group_id is not null;

select e.status,e.acquire_time,e.create_time,e.* from zn_ais_event_data_details_operate e where e.zn_device_sn_var in ('ZL20250207000','ZL9826174305','ZL20250207001')
and e.status = 1;

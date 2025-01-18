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

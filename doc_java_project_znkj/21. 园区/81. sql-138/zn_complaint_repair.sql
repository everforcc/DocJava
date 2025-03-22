select e.update_time,e.* from zn_complaint_repair e
where e.zn_device_sn_var = 'ZL0123456788'
order by id desc;
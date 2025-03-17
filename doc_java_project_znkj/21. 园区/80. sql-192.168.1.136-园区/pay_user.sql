select * from zn_device_sn e where e.zn_device_sn_var = 'ZL1234567890';

select * from zn_pay_user e where e.id = 1834419293488418817 ;


select * from zn_device_sn e  where e.userid in (select a.id from zn_pay_user a) ;
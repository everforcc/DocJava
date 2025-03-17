
-- 123456789
select * from zn_device_sn e where e.zn_device_sn_var = 'ZL1234567890';

select * from zn_pay_user e where e.id = 1090277604897988608 ;

select * from zn_device_sn e  where e.userid in (select a.id from zn_pay_user a) ;

select * from sys_user e where e.user_name like '%15738573601';


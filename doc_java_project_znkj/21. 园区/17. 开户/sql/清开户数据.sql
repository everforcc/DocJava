-- 13103785939
-- 17613568881
select e.user_id,e.* from sys_user e where e.phonenumber = 17613568881;

select * from zn_pay_apply zpa where zpa.apply_obj = 1087733817780871168;
select * from zn_pay_apply_progress zpap where zpap.id = 1087733817780871168;
select * from zn_pay_huifu_msg  zpum where zpum.id = 1087733817780871168;
select * from zn_pay_user zpu where zpu.id = 1087733817780871168;

delete from zn_pay_apply where apply_obj = 1087733817780871168;
delete from zn_pay_apply_progress where id = 1087733817780871168;
delete from zn_pay_huifu_msg  where id = 1087733817780871168;
delete from zn_pay_user where id = 1087733817780871168;
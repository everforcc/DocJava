SELECT e.payment_status,e.*
FROM zn_rental_fee_record e WHERE (zn_device_sn_var = 'ZL1234567890' AND id = 1899111498706325505);

-- 17665222560
-- 18012345678
-- 1027007357944733696
select e.manager_phone,e.* from zn_device_sn e where e.zn_device_sn_var = 'ZL1234567890';

-- 1085262124873293824
select * from sys_user e where e.user_name = '17665222560' ;

select * from sys_user e where e.user_id = 1027007357944733696;

select * from sys_user a where a.user_id in(
    select e.id from zn_pay_user e );

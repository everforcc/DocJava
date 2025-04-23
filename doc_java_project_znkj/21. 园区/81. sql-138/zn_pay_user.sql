
-- 123456789
select * from zn_device_sn e where e.zn_device_sn_var = '666688887777';

-- 宋丽珂
-- 1834419293488418817
-- 6666000154267351
-- 18012345678
-- 1027007357944733696
-- sys_user.id = zn_pay_user.id
select * from sys_user e where e.user_name like '%18012345678';
-- 汇付 用这个id 6666000151824676
--

select * from zn_pay_user e where e.id = 1834413073364946945 ;
-- 18012345678
-- 中南科技-宋丽珂
select * from zn_pay_user e where e.id = 1834419293488418817;
-- 中南科技
select * from zn_pay_user e where e.id = 1027007357944733696 ;

select * from zn_device_sn e  where e.userid in (select a.id from zn_pay_user a) ;


select * from sys_user e where e.user_id in (1781254034410180609, 1834419293488418817);

-- 6666000151824676
-- 6666000154267351
-- 6666000164541083
-- 1782596991805558787
select * from zn_pay_user e
where
e.huifu_id like '6666000154267351%';

-- {"resp_desc":"商户[6666000164541083]未配置默认账户","req_seq_id":"1104139131493163008","req_date":"20250331","resp_code":"22000003","huifu_id":"6666000151824676"}

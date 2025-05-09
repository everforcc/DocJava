
-- 1.
select e.manager_phone,e.* from zn_device_sn e where e.zn_device_sn_var = 'PRE537218904';

-- 2. 宋丽珂
-- 1834419293488418817
-- 6666000154267351
-- 18012345678
-- 1027007357944733696
-- sys_user.id = zn_pay_user.id
select e.user_id,e.* from sys_user e where e.user_name like '%17600260259';
-- 汇付 用这个id 6666000151824676
--

-- 3.
select * from zn_pay_user e where e.id = 1087736343771095040 ;
-- 18012345678
-- 中南科技-宋丽珂
select * from zn_pay_user e where e.id = 1834419293488418817;

select count(zds.userid), zds.userid from zn_device_sn zds
where zds.userid = 1834419293488418817;

-- È«²¿
select zn_device_sn_var from zn_device_sn zds
where zds.userid = (select su.user_id from sys_user su where su.phonenumber =13938510710)
union
select zn_device_sn_var from zn_device_lease zdl
where zdl.dealer_id = (select su.user_id from sys_user su where su.phonenumber =13938510710);

select su.user_id from sys_user su where su.phonenumber =13938510710;



-- zn_pay_order

select count(zpo.id) from zn_pay_order zpo
where zpo.zn_device_sn_var in
  (select zn_device_sn_var from zn_device_sn zds
   where zds.userid = (select su.user_id from sys_user su where su.phonenumber =13938510710)
   union
   select zn_device_sn_var from zn_device_lease zdl
   where zdl.dealer_id = (select su.user_id from sys_user su where su.phonenumber =13938510710));

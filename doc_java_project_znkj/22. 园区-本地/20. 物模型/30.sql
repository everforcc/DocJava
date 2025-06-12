--
-- sn
--

select * from smartparklocal.zn_device_metadata e;

select json_unquote(JSON_EXTRACT(e.meta_data,'$.gw.rxpk[0].pkdt')),e.meta_data,e.* from smartparklocal.zn_device_metadata e
where e.device_code_name = '门磁传感器';

select json_unquote(JSON_EXTRACT(e.meta_data,'$.gw.rxpk[0].pkdt')),e.meta_data,e.* from smartparklocal.zn_device_metadata e
where e.device_code_name = '温湿度传感器 ';
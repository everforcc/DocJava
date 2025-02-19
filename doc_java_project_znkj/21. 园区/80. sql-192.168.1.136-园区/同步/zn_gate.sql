select * from zn_gate e
where e.id = 1891423979796074498 and e.zn_device_sn_var = 'ZL5418276930';

-- ==> Parameters: ZL5418276930(String), 1891423979796074498(Long)

-- WHERE zn_device_sn_var='ZL5418276930'

SELECT cloud_id,zn_device_sn_var,changbo_id,sn,ip,account,password,location,pass_direction,online_status,last_heart_time,sync_total_count,valid_time,open_mode_codes,authorized_count,success_count,fail_count,brand_code,brand_name,model_id,model_all_id,model_full_name,create_dept,del_flag,up_flag,up_count,up_msg,id,create_id,create_by,create_time,update_id,update_by,update_time,remark FROM zn_gate
WHERE zn_device_sn_var='LW03AF140023' and (id IN (1891320679830556674,1891423979796074498) AND zn_device_sn_var = 'ZL5418276930');
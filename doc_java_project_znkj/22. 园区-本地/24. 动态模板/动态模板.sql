SELECT id, name, required, choosed, desensitized, type, model_type, up_flag, up_count, up_msg, create_id, create_by, create_time, update_id, update_by, update_time, remark, create_dept, del_flag
FROM zn_user_label WHERE del_flag = 0 AND (type = 0) ORDER BY create_time DESC LIMIT 10;

-- 表头字段
-- 管理员，手机号，追加下面的字段
select name
from zn_user_label zul
where zul.del_flag = 0 and zul.type = 0 and zul.choosed = 1;
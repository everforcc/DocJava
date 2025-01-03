select * from zn_core e
where e.core_id = 29;

select e.core_id,e.* from zn_algorithms_config e
where e.id = 1872530282505474048;

select e.del_flag,e.algorithm_type,e.core_id,e.* from zn_algorithms_model e
where e.del_flag = 0 and e.core_id = 29;


select e.alarm_decide_json,e.* from zn_algorithms e
where e.id = 2001;

select e.alarm_decide_json from zn_algorithms e
where e.alarm_decide_json = '{"end_second": {"type": "numberX", "required": 1, "showCode": "end_second", "showText": "事件结束：事件发生后x秒未发生事件", "showValue": "", "defaultValue": 1}}';

select e.alarm_decide_json from zn_algorithms e
where JSON_EXTRACT(e.alarm_decide_json, '$.end_second.showText') = '事件结束：事件发生后x秒未发生事件';

-- JSON_SET(json_doc, path, val)
update zn_algorithms set alarm_decide_json = JSON_SET(alarm_decide_json, '$.end_second.defaultValue', 2)
where id = 2001;


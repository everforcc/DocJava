
select e.alarm_decide_json,e.* from anm_db.zn_algorithms e
where e.id = 2001;

update anm_db.zn_algorithms e
set e.alarm_decide_json = '{"end_second": {"type": "numberX", "required": 1, "showCode": "end_second", "showText": "�¼��������¼�������x��δ�����¼�", "showValue": "", "defaultValue": 20}}'
where e.id = 2001;
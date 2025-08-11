
-- /fee/dynamicData/page
-- 1. 计划收费
select zfdd.data,
       json_unquote(JSON_EXTRACT(zfdd.data,'$.\"缴费状态\"')),
       json_unquote(JSON_EXTRACT(zfdd.data,'$.\"缴费金额\"'))
from zn_fee_dynamic_data zfdd;
select -- zfdd.*,
       zfdd.create_time createTime,
       json_unquote(JSON_EXTRACT(zfdd.data,'$.\"姓名\"')) userName,
       json_unquote(JSON_EXTRACT(zfdd.data,'$.\"电话号码\"'))  phone,
       '计划收费' as type,
       zft.name as feeName,
       json_unquote(JSON_EXTRACT(zfdd.data,'$.\"缴费金额\"'))  amount

from zn_fee_dynamic_data zfdd left join zn_fee_template zft on zft.fee_plan_id = zfdd.fee_plan_id
where json_unquote(JSON_EXTRACT(zfdd.data,'$.\"缴费状态\"')) = '已缴费'
order by zfdd.create_time desc
-- 取最新的20条
limit 20;
;

select * from zn_fee_plan e where id = 1920728394048724993;
select *
from zn_fee_template zft where zft.fee_plan_id = 1920728394048724993;

-- 2. 固定收费
-- /carParkVehicleRecord/temporarilyList
select zcpvr.create_time as createTime,
       zcpvr.username as userName,
       zcpvr.user_phone as phone,
       '固定收费' as type,
       '停车场收费' as feeName,
       zcpvr.pay_money as amount,
       zcpvr.status,zcpvr.*
from zn_car_park_vehicle_record zcpvr
where zcpvr.status = 2
order by zcpvr.create_time desc
limit 20
;
-- /carPlateCamera/soldAndRentPageList
-- todo
-- 电表
-- 水表
select zmopr.create_time as createTime,
       zu.username as userName,
       zu.phone as phone,
       '固定收费' as type,
       case when 0 = zmopr.meter_type then '水表'
            when 1 = zmopr.meter_type then '水表'
            else '未知' end as feeName,
       zmopr.payment_money as amount,
       zmopr.*
from zn_meter_off_payment_recrd zmopr
 left join zn_meter_water zmw on zmw.id = zmopr.device_id
left join zn_user zu on zmw.userid = zu.id
where zmopr.paye_type = 0
and zmopr.payment_results = 1
order by zmopr.create_time desc
limit 20
;

select zmw.userid,zmw.* from zn_meter_water zmw
where zmw.id = 1948372788000309250;

-- 3. 充卡收费
-- 圈存字段和支付状态关系
-- /feeCardPaymentRecord/list
select zfcpr.enclose_status,zfcpr.payment_results,zfcpr.payment_money,zfcpr.*
from zn_fee_card_payment_record zfcpr;

select zfcpr.create_time as createTime,
       zu.username as userName,
       zu.phone as phone,
       '充卡收费' as type,
       zfcm.name as feeName,
       zfcpr.payment_money as amount,
       zfcpr.*
from zn_fee_card_payment_record zfcpr
    left join zn_fee_card zfc on zfc.id = zfcpr.device_id
    left join zn_user zu on zfc.manager_id = zu.id
    left join zn_fee_card_meter zfcm on zfcm.id = zfcpr.meter_type
where zfcpr.payment_results = 1
order by zfcpr.create_time desc
limit 20
;
-- 费用类型
select distinct zfcpr.meter_type
from zn_fee_card_payment_record zfcpr
where zfcpr.payment_results = 1;

-- 4. 收银台
select zdo.create_time as createTime,
       zdo.member_name as userName,
        zdo.member_phone as phone,
       '收银台' as type,
        case when 1 = type then '商品/餐饮'
             when 2 = type then '买卡'
             when 4 = type then '续卡'
             when 5 = type then '无商品付款'
                 end as feeName,
       zdo.*
from zn_dzg_order zdo
where zdo.status = 2
order by zdo.create_time desc
limit 20

;
select *
from zn_dzg_order zdo
where zdo.status = 2
order by zdo.create_time desc
    limit 20

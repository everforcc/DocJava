
-- /fee/dynamicData/page
-- 1. 计划收费
select zfdd.data,
       json_unquote(JSON_EXTRACT(zfdd.data,'$.\"缴费状态\"')),
       json_unquote(JSON_EXTRACT(zfdd.data,'$.\"缴费金额\"'))
from zn_fee_dynamic_data zfdd;


-- 2. 固定收费
-- /carParkVehicleRecord/temporarilyList
select zcpvr.pay_time,zcpvr.status,zcpvr.*
from zn_car_park_vehicle_record zcpvr
where zcpvr.status = 2;
-- /carPlateCamera/soldAndRentPageList
-- todo

-- 3. 充卡收费
-- 圈存字段和支付状态关系
-- /feeCardPaymentRecord/list
select zfcpr.enclose_status,zfcpr.payment_results,zfcpr.payment_money,zfcpr.*
from zn_fee_card_payment_record zfcpr;

-- 4. 收银台
select *
from zn_dzg_order;
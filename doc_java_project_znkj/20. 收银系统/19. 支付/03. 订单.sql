
-- 云端136
select e.order_json,e.* from zn_pay_order e
where e.order_type = 4;

select e.order_json,JSON_UNQUOTE(JSON_EXTRACT(e.order_json,'$.authCode')),e.order_type,e.* from zn_pay_order e
where e.status = 1 and e.order_json is not null;

-- 交易类型T_MICROPAY: 微信反扫
-- A_MICROPAY: 支付宝反扫
-- U_MICROPAY: 银联反扫
-- D_MICROPAY: 数字人民币反扫
-- 示例值：A_NATIVE 支付宝反扫
select e.trade_type,e.other_data,e.* from zn_pay_order_record e ;

-- 退款
select * from zn_pay_order_refund e ;
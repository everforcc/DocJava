-- select e.COUPON_ID,e.* from mt_order e where e.COUPON_ID = '0';
-- 修改字段
ALTER TABLE mt_order MODIFY COUPON_ID VARCHAR(255) DEFAULT '' comment '卡券ID';
-- 更新历史数据
update mt_order set COUPON_ID = '' where COUPON_ID = '0';

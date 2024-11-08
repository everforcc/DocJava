-- WEIGHT             decimal(10, 2)          default 0.00      null comment '重量',
select * from mt_stock_item e;
ALTER TABLE `mt_stock_item`
    ADD WEIGHT decimal(10, 2) default 0.00 null comment '重量';

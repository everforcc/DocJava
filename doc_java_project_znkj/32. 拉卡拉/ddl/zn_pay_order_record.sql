-- zn_pay_order_record

ALTER TABLE `zn_pay_order_record`
    ADD auth_type varchar(255) null comment '1 汇付 2 拉卡拉';
ALTER TABLE `zn_pay_order_record`
    ADD lkl_merchant_no varchar(255) null comment '拉卡拉商户号';
ALTER TABLE `zn_pay_order_record`
    ADD lkl_term_no varchar(255) null comment '拉卡拉终端号';
ALTER TABLE `zn_pay_order_record`
    ADD lkl_split_req json null comment '拉卡拉分账请求';
ALTER TABLE `zn_pay_order_record`
    ADD lkl_split_res json null comment '拉卡拉分账响应';
ALTER TABLE `zn_pay_order_record`
    ADD lkl_split_callback json null comment '拉卡拉分账回调';
ALTER TABLE `zn_pay_order_record`
    ADD lkl_split_status varchar(255) null comment '拉卡拉分账状态';
ALTER TABLE `zn_pay_order_record`
    ADD lkl_log_no varchar(255) null comment '拉卡拉分账流水号';
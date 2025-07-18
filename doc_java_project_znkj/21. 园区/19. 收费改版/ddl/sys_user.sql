ALTER TABLE `sys_user`
    ADD location varchar(255) null comment '位置';
ALTER TABLE `sys_user`
    ADD location_code varchar(255) null comment '位置编码';
ALTER TABLE `sys_user`
    ADD busi_code varchar(50) null comment '订单系统招商码';
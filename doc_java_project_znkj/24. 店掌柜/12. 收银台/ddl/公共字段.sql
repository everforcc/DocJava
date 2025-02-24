
-- zn_dzg_order
ALTER TABLE `zn_dzg_order` ADD     remark     varchar(200)       null comment '备注';
ALTER TABLE `zn_dzg_order` ADD     create_id     bigint       null comment '创建人id';
ALTER TABLE `zn_dzg_order` ADD     create_by     varchar(60)  null comment '创建人';
ALTER TABLE `zn_dzg_order` ADD     create_dept   bigint       null comment '创建部门';
ALTER TABLE `zn_dzg_order` ADD     create_time   datetime     null comment '创建时间';
ALTER TABLE `zn_dzg_order` ADD     update_id     bigint       null comment '更新人id';
ALTER TABLE `zn_dzg_order` ADD     update_by     varchar(60)  null comment '更新人';
ALTER TABLE `zn_dzg_order` ADD     update_time   datetime     null comment '更新时间';
ALTER TABLE `zn_dzg_order` ADD     del_flag      tinyint(1)   null comment '删除标记';

-- zn_dzg_order_money
ALTER TABLE `zn_dzg_order_money` ADD     remark     varchar(200)       null comment '备注';
ALTER TABLE `zn_dzg_order_money` ADD     create_id     bigint       null comment '创建人id';
ALTER TABLE `zn_dzg_order_money` ADD     create_by     varchar(60)  null comment '创建人';
ALTER TABLE `zn_dzg_order_money` ADD     create_dept   bigint       null comment '创建部门';
ALTER TABLE `zn_dzg_order_money` ADD     create_time   datetime     null comment '创建时间';
ALTER TABLE `zn_dzg_order_money` ADD     update_id     bigint       null comment '更新人id';
ALTER TABLE `zn_dzg_order_money` ADD     update_by     varchar(60)  null comment '更新人';
ALTER TABLE `zn_dzg_order_money` ADD     update_time   datetime     null comment '更新时间';
ALTER TABLE `zn_dzg_order_money` ADD     del_flag      tinyint(1)   null comment '删除标记';

-- zn_dzg_order_goods
ALTER TABLE `zn_dzg_order_goods` ADD     remark     varchar(200)       null comment '备注';
ALTER TABLE `zn_dzg_order_goods` ADD     create_id     bigint       null comment '创建人id';
ALTER TABLE `zn_dzg_order_goods` ADD     create_by     varchar(60)  null comment '创建人';
ALTER TABLE `zn_dzg_order_goods` ADD     create_dept   bigint       null comment '创建部门';
ALTER TABLE `zn_dzg_order_goods` ADD     create_time   datetime     null comment '创建时间';
ALTER TABLE `zn_dzg_order_goods` ADD     update_id     bigint       null comment '更新人id';
ALTER TABLE `zn_dzg_order_goods` ADD     update_by     varchar(60)  null comment '更新人';
ALTER TABLE `zn_dzg_order_goods` ADD     update_time   datetime     null comment '更新时间';
ALTER TABLE `zn_dzg_order_goods` ADD     del_flag      tinyint(1)   null comment '删除标记';

-- zn_dzg_order_refund
-- ALTER TABLE `zn_dzg_order_refund` ADD     remark     varchar(200)       null comment '备注';
ALTER TABLE `zn_dzg_order_refund` ADD     create_id     bigint       null comment '创建人id';
ALTER TABLE `zn_dzg_order_refund` ADD     create_by     varchar(60)  null comment '创建人';
ALTER TABLE `zn_dzg_order_refund` ADD     create_dept   bigint       null comment '创建部门';
ALTER TABLE `zn_dzg_order_refund` ADD     create_time   datetime     null comment '创建时间';
ALTER TABLE `zn_dzg_order_refund` ADD     update_id     bigint       null comment '更新人id';
ALTER TABLE `zn_dzg_order_refund` ADD     update_by     varchar(60)  null comment '更新人';
ALTER TABLE `zn_dzg_order_refund` ADD     update_time   datetime     null comment '更新时间';
ALTER TABLE `zn_dzg_order_refund` ADD     del_flag      tinyint(1)   null comment '删除标记';


-- zn_dzg_goods_type
ALTER TABLE `zn_dzg_goods_type` ADD     create_id     bigint       null comment '创建人id';
ALTER TABLE `zn_dzg_goods_type` ADD     create_by     varchar(60)  null comment '创建人';
ALTER TABLE `zn_dzg_goods_type` ADD     create_dept   bigint       null comment '创建部门';
ALTER TABLE `zn_dzg_goods_type` ADD     create_time   datetime     null comment '创建时间';
ALTER TABLE `zn_dzg_goods_type` ADD     update_id     bigint       null comment '更新人id';
ALTER TABLE `zn_dzg_goods_type` ADD     update_by     varchar(60)  null comment '更新人';
ALTER TABLE `zn_dzg_goods_type` ADD     update_time   datetime     null comment '更新时间';
ALTER TABLE `zn_dzg_goods_type` ADD     del_flag      tinyint(1)   null comment '删除标记';

-- zn_dzg_goods
ALTER TABLE `zn_dzg_goods` ADD     create_id     bigint       null comment '创建人id';
ALTER TABLE `zn_dzg_goods` ADD     create_by     varchar(60)  null comment '创建人';
ALTER TABLE `zn_dzg_goods` ADD     create_dept   bigint       null comment '创建部门';
ALTER TABLE `zn_dzg_goods` ADD     create_time   datetime     null comment '创建时间';
ALTER TABLE `zn_dzg_goods` ADD     update_id     bigint       null comment '更新人id';
ALTER TABLE `zn_dzg_goods` ADD     update_by     varchar(60)  null comment '更新人';
ALTER TABLE `zn_dzg_goods` ADD     update_time   datetime     null comment '更新时间';
ALTER TABLE `zn_dzg_goods` ADD     del_flag      tinyint(1)   null comment '删除标记';

-- zn_dzg_stock
ALTER TABLE `zn_dzg_stock` ADD     create_id     bigint       null comment '创建人id';
ALTER TABLE `zn_dzg_stock` ADD     create_by     varchar(60)  null comment '创建人';
ALTER TABLE `zn_dzg_stock` ADD     create_dept   bigint       null comment '创建部门';
ALTER TABLE `zn_dzg_stock` ADD     create_time   datetime     null comment '创建时间';
ALTER TABLE `zn_dzg_stock` ADD     update_id     bigint       null comment '更新人id';
ALTER TABLE `zn_dzg_stock` ADD     update_by     varchar(60)  null comment '更新人';
ALTER TABLE `zn_dzg_stock` ADD     update_time   datetime     null comment '更新时间';
ALTER TABLE `zn_dzg_stock` ADD     del_flag      tinyint(1)   null comment '删除标记';

-- zn_dzg_warehouse_log
ALTER TABLE `zn_dzg_warehouse_log` ADD     create_id     bigint       null comment '创建人id';
ALTER TABLE `zn_dzg_warehouse_log` ADD     create_by     varchar(60)  null comment '创建人';
ALTER TABLE `zn_dzg_warehouse_log` ADD     create_dept   bigint       null comment '创建部门';
ALTER TABLE `zn_dzg_warehouse_log` ADD     create_time   datetime     null comment '创建时间';
ALTER TABLE `zn_dzg_warehouse_log` ADD     update_id     bigint       null comment '更新人id';
ALTER TABLE `zn_dzg_warehouse_log` ADD     update_by     varchar(60)  null comment '更新人';
ALTER TABLE `zn_dzg_warehouse_log` ADD     update_time   datetime     null comment '更新时间';
ALTER TABLE `zn_dzg_warehouse_log` ADD     del_flag      tinyint(1)   null comment '删除标记';

-- zn_dzg_check_task
ALTER TABLE `zn_dzg_check_task` ADD     create_id     bigint       null comment '创建人id';
ALTER TABLE `zn_dzg_check_task` ADD     create_by     varchar(60)  null comment '创建人';
ALTER TABLE `zn_dzg_check_task` ADD     create_dept   bigint       null comment '创建部门';
ALTER TABLE `zn_dzg_check_task` ADD     create_time   datetime     null comment '创建时间';
ALTER TABLE `zn_dzg_check_task` ADD     update_id     bigint       null comment '更新人id';
ALTER TABLE `zn_dzg_check_task` ADD     update_by     varchar(60)  null comment '更新人';
ALTER TABLE `zn_dzg_check_task` ADD     update_time   datetime     null comment '更新时间';
ALTER TABLE `zn_dzg_check_task` ADD     del_flag      tinyint(1)   null comment '删除标记';

-- zn_dzg_check_task_data
ALTER TABLE `zn_dzg_check_task_data` ADD     create_id     bigint       null comment '创建人id';
ALTER TABLE `zn_dzg_check_task_data` ADD     create_by     varchar(60)  null comment '创建人';
ALTER TABLE `zn_dzg_check_task_data` ADD     create_dept   bigint       null comment '创建部门';
ALTER TABLE `zn_dzg_check_task_data` ADD     create_time   datetime     null comment '创建时间';
ALTER TABLE `zn_dzg_check_task_data` ADD     update_id     bigint       null comment '更新人id';
ALTER TABLE `zn_dzg_check_task_data` ADD     update_by     varchar(60)  null comment '更新人';
ALTER TABLE `zn_dzg_check_task_data` ADD     update_time   datetime     null comment '更新时间';
ALTER TABLE `zn_dzg_check_task_data` ADD     del_flag      tinyint(1)   null comment '删除标记';

-- zn_dzg_price_tag
ALTER TABLE `zn_dzg_price_tag` ADD     remark     varchar(200)       null comment '备注';
ALTER TABLE `zn_dzg_price_tag` ADD     create_id     bigint       null comment '创建人id';
ALTER TABLE `zn_dzg_price_tag` ADD     create_by     varchar(60)  null comment '创建人';
ALTER TABLE `zn_dzg_price_tag` ADD     create_dept   bigint       null comment '创建部门';
ALTER TABLE `zn_dzg_price_tag` ADD     create_time   datetime     null comment '创建时间';
ALTER TABLE `zn_dzg_price_tag` ADD     update_id     bigint       null comment '更新人id';
ALTER TABLE `zn_dzg_price_tag` ADD     update_by     varchar(60)  null comment '更新人';
ALTER TABLE `zn_dzg_price_tag` ADD     update_time   datetime     null comment '更新时间';
ALTER TABLE `zn_dzg_price_tag` ADD     del_flag      tinyint(1)   null comment '删除标记';

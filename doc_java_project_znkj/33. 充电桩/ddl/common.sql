
ALTER TABLE `zn_charge_user_balance_log` ADD        remark          varchar(255)                           null comment '备注';
ALTER TABLE `zn_charge_user_balance_log` ADD         create_id       bigint                                 null comment '创建者ID';
ALTER TABLE `zn_charge_user_balance_log` ADD         create_by       varchar(64) charset utf8mb4 default '' null comment '创建者';
ALTER TABLE `zn_charge_user_balance_log` ADD         create_time     datetime                               null comment '创建时间';
ALTER TABLE `zn_charge_user_balance_log` ADD         create_dept     bigint                                 null comment '创建部门';
ALTER TABLE `zn_charge_user_balance_log` ADD         update_id       bigint                                 null comment '更新者ID';
ALTER TABLE `zn_charge_user_balance_log` ADD         update_by       varchar(64) charset utf8mb4 default '' null comment '更新者';
ALTER TABLE `zn_charge_user_balance_log` ADD         update_time     datetime                               null comment '更新时间';
ALTER TABLE `zn_charge_user_balance_log` ADD         del_flag        tinyint(1)                  default 0  null;

ALTER TABLE `zn_charge_order` ADD        remark          varchar(255)                           null comment '备注';
ALTER TABLE `zn_charge_order` ADD         create_id       bigint                                 null comment '创建者ID';
ALTER TABLE `zn_charge_order` ADD         create_by       varchar(64) charset utf8mb4 default '' null comment '创建者';
ALTER TABLE `zn_charge_order` ADD         create_time     datetime                               null comment '创建时间';
ALTER TABLE `zn_charge_order` ADD         create_dept     bigint                                 null comment '创建部门';
ALTER TABLE `zn_charge_order` ADD         update_id       bigint                                 null comment '更新者ID';
ALTER TABLE `zn_charge_order` ADD         update_by       varchar(64) charset utf8mb4 default '' null comment '更新者';
ALTER TABLE `zn_charge_order` ADD         update_time     datetime                               null comment '更新时间';
ALTER TABLE `zn_charge_order` ADD         del_flag        tinyint(1)                  default 0  null;

ALTER TABLE `zn_charge_device_log` ADD        remark          varchar(255)                           null comment '备注';
ALTER TABLE `zn_charge_device_log` ADD         create_id       bigint                                 null comment '创建者ID';
ALTER TABLE `zn_charge_device_log` ADD         create_by       varchar(64) charset utf8mb4 default '' null comment '创建者';
ALTER TABLE `zn_charge_device_log` ADD         create_time     datetime                               null comment '创建时间';
ALTER TABLE `zn_charge_device_log` ADD         create_dept     bigint                                 null comment '创建部门';
ALTER TABLE `zn_charge_device_log` ADD         update_id       bigint                                 null comment '更新者ID';
ALTER TABLE `zn_charge_device_log` ADD         update_by       varchar(64) charset utf8mb4 default '' null comment '更新者';
ALTER TABLE `zn_charge_device_log` ADD         update_time     datetime                               null comment '更新时间';
ALTER TABLE `zn_charge_device_log` ADD         del_flag        tinyint(1)                  default 0  null;

ALTER TABLE `zn_charge_byte_log` ADD        remark          varchar(255)                           null comment '备注';
ALTER TABLE `zn_charge_byte_log` ADD         create_id       bigint                                 null comment '创建者ID';
ALTER TABLE `zn_charge_byte_log` ADD         create_by       varchar(64) charset utf8mb4 default '' null comment '创建者';
ALTER TABLE `zn_charge_byte_log` ADD         create_time     datetime                               null comment '创建时间';
ALTER TABLE `zn_charge_byte_log` ADD         create_dept     bigint                                 null comment '创建部门';
ALTER TABLE `zn_charge_byte_log` ADD         update_id       bigint                                 null comment '更新者ID';
ALTER TABLE `zn_charge_byte_log` ADD         update_by       varchar(64) charset utf8mb4 default '' null comment '更新者';
ALTER TABLE `zn_charge_byte_log` ADD         update_time     datetime                               null comment '更新时间';
ALTER TABLE `zn_charge_byte_log` ADD         del_flag        tinyint(1)                  default 0  null;

ALTER TABLE `zn_charge_device_facturer` ADD        remark          varchar(255)                           null comment '备注';
ALTER TABLE `zn_charge_device_facturer` ADD         create_id       bigint                                 null comment '创建者ID';
ALTER TABLE `zn_charge_device_facturer` ADD         create_by       varchar(64) charset utf8mb4 default '' null comment '创建者';
ALTER TABLE `zn_charge_device_facturer` ADD         create_time     datetime                               null comment '创建时间';
ALTER TABLE `zn_charge_device_facturer` ADD         create_dept     bigint                                 null comment '创建部门';
ALTER TABLE `zn_charge_device_facturer` ADD         update_id       bigint                                 null comment '更新者ID';
ALTER TABLE `zn_charge_device_facturer` ADD         update_by       varchar(64) charset utf8mb4 default '' null comment '更新者';
ALTER TABLE `zn_charge_device_facturer` ADD         update_time     datetime                               null comment '更新时间';
ALTER TABLE `zn_charge_device_facturer` ADD         del_flag        tinyint(1)                  default 0  null;


alter table zn_charge_order
    add serve_hour decimal(10,2) null comment '服务费率' after elec_hour;


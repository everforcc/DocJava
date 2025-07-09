ALTER TABLE `zn_coin` ADD        remark          varchar(255)                           null comment '备注';
ALTER TABLE `zn_coin` ADD         create_id       bigint                                 null comment '创建者ID';
ALTER TABLE `zn_coin` ADD         create_by       varchar(64) charset utf8mb4 default '' null comment '创建者';
ALTER TABLE `zn_coin` ADD         create_time     datetime                               null comment '创建时间';
ALTER TABLE `zn_coin` ADD         create_dept     bigint                                 null comment '创建部门';
ALTER TABLE `zn_coin` ADD         update_id       bigint                                 null comment '更新者ID';
ALTER TABLE `zn_coin` ADD         update_by       varchar(64) charset utf8mb4 default '' null comment '更新者';
ALTER TABLE `zn_coin` ADD         update_time     datetime                               null comment '更新时间';
ALTER TABLE `zn_coin` ADD         del_flag        tinyint(1)                  default 0  null;

ALTER TABLE `zn_coin_detail` ADD        remark          varchar(255)                           null comment '备注';
ALTER TABLE `zn_coin_detail` ADD         create_id       bigint                                 null comment '创建者ID';
ALTER TABLE `zn_coin_detail` ADD         create_by       varchar(64) charset utf8mb4 default '' null comment '创建者';
ALTER TABLE `zn_coin_detail` ADD         create_time     datetime                               null comment '创建时间';
ALTER TABLE `zn_coin_detail` ADD         create_dept     bigint                                 null comment '创建部门';
ALTER TABLE `zn_coin_detail` ADD         update_id       bigint                                 null comment '更新者ID';
ALTER TABLE `zn_coin_detail` ADD         update_by       varchar(64) charset utf8mb4 default '' null comment '更新者';
ALTER TABLE `zn_coin_detail` ADD         update_time     datetime                               null comment '更新时间';
ALTER TABLE `zn_coin_detail` ADD         del_flag        tinyint(1)                  default 0  null;




-- 金豆相关

-- 如果存在就删除
drop table if exists zn_coin;
-- auto-generated definition
create table zn_coin
(
    id            bigint                 not null comment '主键id'
        primary key,
    user_id       bigint                 null comment '经销商id',
    balance       int                    null comment '金豆余额',
    balance_alarm int                    null comment '金豆报警下限',
    remark        varchar(255)           null comment '备注',
    create_id     bigint                 null comment '创建者ID',
    create_by     varchar(64) default '' null comment '创建者',
    create_time   datetime               null comment '创建时间',
    create_dept   bigint                 null comment '创建部门',
    update_id     bigint                 null comment '更新者ID',
    update_by     varchar(64) default '' null comment '更新者',
    update_time   datetime               null comment '更新时间',
    del_flag      tinyint(1)  default 0  null
)
    comment '金豆详情';

drop table if exists zn_coin_detail;
-- auto-generated definition
-- auto-generated definition
create table zn_coin_detail
(
    id            bigint                 not null comment '主键id'
        primary key,
    type          int                    null comment '类型 1 充值 2 支出',
    user_id       bigint                 null comment '用户id',
    order_id      bigint                 null comment '订单id，非必填',
    balance_start int                    null comment '消费前余额',
    consume       int                    null comment '消费金豆数',
    balance_end   int                    null comment '消费后金豆数',
    remark        varchar(255)           null comment '备注',
    create_id     bigint                 null comment '创建者ID',
    create_by     varchar(64) default '' null comment '创建者',
    create_time   datetime               null comment '创建时间',
    create_dept   bigint                 null comment '创建部门',
    update_id     bigint                 null comment '更新者ID',
    update_by     varchar(64) default '' null comment '更新者',
    update_time   datetime               null comment '更新时间',
    del_flag      tinyint(1)  default 0  null
)
    comment '金豆消费记录';

CREATE TABLE `zn_cloud_service_settings`
(
    `id`                           int(11)                                                       NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `access_control`               int(11)                                                       NULL DEFAULT NULL COMMENT '门禁机数量(金豆)',
    `license_plate_camera`         int(11)                                                       NULL DEFAULT NULL COMMENT '车牌相机数量(金豆)',
    `elevator_control`             int(11)                                                       NULL DEFAULT NULL COMMENT '梯控数量(金豆)',
    `iot_device`                   int(11)                                                       NULL DEFAULT NULL COMMENT 'IOT设备数量(金豆)',
    `energy_consumption_equipment` int(11)                                                       NULL DEFAULT NULL COMMENT '能耗设备数量(金豆)',
    `attendance_management`        int(11)                                                       NULL DEFAULT NULL COMMENT '考勤管理数量(金豆)',
    `ip_broadcast_equipment`       int(11)                                                       NULL DEFAULT NULL COMMENT 'IP广播设备数量(金豆)',
    `ai_events_total`              int(11)                                                       NULL DEFAULT NULL COMMENT 'AI事件条数',
    `ai_events_per_month`          int(11)                                                       NULL DEFAULT NULL COMMENT '每月AI事件数(金豆)',
    `camera_live_minutes`          int(11)                                                       NULL DEFAULT NULL COMMENT '摄像机直播分钟数',
    `camera_live_cost`             int(11)                                                       NULL DEFAULT NULL COMMENT '摄像机直播成本(金豆)',
    `remark`                       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    `create_id`                    bigint(20)                                                    NULL DEFAULT NULL COMMENT '创建者ID',
    `create_by`                    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`                  datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `create_dept`                  bigint(20)                                                    NULL DEFAULT NULL COMMENT '创建部门',
    `update_id`                    bigint(20)                                                    NULL DEFAULT NULL COMMENT '更新者ID',
    `update_by`                    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`                  datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `del_flag`                     tinyint(1)                                                    NULL DEFAULT 0 COMMENT '删除标志（0代表存在 1代表删除）',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '云服务设置'
  ROW_FORMAT = Dynamic;



CREATE TABLE `zn_lease_gift_settings`
(
    `id`                  bigint(11)                                                    NOT NULL AUTO_INCREMENT,
    `ai_event_count`      int(11)                                                       NULL DEFAULT NULL COMMENT 'AI事件数量（条）',
    `camera_live_minutes` int(11)                                                       NULL DEFAULT NULL COMMENT '摄像机直播时长（分钟）',
    `remark`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    `create_id`           bigint(20)                                                    NULL DEFAULT NULL COMMENT '创建者ID',
    `create_by`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`         datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `create_dept`         bigint(20)                                                    NULL DEFAULT NULL COMMENT '创建部门',
    `update_id`           bigint(20)                                                    NULL DEFAULT NULL COMMENT '更新者ID',
    `update_by`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`         datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `del_flag`            tinyint(1)                                                    NULL DEFAULT 0 COMMENT '删除标志（0代表存在 1代表删除）',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '租赁赠送设置'
  ROW_FORMAT = Dynamic;



create table zn_pay_sepa_conf
(
    id          bigint auto_increment comment '唯一标识'
        primary key,
    fee_type    bigint                                            null comment '费用类型(1、代理商收单费 2、客户收单费 3、大模型预存 4、预存金豆)',
    role_id     bigint                                            null comment '角色类型(1、中南 2、汇付 3、城市合伙人 4、代理商 )',
    sepa_div    varchar(255)                                      null comment '分账百分比',
    remark      varchar(255)                                      null comment '备注',
    create_id   bigint                                            null comment '创建者ID',
    create_by   varchar(64) collate utf8mb4_general_ci default '' null comment '创建者',
    create_time datetime                                          null comment '创建时间',
    create_dept bigint                                            null comment '创建部门',
    update_id   bigint                                            null comment '更新者ID',
    update_by   varchar(64) collate utf8mb4_general_ci default '' null comment '更新者',
    update_time datetime                                          null comment '更新时间',
    del_flag    tinyint(1)                             default 0  null
)
    comment '订单分账设置' collate = utf8mb4_unicode_ci;



alter table zn_pay_order
    add pay_channel int null comment '支付方式(1汇付2支付宝3微信)';

alter table zn_pay_order
    add city_part_price bigint(20) null comment '城市合伙人提成(单位分)';

alter table zn_pay_order
    add zhongnan_price bigint(20) null comment '中南收单费(单位分)';

alter table zn_pay_order
    add huifu_price bigint(20) null comment '汇付收单费(单位分)';

alter table zn_pay_order
    add dls_price bigint(20) null comment '代理商收单费(单位分)';

alter table zn_pay_order
    add profit_price bigint( 20) null comment '利润(单位分)';



ALTER TABLE `sys_user`
    ADD location varchar(255) null comment '位置';
ALTER TABLE `sys_user`
    ADD location_code varchar(255) null comment '位置编码';
ALTER TABLE `sys_user`
    ADD busi_code varchar(50) null comment '订单系统招商码';



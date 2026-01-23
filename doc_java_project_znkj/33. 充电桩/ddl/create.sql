-- 121重新拉sql

-- auto-generated definition
create table zn_charge_byte_log
(
    id          bigint                 not null,
    sn          varchar(32)            null comment '设备号',
    order_id    bigint                 null comment '订单号',
    step        varchar(32)            null comment '步骤号',
    rs          varchar(32)            null comment 'r 接收 s 发送',
    byte_hex    varchar(512)           null comment '字节',
    remark      varchar(255)           null comment '备注',
    create_id   bigint                 null comment '创建者ID',
    create_by   varchar(64) default '' null comment '创建者',
    create_time datetime               null comment '创建时间',
    create_dept bigint                 null comment '创建部门',
    update_id   bigint                 null comment '更新者ID',
    update_by   varchar(64) default '' null comment '更新者',
    update_time datetime               null comment '更新时间',
    del_flag    tinyint(1)  default 0  null,
    constraint zn_charge_byte_log_id_uindex
        unique (id)
)
    comment '充电订单字节日志';

alter table zn_charge_byte_log
    add primary key (id);

-- auto-generated definition
create table zn_charge_device_facturer
(
    id          bigint                 not null comment 'id',
    name        varchar(32)            null comment '名字',
    parent_id   bigint                 null comment '父级节点id，0为厂商',
    remark      varchar(255)           null comment '备注',
    create_id   bigint                 null comment '创建者ID',
    create_by   varchar(64) default '' null comment '创建者',
    create_time datetime               null comment '创建时间',
    create_dept bigint                 null comment '创建部门',
    update_id   bigint                 null comment '更新者ID',
    update_by   varchar(64) default '' null comment '更新者',
    update_time datetime               null comment '更新时间',
    del_flag    tinyint(1)  default 0  null,
    constraint zn_charge_device_facturer_id_uindex
        unique (id)
)
    comment '充电桩厂商';

alter table zn_charge_device_facturer
    add primary key (id);

-- auto-generated definition
create table zn_charge_device_log
(
    id          bigint                 not null,
    sn          varchar(32)            null comment '设备号',
    elec        int                    null comment '0 设备正常 1：设备有过断电现象',
    port        int                    null comment '0 设备端口正常
1：设备端口出现异常(无继电器黏连)
2：出现继电器黏连，端口无其它问题。3：出现端口问题，同时也有继电器黏连',
    network     int                    null comment '0 设备网络正常 1：设备有过断网现象',
    remark      varchar(255)           null comment '备注',
    create_id   bigint                 null comment '创建者ID',
    create_by   varchar(64) default '' null comment '创建者',
    create_time datetime               null comment '创建时间',
    create_dept bigint                 null comment '创建部门',
    update_id   bigint                 null comment '更新者ID',
    update_by   varchar(64) default '' null comment '更新者',
    update_time datetime               null comment '更新时间',
    del_flag    tinyint(1)  default 0  null,
    constraint zn_charge_device_log_id_uindex
        unique (id)
)
    comment '设备日志';

alter table zn_charge_device_log
    add primary key (id);

-- auto-generated definition
create table zn_charge_device_port_log
(
    id          bigint                 not null,
    sn          varchar(32)            null comment '设备号',
    order_id    bigint                 null comment '订单号',
    port        int                    null comment '端口号',
    w           int                    null comment '平均功率',
    remark      varchar(255)           null comment '备注',
    create_id   bigint                 null comment '创建者ID',
    create_by   varchar(64) default '' null comment '创建者',
    create_time datetime               null comment '创建时间',
    create_dept bigint                 null comment '创建部门',
    update_id   bigint                 null comment '更新者ID',
    update_by   varchar(64) default '' null comment '更新者',
    update_time datetime               null comment '更新时间',
    del_flag    tinyint(1)  default 0  null,
    constraint zn_charge_device_port_log_id_uindex
        unique (id)
)
    comment '充电订单端口日志';

alter table zn_charge_device_port_log
    add primary key (id);

-- auto-generated definition
create table zn_charge_order
(
    id            bigint                 null comment '订单号',
    sn            varchar(32)            null comment '设备编号',
    port          int                    null comment '端口号',
    user_id       bigint                 null comment '用户 id  ',
    charge_type   int                    null comment '本次选择的充电类型 1 时,2 度',
    pre_base      int                    null comment '充电时长/充电多少度/0 充满自停',
    pre_fee       decimal(10, 2)         null comment '预扣费',
    pre_fee_base  decimal(10, 2)         null comment '基础费用',
    pre_fee_serve decimal(10, 2)         null comment '服务费',
    status        int                    null comment '1 创建中 2 充电中 3 充电完成 4 无负载 5 端口已使用',
    time_start    datetime               null comment '开始充电时间',
    time_end      datetime               null comment '结束充电时间',
    time_duration varchar(32)            null comment '充电时长',
    fee_real      decimal(10, 2)         null comment '实际消费',
    fee_base      decimal(10, 2)         null comment '基础费用',
    fee_serve     decimal(10, 2)         null comment '服务费',
    elec_hour     decimal(10, 2)         null comment '电量费率(元/度)',
    elec_use      int                    null comment '实际用电量',
    end_type      int                    null comment '0 ：时间到正常结束；
1 ：电能用完结束；
2 ：钱用完结束；
3 ：充满自停浮充时间到结束；(对应平台充满自停(1))4 ：充满自停达到最小功率结束；(对应平台充满自停(2))5 ：充满自停达到功率恒定结束；(对应平台充满自停(3))6 ：无负载结束 (用于开始充电时的负载检测)；7 ：超负载结束；
8 ：充电器移除结束；
9 ：超出最大充电时长结束
10 ：用户微信主动结束
11 ：从机通信失败
12 远程主动断电',
    id_card       varchar(32)            null comment '身份证号',
    vin           varchar(32)            null comment '车辆 VIN 码',
    car_card      varchar(32)            null comment '车牌号',
    cell_type     varchar(32)            null comment '电池型号',
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
    comment '充电订单';

-- auto-generated definition
create table zn_charge_user_balance_log
(
    id          bigint                 not null,
    user_id     bigint                 null comment 'sys_user.id',
    type        int                    null comment '1 充值 2 使用 3 退费 4 退款 ',
    amount      decimal(10, 2)         null comment '变动金额',
    source      int                    null comment '1 小程序 2 后台',
    order_id    bigint                 null comment '当type为1充值时，为订单号，其余为 zn_charge_order.id',
    remark      varchar(255)           null comment '备注',
    create_id   bigint                 null comment '创建者ID',
    create_by   varchar(64) default '' null comment '创建者',
    create_time datetime               null comment '创建时间',
    create_dept bigint                 null comment '创建部门',
    update_id   bigint                 null comment '更新者ID',
    update_by   varchar(64) default '' null comment '更新者',
    update_time datetime               null comment '更新时间',
    del_flag    tinyint(1)  default 0  null,
    constraint zn_charge_user_balance_log_id_uindex
        unique (id)
)
    comment '充电用户余额记录';

alter table zn_charge_user_balance_log
    add primary key (id);


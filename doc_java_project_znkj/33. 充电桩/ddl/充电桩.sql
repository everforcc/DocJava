-- auto-generated definition
create table zn_charge_area
(
    id          bigint                 not null comment 'id'
        primary key,
    name        varchar(512)           not null comment '充电区名称',
    description varchar(512)           null comment '描述',
    remark      varchar(255)           null comment '备注',
    create_id   bigint                 null comment '创建者ID',
    create_by   varchar(64) default '' null comment '创建者',
    create_time datetime               null comment '创建时间',
    create_dept bigint                 null comment '创建部门',
    update_id   bigint                 null comment '更新者ID',
    update_by   varchar(64) default '' null comment '更新者',
    update_time datetime               null comment '更新时间',
    del_flag    tinyint(1)  default 0  null comment '删除标志（0代表存在 2代表删除）'
)
    comment '充电区' charset = utf8mb4;

-- auto-generated definition
create table zn_charge_byte_log
(
    id          bigint auto_increment,
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
create table zn_charge_device
(
    id              bigint                      not null comment 'id'
        primary key,
    area_id         bigint                      null comment '所属充电区ID，关联zn_charge_area.id',
    sn              varchar(32)                 null comment '设备编号',
    name            varchar(512)                null comment '充电桩名称',
    location        varchar(512)                null comment '位置',
    man_facturer    varchar(512)                null comment '厂商名称',
    type            varchar(32)                 null comment '充电桩类型',
    sim             varchar(32)                 null comment 'SIM卡号',
    port_num        int            default 0    null comment '端口数',
    image_url       varchar(500)   default ''   not null comment '图片URL',
    device_ip       varchar(128)                null comment '设备ip',
    principal       varchar(50)                 null comment '负责人',
    contact         varchar(20)                 null comment '联系方式',
    status_use      int            default 0    null comment '使用状态（0：未使用 1：使用中 2：暂停使用）',
    status_can      int            default 1    null comment '是否可用（0：不可用 1：可用）',
    status_online   int            default 0    null comment '充电桩状态在线（0：离线 1：在线）',
    last_heart      datetime                    null comment '最后心跳时间',
    count_fee       decimal(10, 2) default 0.00 null comment '累计收费（元）',
    count_hour      int            default 0    null comment '累计充电时长',
    count_use       int            default 0    null comment '累计充电次数',
    remark          varchar(255)                null comment '备注',
    create_id       bigint                      null comment '创建者ID',
    create_by       varchar(64)    default ''   null comment '创建者',
    create_time     datetime                    null comment '创建时间',
    create_dept     bigint                      null comment '创建部门',
    update_id       bigint                      null comment '更新者ID',
    update_by       varchar(64)    default ''   null comment '更新者',
    update_time     datetime                    null comment '更新时间',
    man_facturer_id bigint                      null,
    del_flag        tinyint(1)     default 0    null comment '删除标志（0代表存在 2代表删除）',
    type_id         bigint                      null comment '充电桩类型ID'
)
    comment '充电桩表' charset = utf8mb4;

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

INSERT INTO smart_park.zn_charge_device_facturer (id, name, parent_id, remark, create_id, create_by, create_time, create_dept, update_id, update_by, update_time, del_flag) VALUES (1, '晓宇', 0, null, null, '', null, null, null, '', null, 0);
INSERT INTO smart_park.zn_charge_device_facturer (id, name, parent_id, remark, create_id, create_by, create_time, create_dept, update_id, update_by, update_time, del_flag) VALUES (2, '10口', 1, null, null, '', null, null, null, '', null, 0);
INSERT INTO smart_park.zn_charge_device_facturer (id, name, parent_id, remark, create_id, create_by, create_time, create_dept, update_id, update_by, update_time, del_flag) VALUES (3, '20口', 1, null, null, '', null, null, null, '', null, 0);


-- auto-generated definition
create table zn_charge_device_log
(
    id          bigint auto_increment
        primary key,
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
    del_flag    tinyint(1)  default 0  null
)
    comment '设备日志';


-- auto-generated definition
create table zn_charge_device_port_log
(
    id          bigint auto_increment,
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
create table zn_charge_duration
(
    id          bigint                 not null comment 'id'
        primary key,
    area_id     bigint                 not null comment '所属充电区ID，关联zn_charge_area.id',
    type        int                    not null comment '计费类型（1：小时,2：度）',
    level       int                    not null comment '等级（1 多少小时,2 多少度）',
    remark      varchar(255)           null comment '备注',
    create_id   bigint                 null comment '创建者ID',
    create_by   varchar(64) default '' null comment '创建者',
    create_time datetime               null comment '创建时间',
    create_dept bigint                 null comment '创建部门',
    update_id   bigint                 null comment '更新者ID',
    update_by   varchar(64) default '' null comment '更新者',
    update_time datetime               null comment '更新时间',
    del_flag    tinyint(1)  default 0  null comment '删除标志（0代表存在 2代表删除）'
)
    comment '充电桩时长设置表' charset = utf8mb4;

-- auto-generated definition
create table zn_charge_fee
(
    id          bigint                      not null comment 'id'
        primary key,
    area_id     bigint                      not null comment '所属充电区ID，关联zn_charge_area.id',
    type        int                         not null comment '计费类型（1：小时,2 度）',
    base        decimal(10, 2) default 0.00 null comment '基础费（元/小时,元/度）',
    serve       decimal(10, 2) default 0.00 null comment '服务费',
    total       decimal(10, 2) default 0.00 null comment '总计费用',
    remark      varchar(255)                null comment '备注',
    create_id   bigint                      null comment '创建者ID',
    create_by   varchar(64)    default ''   null comment '创建者',
    create_time datetime                    null comment '创建时间',
    create_dept bigint                      null comment '创建部门',
    update_id   bigint                      null comment '更新者ID',
    update_by   varchar(64)    default ''   null comment '更新者',
    update_time datetime                    null comment '更新时间',
    del_flag    tinyint(1)     default 0    null comment '删除标志（0代表存在 2代表删除）'
)
    comment '充电桩计费设置表' charset = utf8mb4;

-- auto-generated definition
create table zn_charge_order
(
    id            bigint                 not null comment '订单号',
    sn            varchar(32)            null comment '设备编号',
    port          int                    null comment '端口号',
    user_id       bigint                 null comment '用户 id  ',
    charge_type   int                    null comment '本次选择的充电类型 1 时,2 度',
    pre_base      int                    null comment '充电时长/充电多少度/10 充满自停',
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
    serve_hour    decimal(10, 2)         null comment '服务费率',
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
    del_flag      tinyint(1)  default 0  null,
    constraint zn_charge_order_id_uindex
        unique (id)
)
    comment '充电订单';

alter table zn_charge_order
    add primary key (id);

-- auto-generated definition
create table zn_charge_user
(
    id          bigint                      not null comment 'id'
        primary key,
    user_id     bigint                      not null comment '关联系统用户ID，对应sys_user.id',
    balance     decimal(10, 2) default 0.00 null comment '用户充电余额',
    description varchar(512)                null comment '描述',
    remark      varchar(255)                null comment '备注',
    create_id   bigint                      null comment '创建者ID',
    create_by   varchar(64)    default ''   null comment '创建者',
    create_time datetime                    null comment '创建时间',
    create_dept bigint                      null comment '创建部门',
    update_id   bigint                      null comment '更新者ID',
    update_by   varchar(64)    default ''   null comment '更新者',
    update_time datetime                    null comment '更新时间',
    del_flag    tinyint(1)     default 0    null comment '删除标志（0代表存在 2代表删除）'
)
    comment '充电用户表' charset = utf8mb4;

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

alter table zn_pay_order_record modify ali_qrcode varchar(1024) null comment '阿里的QR';


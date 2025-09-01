-- 本地和云端
ALTER TABLE zn_ais_third_party
    ADD group_id bigint null comment 'zn_rearm_group.id';

-- auto-generated definition
create table zn_rearm_group
(
    id                       bigint        not null comment '主键'
        primary key,
    name                     varchar(20)   null comment '名称',
    week_bits                varbinary(42) null comment '周位图数据',
    week_bits_str            varchar(336)  null,
    reception_personnel_json json          null comment '接收人',
    manage_personnel_json    json          null comment '管理人',
    switch_json              json          null comment '按钮',
    remark                   varchar(200)  null comment '备注',
    create_id                bigint        null comment '创建人id',
    create_by                varchar(60)   null comment '创建人',
    create_dept              bigint        null comment '创建部门',
    create_time              datetime      null comment '创建时间',
    update_id                bigint        null comment '更新人id',
    update_by                varchar(60)   null comment '更新人',
    update_time              datetime      null comment '更新时间',
    del_flag                 tinyint(1)    null comment '删除标记',
    up_flag                  int           null comment '0 未上传 1 上传中 2 已上传',
    up_count                 int           null comment '上传次数',
    up_msg                   varchar(255)  null comment '上传信息',
    up_id                    varchar(255)  null comment '上传ID'
)
    comment '布防组';

-- auto-generated definition
create table zn_rearm_group_device
(
    id          bigint       not null comment '主键'
        primary key,
    group_id    bigint       null comment '布防组id',
    device_type tinyint      null comment '0,IOT 1,AI算法',
    device_id   bigint       null comment '设备id',
    remark      varchar(200) null comment '备注',
    create_id   bigint       null comment '创建人id',
    create_by   varchar(60)  null comment '创建人',
    create_dept bigint       null comment '创建部门',
    create_time datetime     null comment '创建时间',
    update_id   bigint       null comment '更新人id',
    update_by   varchar(60)  null comment '更新人',
    update_time datetime     null comment '更新时间',
    del_flag    tinyint(1)   null comment '删除标记',
    up_flag     int          null comment '0 未上传 1 上传中 2 已上传',
    up_count    int          null comment '上传次数',
    up_msg      varchar(255) null comment '上传信息',
    up_id       varchar(255) null comment '上传ID'
)
    comment '设备关联告警组';

-- auto-generated definition
create table zn_rearm_group_record
(
    id             bigint       not null comment '主键'
        primary key,
    user_id        bigint       null comment '用户id',
    user_name      varchar(255) null comment '用户名',
    operate_type   bigint       null comment '操作类型 1 布防 0 撤防',
    operate_source bigint       null comment '来源 1 PC 2 按钮 3 APP',
    group_id       bigint       null comment '组id',
    group_name     varchar(20)  null comment '组名称',
    remark         varchar(200) null comment '备注',
    create_id      bigint       null comment '创建人id',
    create_by      varchar(60)  null comment '创建人',
    create_dept    bigint       null comment '创建部门',
    create_time    datetime     null comment '创建时间',
    update_id      bigint       null comment '更新人id',
    update_by      varchar(60)  null comment '更新人',
    update_time    datetime     null comment '更新时间',
    del_flag       tinyint(1)   null comment '删除标记',
    up_flag        int          null comment '0 未上传 1 上传中 2 已上传',
    up_count       int          null comment '上传次数',
    up_msg         varchar(255) null comment '上传信息',
    up_id          varchar(255) null comment '上传ID'
)
    comment '布防撤防记录';

-- auto-generated definition
create table zn_rearm_group_temp
(
    id            bigint       not null comment '主键'
        primary key,
    group_id      bigint       null comment 'zn_rearm_group.id',
    operate_date  date         null comment '操作时间',
    mask_bits     varbinary(6) null comment '今日撤防信息',
    mask_bits_str varchar(48)  null,
    remark        varchar(200) null comment '备注',
    create_id     bigint       null comment '创建人id',
    create_by     varchar(60)  null comment '创建人',
    create_dept   bigint       null comment '创建部门',
    create_time   datetime     null comment '创建时间',
    update_id     bigint       null comment '更新人id',
    update_by     varchar(60)  null comment '更新人',
    update_time   datetime     null comment '更新时间',
    del_flag      tinyint(1)   null comment '删除标记',
    up_flag       int          null comment '0 未上传 1 上传中 2 已上传',
    up_count      int          null comment '上传次数',
    up_msg        varchar(255) null comment '上传信息',
    up_id         varchar(255) null comment '上传ID'
)
    comment '今日临时撤防';





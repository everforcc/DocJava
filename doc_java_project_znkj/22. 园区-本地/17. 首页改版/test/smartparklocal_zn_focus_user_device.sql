create table zn_focus_user_device
(
    id          bigint                                            not null comment '主键'
        primary key,
    user_id     bigint                                            null comment '用户id',
    device_id   bigint                                            null comment '设备id',
    device_type int                                               null comment '设备类型',
    remark      varchar(600) collate utf8mb4_general_ci           null comment '备注',
    create_id   bigint                                            null comment '创建人id',
    create_by   varchar(64) collate utf8mb4_general_ci default '' null comment '创建者',
    create_time datetime                                          null comment '创建时间',
    create_dept bigint                                            null comment '创建部门',
    update_id   bigint                                            null comment '更新人id',
    update_by   varchar(64) collate utf8mb4_general_ci default '' null comment '更新者',
    update_time datetime                                          null comment '更新时间',
    del_flag    tinyint                                           null comment '删除标记',
    focus_type  tinyint(1)                                        null comment '0 人员 1 车辆'
)
    comment '重点人员与设备关联表' charset = utf8mb4;


-- auto-generated definition
create table zn_pay_auth_type
(
    id          bigint auto_increment comment '唯一标识'
        primary key,
    user_id     bigint                                 null comment '用户id 每个用户一行数据参数',
    type        tinyint                                null comment '0 用户自选 1 汇付 2 拉卡拉',
    create_id   bigint                                 null comment '创建者ID',
    create_by   varchar(64) charset utf8mb4 default '' null comment '创建者',
    create_time datetime                               null comment '创建时间',
    create_dept bigint                                 null comment '创建部门',
    update_id   bigint                                 null comment '更新者ID',
    update_by   varchar(64) charset utf8mb4 default '' null comment '更新者',
    update_time datetime                               null comment '更新时间',
    del_flag    tinyint(1)                  default 0  null comment '删除标志（0代表存在 1代表删除）',
    remark      text                                   null comment '备注'
)
    comment '支付开户类型 汇付拉卡拉' collate = utf8mb4_unicode_ci;

INSERT INTO zn_pay_auth_type
    (id, user_id, type, create_id, create_by, create_time, create_dept, update_id, update_by, update_time, del_flag, remark)
VALUES (1, 0, 2, 0, '0', '2025-10-25 10:58:31', 0, 0, '0', '2025-10-25 10:58:31', 0, '默认值');

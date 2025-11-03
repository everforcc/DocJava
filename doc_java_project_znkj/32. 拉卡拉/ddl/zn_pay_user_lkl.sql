-- zn_pay_user_lkl
-- auto-generated definition
create table zn_pay_user_lkl
(
    id           bigint                                 not null comment '唯一标识'
        primary key,
    user_id      bigint                                 not null comment '用户id',
    merchant_no     varchar(255)                           null comment '拉卡拉商户号',
    term_no    varchar(255)                                     null comment '拉卡拉设备号',
    receiver_no varchar(255)                                     null comment '拉卡拉分账号',
    role_id      bigint                                 null comment '经销商用户身份，1：市场经理，2：城市合伙人，3：地区代理商（经销商）',
    parent_Id    bigint                                 null comment '上级id（市场经理是为空)',
    remark       varchar(255)                           null comment '备注',
    create_id    bigint                                 null comment '创建者ID',
    create_by    varchar(64) charset utf8mb4 default '' null comment '创建者',
    create_time  datetime                               null comment '创建时间',
    create_dept  bigint                                 null comment '创建部门',
    update_id    bigint                                 null comment '更新者ID',
    update_by    varchar(64) charset utf8mb4 default '' null comment '更新者',
    update_time  datetime                               null comment '更新时间',
    del_flag     tinyint(1)                  default 0  null
)
    comment '订单用户拉卡拉' collate = utf8mb4_unicode_ci;


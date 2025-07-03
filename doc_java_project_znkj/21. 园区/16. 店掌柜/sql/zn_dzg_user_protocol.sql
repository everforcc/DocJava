-- auto-generated definition
create table zn_dzg_user_protocol
(
    id          bigint               not null comment 'id'
        primary key,
    type        int                  null comment '1 用户协议 2 隐私协议',
    content     text                 null comment '内容',
    remark      varchar(255)         null comment '备注',
    create_id   bigint               null comment '创建人id',
    create_by   varchar(32)          null comment '创建人',
    create_time datetime             null comment '创建时间',
    create_dept bigint               null comment '创建部门',
    update_id   bigint               null comment '更新人id',
    update_by   varchar(32)          null comment '更新人',
    update_time datetime             null comment '更新时间',
    del_flag    tinyint(1) default 0 null comment '删除标志（0代表存在 2代表删除）'
)
    comment '店掌柜用户协议';


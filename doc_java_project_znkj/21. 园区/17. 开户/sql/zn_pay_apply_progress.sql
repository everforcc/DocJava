-- auto-generated definition
create table zn_pay_apply_progress
(
    id          bigint                 not null comment 'sys_user id',
    progress    int         default 0  null comment '当前进度 1开户类型 2资料提交 3线下电签 4 实名认证',
    remark      varchar(255)           null comment '备注',
    create_id   bigint                 null comment '创建者ID',
    create_by   varchar(64) default '' null comment '创建者',
    create_time datetime               null comment '创建时间',
    create_dept bigint                 null comment '创建部门',
    update_id   bigint                 null comment '更新者ID',
    update_by   varchar(64) default '' null comment '更新者',
    update_time datetime               null comment '更新时间',
    del_flag    tinyint(1)  default 0  null,
    constraint zn_pay_apply_progress_id_uindex
        unique (id)
)
    comment '认证进度';

alter table zn_pay_apply_progress
    add primary key (id);


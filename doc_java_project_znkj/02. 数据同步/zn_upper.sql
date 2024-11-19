-- auto-generated definition
create table zn_upper
(
    id          bigint       not null comment '同步数据'
        primary key,
    t_name      varchar(255) not null comment '表名',
    t_id        bigint       not null comment 'ID',
    t_count     bigint       not null comment '次数',
    code        int          null comment '返回码',
    message     varchar(255) null comment '返回信息',
    create_id   bigint       null comment '创建者ID',
    create_by   varchar(50)  null comment '创建者',
    create_time datetime     null comment '创建时间',
    create_dept bigint       null comment '创建者部门',
    update_id   bigint       null comment '更新者ID',
    update_by   varchar(50)  null comment '更新者',
    update_time datetime     null comment '更新时间',
    del_flag    tinyint(1)   null comment '删除标识',
    remark      varchar(100) null comment '备注'
)
    comment '同步';


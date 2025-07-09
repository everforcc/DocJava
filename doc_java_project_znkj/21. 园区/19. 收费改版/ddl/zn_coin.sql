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





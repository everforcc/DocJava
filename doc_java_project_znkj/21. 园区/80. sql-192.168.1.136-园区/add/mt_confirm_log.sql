-- auto-generated definition
create table mt_confirm_log
(
    ID               int								comment '自增ID',
    sn      varchar(255) collate utf8mb4_unicode_ci null comment '设备编号',
    CODE             varchar(32)    default ''        not null comment '编码',
    AMOUNT           decimal(10, 2) default 0.00      null comment '核销金额',
    COUPON_ID        int            default 0         null comment '卡券ID',
    USER_COUPON_ID   int            default 0         not null comment '用户券ID',
    ORDER_ID         int            default 0         null comment '订单ID',
    CREATE_TIME      datetime                         null comment '创建时间',
    UPDATE_TIME      datetime                         null comment '更新时间',
    USER_ID          int            default 0         not null comment '卡券所属用户ID',
    OPERATOR_USER_ID int                              null comment '核销者用户ID',
    MERCHANT_ID      int            default 0         null comment '商户ID',
    STORE_ID         int            default 0         not null comment '核销店铺ID',
    STATUS           varchar(1)                       not null comment '状态，A正常核销；D：撤销使用',
    CANCEL_TIME      datetime                         null comment '撤销时间',
    OPERATOR         varchar(30)                      null comment '最后操作人',
    OPERATOR_FROM    varchar(30)    default 'mt_user' null comment '操作来源user_id对应表t_account 还是 mt_user',
    REMARK           varchar(500)   default ''        null comment '备注信息'
)
    comment '核销记录表' charset = utf8mb3;


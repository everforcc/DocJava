-- auto-generated definition
create table mt_user_coupon
(
    ID               int								comment '自增ID',
    sn      varchar(255) collate utf8mb4_unicode_ci null comment '设备编号',
    CODE        varchar(32)    default ''   not null comment '编码',
    TYPE        char           default 'C'  not null comment '券类型，C优惠券；P预存卡；T集次卡',
    IMAGE       text                        null comment '效果图',
    GROUP_ID    int            default 0    not null comment '券组ID',
    COUPON_ID   int            default 0    not null comment '券ID',
    MOBILE      varchar(20)    default ''   null comment '用户手机号码',
    USER_ID     int            default 0    null comment '用户ID',
    MERCHANT_ID int            default 0    null comment '商户ID',
    STORE_ID    int            default 0    null comment '使用店铺ID',
    AMOUNT      decimal(10, 2) default 0.00 null comment '面额',
    BALANCE     decimal(10, 2) default 0.00 null comment '余额',
    STATUS      char           default '1'  not null comment '状态：A：未使用；B：已使用；C：已过期; D：已删除；E：未领取',
    USED_TIME   datetime                    null comment '使用时间',
    CREATE_TIME datetime                    null comment '创建时间',
    UPDATE_TIME datetime                    null comment '更新时间',
    EXPIRE_TIME datetime                    null comment '过期时间',
    OPERATOR    varchar(30)    default ''   null comment '最后操作人',
    UUID        varchar(50)    default ''   null comment '导入UUID',
    ORDER_ID    int            default 0    null comment '订单ID'
)
    comment '会员卡券表' charset = utf8mb3;

create index index_code
    on mt_user_coupon (CODE);

create index index_coupon_id
    on mt_user_coupon (COUPON_ID);

create index index_group_id
    on mt_user_coupon (GROUP_ID);

create index index_user_id
    on mt_user_coupon (USER_ID);


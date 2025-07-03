-- auto-generated definition
create table mt_store
(
    ID               int								comment '自增ID',
    sn      varchar(255) collate utf8mb4_unicode_ci null comment '设备编号',
    MERCHANT_ID        int unsigned   default '0'  null comment '所属商户',
    NAME               varchar(50)    default ''   not null comment '店铺名称',
    QR_CODE            varchar(255)   default ''   null comment '店铺二维码',
    LOGO               text                        null comment '店铺LOGO',
    IS_DEFAULT         char           default 'N'  not null comment '是否默认',
    CONTACT            varchar(30)    default ''   null comment '联系人姓名',
    WX_MCH_ID          varchar(30)    default ''   null comment '微信支付商户号',
    WX_API_V2          varchar(32)    default ''   null comment '微信支付APIv2密钥',
    WX_CERT_PATH       varchar(255)   default ''   null comment '微信支付证书',
    ALIPAY_APP_ID      varchar(100)   default ''   null comment '支付宝appId',
    ALIPAY_PRIVATE_KEY text                        null comment '支付宝应用私钥',
    ALIPAY_PUBLIC_KEY  text                        null comment '支付宝应用公钥',
    PHONE              varchar(20)    default ''   null comment '联系电话',
    ADDRESS            varchar(100)   default ''   null comment '地址',
    LATITUDE           varchar(30)    default ''   null comment '经度',
    LONGITUDE          varchar(30)    default ''   null comment '维度',
    DISTANCE           decimal(10, 2) default 0.00 null comment '距离',
    HOURS              varchar(255)   default ''   null comment '营业时间',
    LICENSE            varchar(255)   default ''   null comment '营业执照',
    CREDIT_CODE        varchar(50)    default ''   null comment '统一社会信用码',
    BANK_NAME          varchar(100)   default ''   null comment '银行名称',
    BANK_CARD_NAME     varchar(100)   default ''   null comment '银行卡账户名',
    BANK_CARD_NO       varchar(100)   default ''   null comment '银行卡卡号',
    DESCRIPTION        varchar(2000)  default ''   null comment '备注信息',
    CREATE_TIME        datetime                    null comment '创建时间',
    UPDATE_TIME        datetime                    null comment '更新时间',
    STATUS             char           default 'A'  null comment '状态，A：有效/启用；D：无效',
    OPERATOR           varchar(30)    default ''   null comment '最后操作人'
)
    comment '店铺表' charset = utf8mb3;


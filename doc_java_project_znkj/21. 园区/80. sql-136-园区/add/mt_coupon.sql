-- auto-generated definition
create table mt_coupon
(
    ID               int								comment '自增ID',
    sn      varchar(255) collate utf8mb4_unicode_ci null comment '设备编号',
    MERCHANT_ID  int            default 0         null comment '商户ID',
    STORE_ID     int            default 0         null comment '店铺ID',
    GROUP_ID     int            default 0         not null comment '券组ID',
    TYPE         char           default 'C'       null comment '券类型，C优惠券；P预存卡；T集次卡',
    NAME         varchar(100)   default ''        not null comment '券名称',
    IS_GIVE      tinyint(1)     default 0         null comment '是否允许转赠',
    GRADE_IDS    varchar(100)   default ''        null comment '适用会员等级',
    POINT        int            default 0         null comment '获得卡券所消耗积分',
    APPLY_GOODS  varchar(20)    default ''        null comment '适用商品：allGoods、parkGoods',
    RECEIVE_CODE varchar(32)    default ''        null comment '领取码',
    USE_FOR      varchar(30)    default ''        null comment '使用专项',
    EXPIRE_TYPE  varchar(30)    default ''        null comment '过期类型',
    EXPIRE_TIME  int            default 0         null comment '有效期，单位：天',
    BEGIN_TIME   datetime                         null comment '开始有效期',
    END_TIME     datetime                         null comment '结束有效期',
    AMOUNT       decimal(10, 2) default 0.00      null comment '面额',
    SEND_WAY     varchar(20)    default 'backend' null comment '发放方式',
    SEND_NUM     int unsigned   default '1'       null comment '每次发放数量',
    TOTAL        int            default 0         null comment '发行数量',
    LIMIT_NUM    int            default 1         null comment '每人拥有数量限制',
    EXCEPT_TIME  varchar(500)   default ''        null comment '不可用日期，逗号隔开。周末：weekend；其他：2019-01-02_2019-02-09',
    STORE_IDS    varchar(100)   default ''        null comment '所属店铺ID,逗号隔开',
    DESCRIPTION  varchar(2000)  default ''        null comment '描述信息',
    IMAGE        varchar(100)   default ''        null comment '效果图片',
    REMARKS      varchar(1000)  default ''        null comment '后台备注',
    IN_RULE      varchar(1000)  default ''        null comment '获取券的规则',
    OUT_RULE     varchar(1000)  default ''        null comment '核销券的规则',
    CREATE_TIME  datetime                         null comment '创建时间',
    UPDATE_TIME  datetime                         null comment '更新时间',
    OPERATOR     varchar(30)    default ''        null comment '最后操作人',
    STATUS       char           default 'A'       null comment 'A：正常；D：删除'
)
    comment '卡券信息表' charset = utf8mb3;


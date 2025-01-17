-- auto-generated definition
create table mt_user
(
    ID               int								comment '自增ID',
    sn      varchar(255) collate utf8mb4_unicode_ci null comment '设备编号',
    MOBILE      varchar(20)  default ''   null comment '手机号码',
    GROUP_ID    int          default 0    null comment '分组ID',
    USER_NO     varchar(30)  default ''   null comment '会员号',
    AVATAR      text                      null comment '头像',
    NAME        varchar(30)  default ''   null comment '称呼',
    OPEN_ID     varchar(50)  default ''   null comment '微信open_id',
    IDCARD      varchar(20)  default ''   null comment '证件号码',
    GRADE_ID    varchar(10)  default '1'  null comment '等级ID',
    START_TIME  datetime                  null comment '会员开始时间',
    END_TIME    datetime                  null comment '会员结束时间',
    BALANCE     float(10, 2) default 0.00 null comment '余额',
    POINT       int          default 0    null comment '积分',
    SEX         int          default 1    null comment '性别 1男；0女',
    BIRTHDAY    varchar(20)  default ''   null comment '出生日期',
    CAR_NO      varchar(10)  default ''   null comment '车牌号',
    SOURCE      varchar(30)  default ''   null comment '来源渠道',
    PASSWORD    varchar(32)  default ''   null comment '密码',
    SALT        varchar(4)   default ''   null comment 'salt',
    ADDRESS     varchar(100) default ''   null comment '地址',
    MERCHANT_ID int          default 0    null comment '所属商户ID',
    STORE_ID    int          default 0    null comment '所属店铺ID',
    IS_STAFF    char         default 'N'  null comment '是否员工',
    CREATE_TIME datetime                  null comment '创建时间',
    UPDATE_TIME datetime                  null comment '更新时间',
    STATUS      char         default 'A'  null comment '状态，A：激活；N：禁用；D：删除',
    DESCRIPTION varchar(255) default ''   null comment '备注信息',
    OPERATOR    varchar(30)  default ''   null comment '最后操作人'
)
    comment '会员个人信息' charset = utf8mb3;

create index index_phone
    on mt_user (MOBILE);


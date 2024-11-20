show create table mt_merchant;

CREATE TABLE `mt_merchant`
(
    `ID`                     bigint      NOT NULL COMMENT 'ID',
    `TYPE`                   varchar(30)          DEFAULT '' COMMENT '类型，restaurant：餐饮；retail：零售；service：服务；other：其他',
    `LOGO`                   text COMMENT 'logo',
    `NO`                     varchar(20)          DEFAULT '' COMMENT '商户号',
    `NAME`                   varchar(50) NOT NULL DEFAULT '' COMMENT '商户名称',
    `CONTACT`                varchar(30)          DEFAULT '' COMMENT '联系人姓名',
    `PHONE`                  varchar(20)          DEFAULT '' COMMENT '联系电话',
    `ADDRESS`                varchar(100)         DEFAULT '' COMMENT '联系地址',
    `WX_APP_ID`              varchar(50)          DEFAULT '' COMMENT '微信小程序appId',
    `WX_APP_SECRET`          varchar(50)          DEFAULT '' COMMENT '微信小程序秘钥',
    `WX_OFFICIAL_APP_ID`     varchar(50)          DEFAULT '' COMMENT '微信公众号appId',
    `WX_OFFICIAL_APP_SECRET` varchar(50)          DEFAULT '' COMMENT '微信公众号秘钥',
    `DESCRIPTION`            varchar(2000)        DEFAULT '' COMMENT '备注信息',
    `CREATE_TIME`            datetime             DEFAULT NULL COMMENT '创建时间',
    `UPDATE_TIME`            datetime             DEFAULT NULL COMMENT '更新时间',
    `STATUS`                 char(1)              DEFAULT 'A' COMMENT '状态，A：有效/启用；D：无效',
    `OPERATOR`               varchar(30)          DEFAULT '' COMMENT '最后操作人',
    `up_flag`                int                  DEFAULT '0' COMMENT '0 未上传 1 上传中 2 已上传',
    `up_count`               int                  DEFAULT '0' COMMENT '上传次数',
    `up_msg`                 varchar(255)         DEFAULT NULL COMMENT '上传信息',
    `up_id`                  varchar(255)         DEFAULT NULL COMMENT '上传ID',
    `zn_device_sn_var`       varchar(255)         DEFAULT NULL COMMENT '设备编号',
    `remark`                 varchar(100)         DEFAULT NULL COMMENT '备注',
    `del_flag`               tinyint              DEFAULT '0' COMMENT '删除标识',
    `create_id`              bigint               DEFAULT NULL COMMENT '创建者ID',
    `create_by`              varchar(50)          DEFAULT NULL COMMENT '创建者',
    `update_id`              bigint               DEFAULT NULL COMMENT '更新者ID',
    `update_by`              varchar(50)          DEFAULT NULL COMMENT '更新者',
    `create_dept`            bigint               DEFAULT NULL COMMENT '创建者部门',
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3 COMMENT ='商户表';
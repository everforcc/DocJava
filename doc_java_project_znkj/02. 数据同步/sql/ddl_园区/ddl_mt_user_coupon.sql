show create table mt_user_coupon;

--
CREATE TABLE `mt_user_coupon`
(
    `ID`               bigint      NOT NULL COMMENT 'ID',
    `CODE`             varchar(32) NOT NULL DEFAULT '' COMMENT '编码',
    `TYPE`             char(1)     NOT NULL DEFAULT 'C' COMMENT '券类型，C优惠券；P预存卡；T集次卡',
    `IMAGE`            text COMMENT '效果图',
    `GROUP_ID`         int         NOT NULL DEFAULT '0' COMMENT '券组ID',
    `coupon_id`        bigint      NOT NULL DEFAULT '0' COMMENT '卡券ID',
    `MOBILE`           varchar(20)          DEFAULT '' COMMENT '用户手机号码',
    `user_id`          bigint      NOT NULL DEFAULT '0' COMMENT '用户ID',
    `MERCHANT_ID`      bigint               DEFAULT '0' COMMENT '商户ID',
    `store_id`         bigint               DEFAULT '0' COMMENT '使用店铺ID',
    `AMOUNT`           decimal(10, 2)       DEFAULT '0.00' COMMENT '面额',
    `BALANCE`          decimal(10, 2)       DEFAULT '0.00' COMMENT '余额',
    `STATUS`           char(1)     NOT NULL DEFAULT '1' COMMENT '状态：A：未使用；B：已使用；C：已过期; D：已删除；E：未领取',
    `USED_TIME`        datetime             DEFAULT NULL COMMENT '使用时间',
    `CREATE_TIME`      datetime             DEFAULT NULL COMMENT '创建时间',
    `UPDATE_TIME`      datetime             DEFAULT NULL COMMENT '更新时间',
    `EXPIRE_TIME`      datetime             DEFAULT NULL COMMENT '过期时间',
    `OPERATOR`         varchar(30)          DEFAULT '' COMMENT '最后操作人',
    `UUID`             varchar(50)          DEFAULT '' COMMENT '导入UUID',
    `ORDER_ID`         int                  DEFAULT '0' COMMENT '订单ID',
    `up_flag`          int                  DEFAULT '0' COMMENT '0 未上传 1 上传中 2 已上传',
    `up_count`         int                  DEFAULT '0' COMMENT '上传次数',
    `up_msg`           varchar(255)         DEFAULT NULL COMMENT '上传信息',
    `up_id`            varchar(255)         DEFAULT NULL COMMENT '上传ID',
    `zn_device_sn_var` varchar(255)         DEFAULT NULL COMMENT '设备编号',
    `remark`           varchar(100)         DEFAULT NULL COMMENT '备注',
    `del_flag`         tinyint              DEFAULT '0' COMMENT '删除标识',
    `create_id`        bigint               DEFAULT NULL COMMENT '创建者ID',
    `create_by`        varchar(50)          DEFAULT NULL COMMENT '创建者',
    `update_id`        bigint               DEFAULT NULL COMMENT '更新者ID',
    `update_by`        varchar(50)          DEFAULT NULL COMMENT '更新者',
    `create_dept`      bigint               DEFAULT NULL COMMENT '创建者部门',
    PRIMARY KEY (`ID`) USING BTREE,
    KEY `index_user_id` (`user_id`) USING BTREE,
    KEY `index_coupon_id` (`coupon_id`) USING BTREE,
    KEY `index_group_id` (`GROUP_ID`) USING BTREE,
    KEY `index_code` (`CODE`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3 COMMENT ='会员卡券表';



show create table mt_confirm_log;

--
CREATE TABLE `mt_confirm_log`
(
    `ID`               bigint      NOT NULL COMMENT 'ID',
    `CODE`             varchar(32) NOT NULL DEFAULT '' COMMENT '编码',
    `AMOUNT`           decimal(10, 2)       DEFAULT '0.00' COMMENT '核销金额',
    `coupon_id`        bigint               DEFAULT '0' COMMENT '卡券ID',
    `USER_COUPON_ID`   int         NOT NULL DEFAULT '0' COMMENT '用户券ID',
    `ORDER_ID`         int                  DEFAULT '0' COMMENT '订单ID',
    `CREATE_TIME`      datetime             DEFAULT NULL COMMENT '创建时间',
    `UPDATE_TIME`      datetime             DEFAULT NULL COMMENT '更新时间',
    `user_id`          bigint      NOT NULL DEFAULT '0' COMMENT '卡券所属用户ID',
    `OPERATOR_USER_ID` int                  DEFAULT NULL COMMENT '核销者用户ID',
    `MERCHANT_ID`      bigint               DEFAULT '0' COMMENT '商户ID',
    `store_id`         bigint               DEFAULT '0' COMMENT '核销店铺ID',
    `STATUS`           varchar(1)  NOT NULL COMMENT '状态，A正常核销；D：撤销使用',
    `CANCEL_TIME`      datetime             DEFAULT NULL COMMENT '撤销时间',
    `OPERATOR`         varchar(30)          DEFAULT NULL COMMENT '最后操作人',
    `OPERATOR_FROM`    varchar(30)          DEFAULT 'mt_user' COMMENT '操作来源user_id对应表t_account 还是 mt_user',
    `REMARK`           varchar(500)         DEFAULT '' COMMENT '备注信息',
    `up_flag`          int                  DEFAULT '0' COMMENT '0 未上传 1 上传中 2 已上传',
    `up_count`         int                  DEFAULT '0' COMMENT '上传次数',
    `up_msg`           varchar(255)         DEFAULT NULL COMMENT '上传信息',
    `up_id`            varchar(255)         DEFAULT NULL COMMENT '上传ID',
    `zn_device_sn_var` varchar(255)         DEFAULT NULL COMMENT '设备编号',
    `del_flag`         tinyint              DEFAULT '0' COMMENT '删除标识',
    `create_id`        bigint               DEFAULT NULL COMMENT '创建者ID',
    `create_by`        varchar(50)          DEFAULT NULL COMMENT '创建者',
    `update_id`        bigint               DEFAULT NULL COMMENT '更新者ID',
    `update_by`        varchar(50)          DEFAULT NULL COMMENT '更新者',
    `create_dept`      bigint               DEFAULT NULL COMMENT '创建者部门',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3 COMMENT ='核销记录表';
show create table mt_confirm_log;

--
CREATE TABLE `mt_confirm_log`
(
    `ID`               bigint      NOT NULL COMMENT 'ID',
    `CODE`             varchar(32) NOT NULL DEFAULT '' COMMENT '����',
    `AMOUNT`           decimal(10, 2)       DEFAULT '0.00' COMMENT '�������',
    `coupon_id`        bigint               DEFAULT '0' COMMENT '��ȯID',
    `USER_COUPON_ID`   int         NOT NULL DEFAULT '0' COMMENT '�û�ȯID',
    `ORDER_ID`         int                  DEFAULT '0' COMMENT '����ID',
    `CREATE_TIME`      datetime             DEFAULT NULL COMMENT '����ʱ��',
    `UPDATE_TIME`      datetime             DEFAULT NULL COMMENT '����ʱ��',
    `user_id`          bigint      NOT NULL DEFAULT '0' COMMENT '��ȯ�����û�ID',
    `OPERATOR_USER_ID` int                  DEFAULT NULL COMMENT '�������û�ID',
    `MERCHANT_ID`      bigint               DEFAULT '0' COMMENT '�̻�ID',
    `store_id`         bigint               DEFAULT '0' COMMENT '��������ID',
    `STATUS`           varchar(1)  NOT NULL COMMENT '״̬��A����������D������ʹ��',
    `CANCEL_TIME`      datetime             DEFAULT NULL COMMENT '����ʱ��',
    `OPERATOR`         varchar(30)          DEFAULT NULL COMMENT '��������',
    `OPERATOR_FROM`    varchar(30)          DEFAULT 'mt_user' COMMENT '������Դuser_id��Ӧ��t_account ���� mt_user',
    `REMARK`           varchar(500)         DEFAULT '' COMMENT '��ע��Ϣ',
    `up_flag`          int                  DEFAULT '0' COMMENT '0 δ�ϴ� 1 �ϴ��� 2 ���ϴ�',
    `up_count`         int                  DEFAULT '0' COMMENT '�ϴ�����',
    `up_msg`           varchar(255)         DEFAULT NULL COMMENT '�ϴ���Ϣ',
    `up_id`            varchar(255)         DEFAULT NULL COMMENT '�ϴ�ID',
    `zn_device_sn_var` varchar(255)         DEFAULT NULL COMMENT '�豸���',
    `del_flag`         tinyint              DEFAULT '0' COMMENT 'ɾ����ʶ',
    `create_id`        bigint               DEFAULT NULL COMMENT '������ID',
    `create_by`        varchar(50)          DEFAULT NULL COMMENT '������',
    `update_id`        bigint               DEFAULT NULL COMMENT '������ID',
    `update_by`        varchar(50)          DEFAULT NULL COMMENT '������',
    `create_dept`      bigint               DEFAULT NULL COMMENT '�����߲���',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3 COMMENT ='������¼��';
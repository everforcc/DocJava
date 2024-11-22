show create table mt_user_coupon;

--
CREATE TABLE `mt_user_coupon`
(
    `ID`               bigint      NOT NULL COMMENT 'ID',
    `CODE`             varchar(32) NOT NULL DEFAULT '' COMMENT '����',
    `TYPE`             char(1)     NOT NULL DEFAULT 'C' COMMENT 'ȯ���ͣ�C�Ż�ȯ��PԤ�濨��T���ο�',
    `IMAGE`            text COMMENT 'Ч��ͼ',
    `GROUP_ID`         int         NOT NULL DEFAULT '0' COMMENT 'ȯ��ID',
    `coupon_id`        bigint      NOT NULL DEFAULT '0' COMMENT '��ȯID',
    `MOBILE`           varchar(20)          DEFAULT '' COMMENT '�û��ֻ�����',
    `user_id`          bigint      NOT NULL DEFAULT '0' COMMENT '�û�ID',
    `MERCHANT_ID`      bigint               DEFAULT '0' COMMENT '�̻�ID',
    `store_id`         bigint               DEFAULT '0' COMMENT 'ʹ�õ���ID',
    `AMOUNT`           decimal(10, 2)       DEFAULT '0.00' COMMENT '���',
    `BALANCE`          decimal(10, 2)       DEFAULT '0.00' COMMENT '���',
    `STATUS`           char(1)     NOT NULL DEFAULT '1' COMMENT '״̬��A��δʹ�ã�B����ʹ�ã�C���ѹ���; D����ɾ����E��δ��ȡ',
    `USED_TIME`        datetime             DEFAULT NULL COMMENT 'ʹ��ʱ��',
    `CREATE_TIME`      datetime             DEFAULT NULL COMMENT '����ʱ��',
    `UPDATE_TIME`      datetime             DEFAULT NULL COMMENT '����ʱ��',
    `EXPIRE_TIME`      datetime             DEFAULT NULL COMMENT '����ʱ��',
    `OPERATOR`         varchar(30)          DEFAULT '' COMMENT '��������',
    `UUID`             varchar(50)          DEFAULT '' COMMENT '����UUID',
    `ORDER_ID`         int                  DEFAULT '0' COMMENT '����ID',
    `up_flag`          int                  DEFAULT '0' COMMENT '0 δ�ϴ� 1 �ϴ��� 2 ���ϴ�',
    `up_count`         int                  DEFAULT '0' COMMENT '�ϴ�����',
    `up_msg`           varchar(255)         DEFAULT NULL COMMENT '�ϴ���Ϣ',
    `up_id`            varchar(255)         DEFAULT NULL COMMENT '�ϴ�ID',
    `zn_device_sn_var` varchar(255)         DEFAULT NULL COMMENT '�豸���',
    `remark`           varchar(100)         DEFAULT NULL COMMENT '��ע',
    `del_flag`         tinyint              DEFAULT '0' COMMENT 'ɾ����ʶ',
    `create_id`        bigint               DEFAULT NULL COMMENT '������ID',
    `create_by`        varchar(50)          DEFAULT NULL COMMENT '������',
    `update_id`        bigint               DEFAULT NULL COMMENT '������ID',
    `update_by`        varchar(50)          DEFAULT NULL COMMENT '������',
    `create_dept`      bigint               DEFAULT NULL COMMENT '�����߲���',
    PRIMARY KEY (`ID`) USING BTREE,
    KEY `index_user_id` (`user_id`) USING BTREE,
    KEY `index_coupon_id` (`coupon_id`) USING BTREE,
    KEY `index_group_id` (`GROUP_ID`) USING BTREE,
    KEY `index_code` (`CODE`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3 COMMENT ='��Ա��ȯ��';



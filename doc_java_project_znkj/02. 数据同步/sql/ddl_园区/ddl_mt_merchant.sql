show create table mt_merchant;

CREATE TABLE `mt_merchant`
(
    `ID`                     bigint      NOT NULL COMMENT 'ID',
    `TYPE`                   varchar(30)          DEFAULT '' COMMENT '���ͣ�restaurant��������retail�����ۣ�service������other������',
    `LOGO`                   text COMMENT 'logo',
    `NO`                     varchar(20)          DEFAULT '' COMMENT '�̻���',
    `NAME`                   varchar(50) NOT NULL DEFAULT '' COMMENT '�̻�����',
    `CONTACT`                varchar(30)          DEFAULT '' COMMENT '��ϵ������',
    `PHONE`                  varchar(20)          DEFAULT '' COMMENT '��ϵ�绰',
    `ADDRESS`                varchar(100)         DEFAULT '' COMMENT '��ϵ��ַ',
    `WX_APP_ID`              varchar(50)          DEFAULT '' COMMENT '΢��С����appId',
    `WX_APP_SECRET`          varchar(50)          DEFAULT '' COMMENT '΢��С������Կ',
    `WX_OFFICIAL_APP_ID`     varchar(50)          DEFAULT '' COMMENT '΢�Ź��ں�appId',
    `WX_OFFICIAL_APP_SECRET` varchar(50)          DEFAULT '' COMMENT '΢�Ź��ں���Կ',
    `DESCRIPTION`            varchar(2000)        DEFAULT '' COMMENT '��ע��Ϣ',
    `CREATE_TIME`            datetime             DEFAULT NULL COMMENT '����ʱ��',
    `UPDATE_TIME`            datetime             DEFAULT NULL COMMENT '����ʱ��',
    `STATUS`                 char(1)              DEFAULT 'A' COMMENT '״̬��A����Ч/���ã�D����Ч',
    `OPERATOR`               varchar(30)          DEFAULT '' COMMENT '��������',
    `up_flag`                int                  DEFAULT '0' COMMENT '0 δ�ϴ� 1 �ϴ��� 2 ���ϴ�',
    `up_count`               int                  DEFAULT '0' COMMENT '�ϴ�����',
    `up_msg`                 varchar(255)         DEFAULT NULL COMMENT '�ϴ���Ϣ',
    `up_id`                  varchar(255)         DEFAULT NULL COMMENT '�ϴ�ID',
    `zn_device_sn_var`       varchar(255)         DEFAULT NULL COMMENT '�豸���',
    `remark`                 varchar(100)         DEFAULT NULL COMMENT '��ע',
    `del_flag`               tinyint              DEFAULT '0' COMMENT 'ɾ����ʶ',
    `create_id`              bigint               DEFAULT NULL COMMENT '������ID',
    `create_by`              varchar(50)          DEFAULT NULL COMMENT '������',
    `update_id`              bigint               DEFAULT NULL COMMENT '������ID',
    `update_by`              varchar(50)          DEFAULT NULL COMMENT '������',
    `create_dept`            bigint               DEFAULT NULL COMMENT '�����߲���',
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3 COMMENT ='�̻���';
--
show create table mt_address;
--
CREATE TABLE `mt_address`
(
    `ID`          int(11)     NOT NULL AUTO_INCREMENT COMMENT '����ID',
    `USER_ID`     int(11)     NOT NULL DEFAULT '0' COMMENT '�û�ID',
    `NAME`        varchar(30) NOT NULL DEFAULT '' COMMENT '�ջ�������',
    `MOBILE`      varchar(20)          DEFAULT '' COMMENT '�ջ��ֻ���',
    `PROVINCE_ID` int(10) unsigned     DEFAULT '0' COMMENT 'ʡ��ID',
    `CITY_ID`     int(10) unsigned     DEFAULT '0' COMMENT '����ID',
    `REGION_ID`   int(11)              DEFAULT '0' COMMENT '��/��ID',
    `DETAIL`      varchar(255)         DEFAULT '' COMMENT '��ϸ��ַ',
    `IS_DEFAULT`  char(1)              DEFAULT 'N' COMMENT '�Ƿ�Ĭ��',
    `CREATE_TIME` datetime             DEFAULT NULL COMMENT '����ʱ��',
    `UPDATE_TIME` datetime             DEFAULT NULL COMMENT '����ʱ��',
    `STATUS`      char(1)              DEFAULT 'A' COMMENT '״̬',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8 COMMENT ='��Ա��ַ��'




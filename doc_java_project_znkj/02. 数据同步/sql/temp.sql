--
show create table mt_address;
--
CREATE TABLE `mt_address`
(
    `ID`          int(11)     NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `USER_ID`     int(11)     NOT NULL DEFAULT '0' COMMENT '用户ID',
    `NAME`        varchar(30) NOT NULL DEFAULT '' COMMENT '收货人姓名',
    `MOBILE`      varchar(20)          DEFAULT '' COMMENT '收货手机号',
    `PROVINCE_ID` int(10) unsigned     DEFAULT '0' COMMENT '省份ID',
    `CITY_ID`     int(10) unsigned     DEFAULT '0' COMMENT '城市ID',
    `REGION_ID`   int(11)              DEFAULT '0' COMMENT '区/县ID',
    `DETAIL`      varchar(255)         DEFAULT '' COMMENT '详细地址',
    `IS_DEFAULT`  char(1)              DEFAULT 'N' COMMENT '是否默认',
    `CREATE_TIME` datetime             DEFAULT NULL COMMENT '创建时间',
    `UPDATE_TIME` datetime             DEFAULT NULL COMMENT '更新时间',
    `STATUS`      char(1)              DEFAULT 'A' COMMENT '状态',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8 COMMENT ='会员地址表'




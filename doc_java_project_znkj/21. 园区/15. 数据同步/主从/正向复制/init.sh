#!/bin/bash

# 在主库创建测试数据库和用户
mysql -h 192.168.0.8 -P 3305 -u root -prootpass -e "
  CREATE DATABASE IF NOT EXISTS oneforall;
  CREATE USER IF NOT EXISTS 'znkj'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
  GRANT ALL PRIVILEGES ON oneforall.* TO 'znkj'@'%';
  FLUSH PRIVILEGES;
"

# 创建复制用户
mysql -h 192.168.0.8 -P 3305 -u root -prootpass -e "
  CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED WITH mysql_native_password BY 'repl_pass';
  GRANT REPLICATION SLAVE ON *.* TO 'repl_user'@'%';
  FLUSH PRIVILEGES;
"

# Slave1 向 Master 注册复制 binlog mysql-bin 要根据自己的修改，敲命令看
SLAVE1_STATUS=$(mysql -h 192.168.0.8 -P 3305 -u root -prootpass -e "SHOW MASTER STATUS;" | grep binlog)
BINLOG_FILE1=$(echo $SLAVE1_STATUS | awk '{print $1}')
BINLOG_POS1=$(echo $SLAVE1_STATUS | awk '{print $2}')

echo "Using BINLOG_FILE1: $BINLOG_FILE1, BINLOG_POS1: $BINLOG_POS1"


mysql -h 192.168.0.8 -P 3307 -u root -prootpass -e "

  STOP REPLICA IO_THREAD FOR CHANNEL 'slave1';
  STOP REPLICA SQL_THREAD FOR CHANNEL 'slave1';

  RESET SLAVE FOR CHANNEL 'slave1';

  CHANGE MASTER TO
    MASTER_HOST='192.168.0.8',
    MASTER_PORT=3305,
    MASTER_USER='repl_user',
    MASTER_PASSWORD='repl_pass',
    MASTER_LOG_FILE='$BINLOG_FILE1',
    MASTER_LOG_POS=$BINLOG_POS1
  FOR CHANNEL 'slave1';

  START SLAVE FOR CHANNEL 'slave1';
"

# Slave2 向 Master 注册复制
SLAVE2_STATUS=$(mysql -h 192.168.0.8 -P 3305 -u root -prootpass -e "SHOW MASTER STATUS;" | grep binlog)
BINLOG_FILE2=$(echo $SLAVE2_STATUS | awk '{print $1}')
BINLOG_POS2=$(echo $SLAVE2_STATUS | awk '{print $2}')


echo "Using BINLOG_FILE2: $BINLOG_FILE2, BINLOG_POS2: $BINLOG_POS2"

mysql -h 192.168.0.8 -P 3308 -u root -prootpass -e "

  STOP REPLICA IO_THREAD FOR CHANNEL 'slave2';
  STOP REPLICA SQL_THREAD FOR CHANNEL 'slave2';

  RESET SLAVE FOR CHANNEL 'slave2';

  CHANGE MASTER TO
    MASTER_HOST='192.168.0.8',
    MASTER_PORT=3305,
    MASTER_USER='repl_user',
    MASTER_PASSWORD='repl_pass',
    MASTER_LOG_FILE='$BINLOG_FILE2',
    MASTER_LOG_POS=$BINLOG_POS2
  FOR CHANNEL 'slave2';
  START SLAVE FOR CHANNEL 'slave2';
"

echo "? 反向主从复制已配置完成，测试数据库 oneforall 已创建。"
echo "? 测试用户 znkj/123456 已创建并授权访问数据库。"

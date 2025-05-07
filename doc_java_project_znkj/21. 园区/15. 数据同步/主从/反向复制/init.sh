#!/bin/bash
sleep 10

mysql -u root -prootpass -e "
  CREATE DATABASE IF NOT EXISTS oneforall;
  CREATE USER IF NOT EXISTS 'znkj'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
  GRANT ALL PRIVILEGES ON oneforall.* TO 'znkj'@'%';
  FLUSH PRIVILEGES;

  CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED WITH mysql_native_password BY 'repl_pass';
  GRANT REPLICATION SLAVE ON *.* TO 'repl_user'@'%';
  FLUSH PRIVILEGES;
"

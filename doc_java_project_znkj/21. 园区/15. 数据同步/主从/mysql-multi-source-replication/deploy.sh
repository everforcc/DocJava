#!/bin/bash

docker-compose down -v

# 启动容器
docker-compose up -d

# 等待初始化完成
sleep 30

# 设置复制通道
docker exec -i mysql-master mysql -u root -prootpass < setup_slave1.sql
docker exec -i mysql-master mysql -u root -prootpass < setup_slave2.sql

# 插入测试数据（slave1）
echo "插入 slave1 测试数据..."
docker exec -i mysql-slave1 mysql -u root -prootpass -e "
  CREATE DATABASE IF NOT EXISTS oneforall;
  USE oneforall;
  CREATE TABLE IF NOT EXISTS test (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100));
  INSERT INTO test (name) VALUES ('from_slave1');
"

# 插入测试数据（slave2）
echo "插入 slave2 测试数据..."
docker exec -i mysql-slave2 mysql -u root -prootpass -e "
  CREATE DATABASE IF NOT EXISTS oneforall;
  USE oneforall;
  CREATE TABLE IF NOT EXISTS test (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100));
  INSERT INTO test (name) VALUES ('from_slave2');
"


# 查看主库数据
echo "=== Master test table ==="
docker exec -i mysql-master mysql -u root -prootpass -e "USE oneforall; SELECT * FROM test;"

# 查看复制状态
echo "=== Slave1 Status ==="
docker exec -i mysql-master mysql -u root -prootpass -e "SHOW SLAVE STATUS FOR CHANNEL 'slave1'\G"

echo "=== Slave2 Status ==="
docker exec -i mysql-master mysql -u root -prootpass -e "SHOW SLAVE STATUS FOR CHANNEL 'slave2'\G"

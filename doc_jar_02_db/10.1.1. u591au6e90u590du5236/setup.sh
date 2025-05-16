#!/bin/bash

# 创建目录结构
mkdir -p slave master1 master2 master3

# 给主从容器添加执行权限
chmod +x test-replication.sh

# 启动容器
docker-compose down -v
docker-compose up -d

# 等待MySQL 容器启动
echo "Waiting for MySQL containers to start..."
sleep 60

# 检查主从复制状态
echo "Checking connectivity to master nodes..."
docker exec mysql-slave ping -c 2 mysql-master1
docker exec mysql-slave ping -c 2 mysql-master2
docker exec mysql-slave ping -c 2 mysql-master3

# 设置手动复制
echo "Setting up replication manually..."
docker exec mysql-slave mysql -uroot -proot -e "RESET SLAVE ALL; RESET MASTER;"

# 设置各个通道的复制
for MASTER in master1 master2 master3; do
  echo "Setting up replication for $MASTER..."
  docker exec mysql-slave mysql -uroot -proot -e "CHANGE REPLICATION SOURCE TO SOURCE_HOST='mysql-$MASTER', SOURCE_PORT=3306, SOURCE_USER='everforcc', SOURCE_PASSWORD='everforcc', SOURCE_AUTO_POSITION=1 FOR CHANNEL '$MASTER';"
  docker exec mysql-slave mysql -uroot -proot -e "START REPLICA FOR CHANNEL '$MASTER';"
done

# 等待复制开始
sleep 10

# 检查主从复制状态
echo "Checking replication status..."
for MASTER in master1 master2 master3; do
  echo "Status for channel $MASTER:"
  docker exec mysql-slave mysql -uroot -proot -e "SHOW REPLICA STATUS FOR CHANNEL '$MASTER'\G"
done

# 检查复制数据
echo "Checking test data..."
docker exec mysql-slave mysql -uroot -proot -e "SELECT * FROM db_test_sync.test_sync;"

echo "MySQL multi-source replication setup completed!" 
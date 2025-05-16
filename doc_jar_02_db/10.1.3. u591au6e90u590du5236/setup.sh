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
echo "Checking if containers are running..."
docker ps | grep mysql

# 设置手动复制
echo "Setting up replication manually..."
docker exec mysql-slave mysql -uroot -proot -e "RESET REPLICA ALL; RESET MASTER;"

# 设置各个通道的复制
for MASTER in master1 master2 master3; do
  echo "Setting up replication for $MASTER..."
  docker exec mysql-slave mysql -uroot -proot -e "CHANGE REPLICATION SOURCE TO SOURCE_HOST='mysql-$MASTER', SOURCE_PORT=3306, SOURCE_USER='everforcc', SOURCE_PASSWORD='everforcc', SOURCE_AUTO_POSITION=1, GET_SOURCE_PUBLIC_KEY=1 FOR CHANNEL '$MASTER';"
  docker exec mysql-slave mysql -uroot -proot -e "START REPLICA FOR CHANNEL '$MASTER';"
done

# 等待复制开始
sleep 10

# 检查主从复制状态
echo "Checking replication status..."
for MASTER in master1 master2 master3; do
  echo "Status for channel $MASTER:"
  docker exec mysql-slave mysql -uroot -proot -e "SHOW REPLICA STATUS FOR CHANNEL '$MASTER'\G"
  
  # 如果发现复制错误，尝试跳过事务
  IS_ERROR=$(docker exec mysql-slave mysql -uroot -proot -s -e "SELECT COUNT(1) FROM performance_schema.replication_applier_status_by_worker WHERE channel_name='$MASTER' AND last_error_number=1062")
  if [ "$IS_ERROR" -gt "0" ]; then
    echo "Detected duplicate key error for channel $MASTER, trying to skip transaction..."
    docker exec mysql-slave mysql -uroot -proot -e "STOP REPLICA FOR CHANNEL '$MASTER'; SET GLOBAL sql_slave_skip_counter = 1; START REPLICA FOR CHANNEL '$MASTER';"
    sleep 2
  fi
done

# 检查复制数据
echo "Checking test data..."
docker exec mysql-slave mysql -uroot -proot -e "SELECT * FROM db_test_sync.test_sync;"

echo "MySQL multi-source replication setup completed!" 
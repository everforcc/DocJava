# 构建并启动容器
docker-compose up -d

# 等待初始化完成
sleep 30

# 设置复制通道
docker exec -i mysql-master mysql -u root -prootpass < setup_slave1.sql
docker exec -i mysql-master mysql -u root -prootpass < setup_slave2.sql



# 验证命令
# 查看复制状态
docker exec -i mysql-master mysql -u root -prootpass -e "SHOW SLAVE STATUS FOR CHANNEL 'slave1'\G"
docker exec -i mysql-master mysql -u root -prootpass -e "SHOW SLAVE STATUS FOR CHANNEL 'slave2'\G"

# 创建测试表并插入数据到任意从库
docker exec -i mysql-slave1 mysql -u root -prootpass -e "USE oneforall; CREATE TABLE cc_sync1 (id INT  PRIMARY KEY, name VARCHAR(100)); INSERT INTO cc_sync1 (id,name) VALUES (1,'test');"
docker exec -i mysql-slave2 mysql -u root -prootpass -e "USE oneforall; CREATE TABLE cc_sync1 (id INT  PRIMARY KEY, name VARCHAR(100)); INSERT INTO cc_sync1 (id,name) VALUES (2,'test2');"
# 或者
docker exec -i mysql-slave2 mysql -u root -prootpass -e "USE oneforall; CREATE TABLE test2 (id INT  PRIMARY KEY, name VARCHAR(100)); INSERT INTO test2 (name) VALUES ('test');"
# docker exec -i mysql-slave2 mysql -u root -prootpass -e "USE oneforall;  INSERT INTO test2 (name) VALUES ('test');"
docker exec -i mysql-slave2 mysql -u root -prootpass -e "USE oneforall; CREATE TABLE test (id INT  PRIMARY KEY, name VARCHAR(100)); INSERT INTO test (id,name) VALUES (4,'test');"

# 检查主库是否同步成功
docker exec -i mysql-master mysql -u root -prootpass -e "USE oneforall; SELECT * FROM cc_sync1;"

docker exec -i mysql-master mysql -u root -prootpass -e "USE oneforall; SELECT * FROM test2;"

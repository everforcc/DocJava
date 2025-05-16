-- 创建测试数据库和表
CREATE DATABASE IF NOT EXISTS db_test_sync;
USE db_test_sync;

CREATE TABLE IF NOT EXISTS test_sync (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

-- 重置主服务器
RESET MASTER;

-- 创建复制用户并设置权限
CREATE USER IF NOT EXISTS 'everforcc'@'%' IDENTIFIED WITH mysql_native_password BY 'everforcc';
GRANT REPLICATION SLAVE ON *.* TO 'everforcc'@'%';
GRANT ALL PRIVILEGES ON db_test_sync.* TO 'everforcc'@'%';
FLUSH PRIVILEGES;

-- 设置主键自增起始值
ALTER TABLE test_sync AUTO_INCREMENT = 1000;

-- 测试数据
INSERT INTO db_test_sync.test_sync (name) VALUES ('master1-data1'); 
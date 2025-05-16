-- 创建测试数据库和表
CREATE DATABASE IF NOT EXISTS db_test_sync;
USE db_test_sync;

CREATE TABLE IF NOT EXISTS test_sync (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

-- 重置主服务器
RESET MASTER;

-- 创建复制用户
CREATE USER IF NOT EXISTS 'everforcc'@'%' IDENTIFIED BY 'everforcc';
GRANT REPLICATION SLAVE ON *.* TO 'everforcc'@'%';
GRANT ALL PRIVILEGES ON db_test_sync.* TO 'everforcc'@'%';
FLUSH PRIVILEGES;

-- 测试数据
INSERT INTO db_test_sync.test_sync (name) VALUES ('master1-data1'); 
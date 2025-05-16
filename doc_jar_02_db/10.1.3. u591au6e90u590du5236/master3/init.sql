-- u521bu5efau6d4bu8bd5u6570u636eu5e93u548cu8868
CREATE DATABASE IF NOT EXISTS db_test_sync;
USE db_test_sync;

CREATE TABLE IF NOT EXISTS test_sync (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

-- u91cdu8bbeu4e3bu670du52a1u5668
RESET MASTER;

-- u521bu5efau590du5236u7528u6237
CREATE USER IF NOT EXISTS 'everforcc'@'%' IDENTIFIED WITH mysql_native_password BY 'everforcc';
GRANT REPLICATION SLAVE ON *.* TO 'everforcc'@'%';
GRANT ALL PRIVILEGES ON db_test_sync.* TO 'everforcc'@'%';
FLUSH PRIVILEGES;

-- u8bbeu7f6eu81eau589eu503cu4ece3000u5f00u59cbuff0cu907fu514du4e0eu5176u4ed6u4e3bu5e93u51b2u7a81
ALTER TABLE test_sync AUTO_INCREMENT = 3000;

-- u6d4bu8bd5u6570u636e
INSERT INTO db_test_sync.test_sync (name) VALUES ('master3-data1'); 
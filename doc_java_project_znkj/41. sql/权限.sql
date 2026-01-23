
-- 查看正在连接的客户端
SHOW PROCESSLIST;

-- 1. 查看当前root用户情况
SELECT User, Host FROM mysql.user WHERE User = 'root';
SELECT * FROM mysql.user WHERE User = 'root';

-- 2. 删除不限制来源的root用户（如果存在）
DELETE FROM mysql.user WHERE User = 'root' AND Host = '%';

-- 3. 创建允许从本机访问的root用户
CREATE USER 'root'@'localhost' IDENTIFIED BY 'znkj123456';

-- 4. 创建允许从指定IP访问的root用户
CREATE USER 'root'@'192.168.1.189' IDENTIFIED BY 'znkj123456';
CREATE USER 'root'@'192.168.1.60' IDENTIFIED BY 'znkj123456';
CREATE USER 'root'@'%' IDENTIFIED BY 'znkj123456';

-- 5. 授予相应权限
-- 允许本机访问
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
-- 允许指定IP访问
GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.1.189' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.1.60' WITH GRANT OPTION;
-- 允许所有IP访问
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

-- 6. 刷新权限
FLUSH PRIVILEGES;

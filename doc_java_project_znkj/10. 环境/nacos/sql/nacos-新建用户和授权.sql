SELECT * FROM USER;
-- 创建新用户 znkj
CREATE USER 'znkj'@'%' IDENTIFIED BY 'znkj';
-- 创建nacos的表
GRANT ALL PRIVILEGES ON `nacos`.* TO 'znkj'@'%' ;
FLUSH PRIVILEGES;
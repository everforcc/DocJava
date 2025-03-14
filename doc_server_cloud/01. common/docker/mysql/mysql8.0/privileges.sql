use mysql;
select host, user from user;
CREATE USER 'cceverfor'@'%' IDENTIFIED BY '5664c.c.';
ALTER USER 'cceverfor'@'%' IDENTIFIED WITH mysql_native_password BY '5664c.c.';
-- 创建从从库同步数据的账号,随后手动创建
-- 指定ip
-- CREATE USER 'slave'@'119.3.239.81' IDENTIFIED WITH sha256_password BY '5664c.c.';
-- 基础项目表权限
GRANT ALL PRIVILEGES ON `oneforall`.* TO 'cceverfor'@'%' ;
-- hkzk
GRANT ALL PRIVILEGES ON `hkzkcrcc`.* TO 'cceverfor'@'%' ;
-- Apollo
GRANT ALL PRIVILEGES ON `ApolloConfigDB`.* TO 'cceverfor'@'%' ;
GRANT ALL PRIVILEGES ON `ApolloPortalDB`.* TO 'cceverfor'@'%' ;
-- 若依
GRANT ALL PRIVILEGES ON `rycloud`.* TO 'cceverfor'@'%' ;
-- nacos
GRANT ALL PRIVILEGES ON `nacosconfig`.* TO 'cceverfor'@'%' ;
flush privileges;
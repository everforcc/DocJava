use mysql;
select host, user from user;
-- 因为mysql版本是5.7，因此新建用户为如下命令：
create user usernamem identified by 'passwordm';
-- 将docker_mysql数据库的权限授权给创建的 usernamem 用户，密码为 passwordm
grant all on oneforall.* to usernamem@'%' identified by 'passwordm' with grant option;

-- 同步用户
CREATE USER 'usernamem'@'ip' IDENTIFIED BY 'passwordm';
grant replication slave on *.* to 'usernamem'@'ip';
-- 这一条命令一定要有：
flush privileges;
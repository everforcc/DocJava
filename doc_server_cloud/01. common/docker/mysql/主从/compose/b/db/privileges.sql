use mysql;
select host, user from user;
-- 因为mysql版本是5.7，因此新建用户为如下命令：
create user 'usernameb'@'127.0.0.1' identified by 'passwordb';
-- 将docker_mysql数据库的权限授权给创建的 usernameb 用户，密码为 passwordb
grant all on oneforall.* to 'usernameb'@'127.0.0.1' identified by 'passwordb' with grant option;
-- 这一条命令一定要有：
flush privileges;
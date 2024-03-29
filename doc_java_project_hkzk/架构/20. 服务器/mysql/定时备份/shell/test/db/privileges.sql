use mysql;
select host, user from user;
-- 因为mysql版本是5.7，因此新建用户为如下命令：
create user hkzkdev identified by 'hkzkdev';
-- 将docker_mysql数据库的权限授权给创建的 hkzkdev 用户，密码为hkzkdev
grant all on crccdev.* to hkzkdev@'%' identified by 'hkzkdev' with grant option;
-- 这一条命令一定要有：
flush privileges;
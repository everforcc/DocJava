use mysql;
select host, user from user;
-- 因为mysql版本是5.7，因此新建用户为如下命令：
create user hkzkdevslave identified by 'hkzkdevslave';
-- 将docker_mysql数据库的权限授权给创建的 hkzkdevslave 用户，密码为 hkzkdevslave
grant all on crccdev.* to hkzkdevslave@'%' identified by 'hkzkdevslave' with grant option;
grant all on crccconfigdev.* to hkzkdevslave@'%' identified by 'hkzkdevslave' with grant option;
-- 这一条命令一定要有：
flush privileges;
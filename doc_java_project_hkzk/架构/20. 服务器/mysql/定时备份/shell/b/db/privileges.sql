use mysql;
select host, user from user;
-- 因为mysql版本是5.7，因此新建用户为如下命令：
create user 'hkzkdevback'@'127.0.0.1' identified by 'hkzkdevback';
-- 将docker_mysql数据库的权限授权给创建的 hkzkdevback 用户，密码为 hkzkdevback
grant all on crccdev.* to 'hkzkdevback'@'127.0.0.1' identified by 'hkzkdevback' with grant option;
-- 这一条命令一定要有：
flush privileges;
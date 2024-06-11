use mysql;
select host, user from user;
-- 因为mysql版本是5.7，因此新建用户为如下命令：
create user hkzkdevmaster identified by 'hkzkdevmaster';
-- 将docker_mysql数据库的权限授权给创建的 hkzkdevmaster 用户，密码为 hkzkdevmaster
grant all on crccdev.* to hkzkdevmaster@'%' identified by 'hkzkdevmaster' with grant option;
grant all on crccconfigdev.* to hkzkdevmaster@'%' identified by 'hkzkdevmaster' with grant option;

-- 同步用户
CREATE USER 'hkzkdevrep'@'172.17.0.1' IDENTIFIED BY 'hkzkdevrep';
grant replication slave on *.* to 'hkzkdevrep'@'172.17.0.1';
-- 这一条命令一定要有：
flush privileges;
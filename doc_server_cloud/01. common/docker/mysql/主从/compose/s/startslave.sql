-- 开启主从复制脚本

-- 1. 查询主库状态
show master status;

-- 2. 从库配置脚本
CHANGE MASTER TO MASTER_HOST='ip', MASTER_PORT=3310,
MASTER_USER='username', MASTER_PASSWORD='password',
MASTER_LOG_FILE='bin-log.000003', MASTER_LOG_POS=157;

-- 3. 开启主从同步
START SLAVE;
-- 停止
stop slave;
-- 重启
reset slave;

-- 4. 查看从库状态
show slave status\G;

-- 5. 从master节点看 用户正在运行的线程
show processlist\G;
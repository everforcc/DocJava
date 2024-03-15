# 备份脚本测试

# 查询用户没有导出权限
mysqldump -h localhost -P 3306 -u cceverfor -p5664c.c. --databases oneforall > /tmp/2024-03-14_22_26_00.sql
# 使用root用户，或者对应权限的用户，或者将导出用户配置到配置文件中
mysqldump -h localhost -P 3306 -u root -pc.c.5664 --databases oneforall > /tmp/2024-03-15_11_38_00.sql

# docker 内部没安装定时任务，定时任务 在宿主机跑保存数据
# 将参数调整后写入 backup.sh 脚本内
docker exec mysql-8.0  /bin/bash -c 'mysqldump -h localhost -P 3306 -u root -pc.c.5664 --databases oneforall' > /mnt/test_`date +%Y%m%d_%H_%M_%S`.sql
# 查询用户没有导出权限
mysqldump -h localhost -P 3306 -u cceverfor -p5664c.c. --databases oneforall > /tmp/2024-03-14_22_26_00.sql
# 使用root用户，或者对应权限的用户，或者将导出用户配置到配置文件中
mysqldump -h localhost -P 3306 -u root -ppassword --databases oneforall > /tmp/2024-03-14_22_26_00.sql
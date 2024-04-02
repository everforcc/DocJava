# 基础镜像
FROM mysql:5.7

# 执行sql脚本 权限 数据库恢复数据等等
ADD db/*.sql /docker-entrypoint-initdb.d/

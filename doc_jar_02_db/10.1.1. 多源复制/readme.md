<span  style="font-family: Simsun,serif; font-size: 17px; ">

- 功能
- mysql多源复制

- 环境信息
- mysql版本 8.0
- docker-compose version 1.25.0, build unknown
- mysql从库  端口3310
- mysql主库一 端口3311
- mysql主库二 端口3312
- mysql主库三 端口3313
- 写docker-compose.yml和sh脚本

- 要求
- mysql主库一，二，三，对任何表的增删改查都会同步到从库
- mysql主库一，二，三，可以操作同一个表，也会同步到从库，不需要考虑数据主键冲突问题，业务会自行处理

- 测试数据
- 同步用户 账号 everforcc  密码 everforcc
- 测试数据库 db_test_sync 表 test_sync
- test_sync 字段 
- 主键 id int auto_increment
- 字段 name varchar(255)

- 脚本放到当前目录

</span>
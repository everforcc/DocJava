<span  style="font-family: Simsun,serif; font-size: 17px; ">

### 1. 表字段设计

- 类似链表的结构

| 字段         | 类型           | 说明                      |
|------------|--------------|-------------------------|
| id         |              |                         |
| uuid       |              |                         |
| parentid   |              | 如果为0则是第一层级              |
| parentuuid |              | 如果为0则是第一层级              |
| type       | int          | 目录类型: 0顶级目录,1分类目录,2业务目录 |
| name       | varchar(100) | 目录名                     |
| auth       | varchar(200) | 权限,是否可查                 |
| version    | int          | 版本号,默认为空                |

### 2. dto

### 3. 目录树初始化

- 系统初始化以后，将数据库数据初始化到redis中
- 经过增删改后，也要重新初始化,

</span>
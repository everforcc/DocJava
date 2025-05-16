# MySQL 多源复制配置

## 环境介绍

- MySQL 版本: 8.0
- 从库: 1个, 端口 3310
- 主库: 3个, 端口3311, 3312, 3313
- 所有数据库在相同数据库镜下运行

## 配置说明

### 目录结构

```
.
├── docker-compose.yml  # Docker环境配置文件
├── master1            # 主库1配置目录
│   ├── init.sql       # 初始化SQL
│   └── my.cnf         # MySQL 配置
├── master2            # 主库2配置目录
│   ├── init.sql
│   └── my.cnf
├── master3            # 主库3配置目录
│   ├── init.sql
│   └── my.cnf
├── README.md          # 说明文档
├── setup.sh           # 环境搭建脚本
├── slave              # 从库配置目录
│   ├── init.sql
│   └── my.cnf
└── test-replication.sh # 测试脚本
```

## 使用方法

1. 给脚本添加执行权限

```bash
chmod +x setup.sh test-replication.sh
```

2. 运行开始脚本构建环境

```bash
./setup.sh
```

3. 运行测试脚本测试复制功能

```bash
./test-replication.sh
```

## 主键冲突处理

多源复制中经常会遇到主键冲突问题，本配置采用了以下方法处理：

1. 主库ID隔离：每个主库设置不同的自增起始ID
   - master1: AUTO_INCREMENT = 1000
   - master2: AUTO_INCREMENT = 2000
   - master3: AUTO_INCREMENT = 3000

2. 从库错误处理：
   - 配置`slave_skip_errors=1062`跳过主键冲突错误
   - 脚本自动检测并处理复制错误

## 注意事项

1. 脚本会使用ROOT账号运行某些命令，这可能会出现安全警告
2. 复制同步可能需要一段时间，如果从库无法正常同步，可以查看MySQL错误日志或手动重设复制
3. 如果测试失败，可尝试重新运行设置脚本

## 主要配置说明

1. 所有主库使用GTID来实现复制
2. 从库通过多通道支持多源复制
3. 设置了并发复制以提高复制性能 

- 增加了mysql步长，避免主键冲突
- 需要再调整一版，不设置步长，业务会处理主键冲突

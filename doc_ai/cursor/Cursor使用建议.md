# Cursor使用建议 - 基于个人技术栈

## 📋 技术栈概览

根据您的技术栈，我为您整理了以下Cursor使用建议：

### 后端技术
- **Java SpringBoot** - 主要后端开发语言和框架
- **Python** - 辅助开发语言

### 数据库
- **MySQL** - 主要关系型数据库

### 服务器
- **Linux** - 服务器操作系统
- **Docker** - 容器化部署

### 中间件
- **Redis** - 缓存和会话存储
- **Nginx** - 反向代理和负载均衡

### 前端
- **HTML** - 基础前端标记语言
- **Vue** - 前端框架

---

## 🚀 Cursor核心功能使用建议

### 1. AI代码生成和补全

#### Java SpringBoot开发
```java
// 提示示例：
// "创建一个SpringBoot REST API控制器，包含CRUD操作"
// "生成一个用户实体类，包含id、name、email、createTime字段"
// "创建一个Service接口和实现类，包含用户管理功能"

@RestController
@RequestMapping("/api/users")
public class UserController {
    
    @Autowired
    private UserService userService;
    
    @GetMapping
    public List<User> getAllUsers() {
        return userService.findAll();
    }
    
    @PostMapping
    public User createUser(@RequestBody User user) {
        return userService.save(user);
    }
}
```

#### Python开发
```python
# 提示示例：
# "创建一个Python脚本，用于数据分析和处理"
# "生成一个Flask API端点，处理用户注册"
# "创建一个数据处理函数，包含异常处理"

import pandas as pd
import numpy as np

def process_data(data):
    """数据处理函数"""
    try:
        # 数据清洗
        cleaned_data = data.dropna()
        # 数据转换
        processed_data = cleaned_data.apply(lambda x: x * 2)
        return processed_data
    except Exception as e:
        print(f"数据处理错误: {e}")
        return None
```

### 2. 数据库相关开发

#### MySQL查询优化
```sql
-- 提示示例：
-- "优化这个查询，添加合适的索引"
-- "生成一个复杂的JOIN查询，连接用户表和订单表"
-- "创建一个存储过程，用于批量数据处理"

-- 优化后的查询示例
SELECT u.name, o.order_id, o.amount
FROM users u
INNER JOIN orders o ON u.id = o.user_id
WHERE u.status = 'active'
  AND o.create_time >= '2024-01-01'
ORDER BY o.create_time DESC
LIMIT 100;
```

#### Redis操作
```java
// 提示示例：
// "创建一个Redis工具类，包含常用的缓存操作"
// "实现分布式锁功能"
// "优化缓存策略，减少数据库访问"

@Service
public class RedisService {
    
    @Autowired
    private RedisTemplate<String, Object> redisTemplate;
    
    public void setCache(String key, Object value, long timeout) {
        redisTemplate.opsForValue().set(key, value, timeout, TimeUnit.SECONDS);
    }
    
    public Object getCache(String key) {
        return redisTemplate.opsForValue().get(key);
    }
}
```

### 3. 前端开发

#### Vue.js组件开发
```vue
<!-- 提示示例： -->
<!-- "创建一个Vue组件，包含表单验证功能" -->
<!-- "生成一个数据表格组件，支持分页和排序" -->
<!-- "创建一个用户管理页面，包含增删改查功能" -->

<template>
  <div class="user-management">
    <el-table :data="userList" v-loading="loading">
      <el-table-column prop="name" label="姓名"></el-table-column>
      <el-table-column prop="email" label="邮箱"></el-table-column>
      <el-table-column label="操作">
        <template #default="scope">
          <el-button @click="editUser(scope.row)">编辑</el-button>
          <el-button @click="deleteUser(scope.row.id)" type="danger">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      userList: [],
      loading: false
    }
  },
  methods: {
    async fetchUsers() {
      this.loading = true
      try {
        const response = await this.$http.get('/api/users')
        this.userList = response.data
      } catch (error) {
        this.$message.error('获取用户列表失败')
      } finally {
        this.loading = false
      }
    }
  }
}
</script>
```

### 4. 服务器和部署

#### Docker配置
```dockerfile
# 提示示例：
# "创建一个多阶段构建的Dockerfile，用于Java应用"
# "生成一个包含MySQL和Redis的docker-compose配置"
# "优化Docker镜像大小，减少构建时间"

# 多阶段构建示例
FROM maven:3.8-openjdk-11 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
```

#### Linux服务器管理
```bash
# 提示示例：
# "创建一个服务器监控脚本"
# "生成一个自动化部署脚本"
# "优化Nginx配置，提升性能"

#!/bin/bash
# 服务器监控脚本示例
echo "=== 服务器状态监控 ==="
echo "CPU使用率: $(top -bn1 | grep "Cpu(s)" | awk '{print $2}')"
echo "内存使用率: $(free | grep Mem | awk '{printf("%.2f%%", $3/$2 * 100.0)}')"
echo "磁盘使用率: $(df -h / | awk 'NR==2 {print $5}')"
```

---

## 🎯 Cursor高级功能使用技巧

### 1. 代码重构和优化

#### 提示示例
```
"重构这个Java类，提取公共方法，减少代码重复"
"优化这个SQL查询，提升查询性能"
"重构Vue组件，使用Composition API"
"优化Redis缓存策略，减少内存占用"
```

### 2. 代码审查和测试

#### 单元测试生成
```java
// 提示示例：
// "为这个Service类生成单元测试"
// "创建集成测试，测试数据库操作"
// "生成Mock对象，测试外部依赖"

@ExtendWith(MockitoExtension.class)
class UserServiceTest {
    
    @Mock
    private UserRepository userRepository;
    
    @InjectMocks
    private UserService userService;
    
    @Test
    void shouldCreateUser() {
        // Given
        User user = new User("张三", "zhangsan@email.com");
        when(userRepository.save(any(User.class))).thenReturn(user);
        
        // When
        User result = userService.createUser(user);
        
        // Then
        assertThat(result.getName()).isEqualTo("张三");
        verify(userRepository).save(user);
    }
}
```

### 3. 文档生成

#### API文档
```java
// 提示示例：
// "为这个Controller生成Swagger注解"
// "创建API接口文档"
// "生成数据库表结构文档"

@RestController
@RequestMapping("/api/users")
@Tag(name = "用户管理", description = "用户相关操作")
public class UserController {
    
    @Operation(summary = "获取用户列表", description = "分页获取所有用户")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "成功获取用户列表"),
        @ApiResponse(responseCode = "500", description = "服务器内部错误")
    })
    @GetMapping
    public Page<User> getUsers(@RequestParam(defaultValue = "0") int page,
                              @RequestParam(defaultValue = "10") int size) {
        return userService.findAll(PageRequest.of(page, size));
    }
}
```

---

## 🔧 Cursor配置建议

### 1. 扩展推荐

#### Java开发
- **Language Support for Java** - Java语言支持
- **Spring Boot Extension Pack** - Spring Boot开发工具
- **Maven for Java** - Maven项目管理

#### Python开发
- **Python** - Python语言支持
- **Pylance** - Python语言服务器
- **Python Test Explorer** - 测试工具

#### 前端开发
- **Vetur** - Vue.js开发工具
- **Vue Language Features** - Vue 3支持
- **ES7+ React/Redux/React-Native snippets** - 代码片段

#### 数据库
- **MySQL** - MySQL语法高亮和智能提示
- **Redis** - Redis语法支持

### 2. 设置优化

#### 代码格式化
```json
{
  "editor.formatOnSave": true,
  "editor.formatOnPaste": true,
  "java.format.enabled": true,
  "python.formatting.provider": "black"
}
```

#### AI设置
```json
{
  "cursor.chat.enabled": true,
  "cursor.chat.model": "gpt-4",
  "cursor.chat.maxTokens": 4000
}
```

---

## 📝 常用提示模板

### 1. 代码生成提示
```
"创建一个[功能描述]，使用[技术栈]，包含[具体功能]"
"生成一个[组件/类/方法]，实现[具体需求]"
"优化这个[代码片段]，提升[性能/可读性/安全性]"
```

### 2. 问题解决提示
```
"这个[错误信息]是什么原因？如何解决？"
"如何优化这个[性能问题]？"
"这个[代码逻辑]有什么问题？如何改进？"
```

### 3. 学习提示
```
"解释这个[技术概念]的原理和用法"
"比较[技术A]和[技术B]的优缺点"
"推荐学习[技术]的资源和路径"
```

---

## 🎯 工作流程建议

### 1. 项目初始化
1. 使用Cursor生成项目结构
2. 配置开发环境
3. 设置代码规范

### 2. 日常开发
1. 使用AI生成基础代码
2. 手动调整和优化
3. 生成单元测试
4. 代码审查和重构

### 3. 部署和维护
1. 生成部署脚本
2. 配置监控和日志
3. 性能优化

---

## ⚠️ 注意事项

### 1. 代码质量
- 始终审查AI生成的代码
- 确保代码符合项目规范
- 添加必要的注释和文档

### 2. 安全性
- 检查生成的代码是否存在安全漏洞
- 避免在提示中包含敏感信息
- 定期更新依赖和工具

### 3. 性能考虑
- 验证AI生成的SQL查询性能
- 检查缓存策略是否合理
- 确保代码不会造成内存泄漏

---

## 📚 学习资源

### 1. 官方文档
- [Cursor官方文档](https://cursor.sh/docs)
- [Java官方文档](https://docs.oracle.com/javase/)
- [Spring Boot文档](https://spring.io/projects/spring-boot)
- [Vue.js文档](https://vuejs.org/guide/)

### 2. 社区资源
- Stack Overflow
- GitHub
- 技术博客

---

*文档更新时间: 2024年12月* 
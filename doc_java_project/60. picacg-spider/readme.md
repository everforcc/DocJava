# picacg-spider
哔咔漫画收藏夹抓取

## Config
```json
{
  "email": "xxx",
  "password": "123",
  "imgDirectory": "D:\\pic",
  "range": [1, 20],
  "socks5": {
    "isEnable": true,
    "host": "127.0.0.1",
    "port": 1080
  }
}
```
- email: 邮箱/用户名
- password: 密码
- imgDirectory: 下载图片目录
- range: 旧到新 1~20页 (闭区间)
- socks5
    - isEnable: 是否开启

## Usages
与picacg-spider.jar同级目录创建config.json

- 打包jar
~~~shell
mvn clean package
~~~
- 执行jar
```shell script
cd target
java -jar picacg-spider-1.0.0-SNAPSHOT-fat.jar
```

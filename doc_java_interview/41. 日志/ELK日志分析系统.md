<span style="font-family:Simsun,serif; font-size:17px;">

[TOC]

- [ELK日志分析系统](https://blog.csdn.net/weixin_69148277/article/details/130922910)

### 1、ELK简介

- ELK是三个开源软件的缩写，分别表示：Elasticsearch , Logstash, Kibana , 它们都是开源软件。
- 新增了一个FileBeat，它是一个轻量级的日志收集处理工具(Agent)，Filebeat占用资源少，
- 适合于在各个服务器上搜集日志后传输给Logstash，官方也推荐此工具。

### 3、 完整日志系统基本特征

- 收集∶能够采集多种来源的日志数据
- 传输∶能够稳定的把日志数据解析过滤并传输到存储系统
- 存储∶存储日志数据
- 分析∶支持 UI分析
- 警告∶能够提供错误报告，监控机制

</span>
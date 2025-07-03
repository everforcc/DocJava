<span  style="font-family: Simsun,serif; font-size: 17px; ">

### 自动注入-@Resource-@Autowired

- @Autowired

~~~
@Qualifier 指定bean名
@Primary 指定哪个class是主要的bean
~~~

- @Resource

~~~
- name 可以手动指定根据那个
- type
~~~

~~~
@Resource@Autowired
    1. 根据名称来找
    2. 如果找不到，就去找所有的实现类
@Autowired
    1. 类型
    2. name  
~~~

</span>
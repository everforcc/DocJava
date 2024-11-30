<span  style="font-family: Simsun,serif; font-size: 17px; ">

### 不在SpringApplication的子级目录

- 例如一些公共的组件可以用注解引入

~~~
导入选择器
~~~

#### @Import({Registrar.class})

~~~
// Correct the classpath of your application so that it contains a single, compatible version of okhttp3.RequestBody
@Import(value = MinioConfig.class)
@SpringBootApplication
public class Sp06FileApplication {
~~~

</span>
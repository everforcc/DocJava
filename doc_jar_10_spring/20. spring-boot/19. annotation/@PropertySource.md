<span  style="font-family: Simsun,serif; font-size: 17px; ">

### @PropertySource

~~~java
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class,
        HibernateJpaAutoConfiguration.class})
@PropertySource(encoding = "UTF-8", value = {"classpath:config/mqtt.properties"})
public class Sp32MqttSpringApplication {
    public static void main(String[] args) {
        SpringApplication.run(Sp32MqttSpringApplication.class, args);
    }
}
~~~

- 配合 @Value注解
- 配置文件的值会直接显示在类里面

~~~java
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TestConfig {
    @Value("${test.dir}")
    private String testDir;
}
~~~

</span>
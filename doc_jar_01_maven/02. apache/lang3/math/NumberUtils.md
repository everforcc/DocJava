<span  style="font-family: Simsun,serif; font-size: 17px; ">

### 数值格式校验

~~~
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.junit.jupiter.api.Test;

@Test
public void test(){
    String s1 = "123";
    String s21 = "1.1";
    String s22 = "1.1";
    String s3 = "aaa";
    System.out.println(StringUtils.isNumeric(s1));
    System.out.println(StringUtils.isNumeric(s21));
    System.out.println(StringUtils.isNumeric(s22));
    System.out.println(StringUtils.isNumeric(s3));
    System.out.println(NumberUtils.isCreatable(s21));
    System.out.println(NumberUtils.isCreatable(s22));
}
~~~

</span>
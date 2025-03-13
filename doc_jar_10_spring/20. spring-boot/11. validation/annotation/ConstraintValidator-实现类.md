<span  style="font-family: Simsun,serif; font-size: 17px; ">

### 接口定义

- ConstraintValidator

~~~java
//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package javax.validation;

import java.lang.annotation.Annotation;

public interface ConstraintValidator<A extends Annotation, T> {
    default void initialize(A constraintAnnotation) {
    }

    boolean isValid(T var1, ConstraintValidatorContext var2);
}
~~~

### 实现类举例

- max
    - AbstractMaxValidator

~~~
    public boolean isValid(T value, ConstraintValidatorContext constraintValidatorContext) {
        if (value == null) {
            return true;
        } else {
            return this.compare(value) <= 0;
        }
    }
~~~

- min
    - AbstractMinValidator

~~~
    public boolean isValid(T value, ConstraintValidatorContext constraintValidatorContext) {
        if (value == null) {
            return true;
        } else {
            return this.compare(value) >= 0;
        }
    }
~~~

### @Pattern(value)

- 可以配合 @NotEmpty
- 或者正则表达式限制长度
- 根据业务情况处理

</span>
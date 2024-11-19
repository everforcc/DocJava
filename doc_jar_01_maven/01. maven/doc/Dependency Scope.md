<span  style="font-family: Simsun,serif; font-size: 17px; ">

### scope

~~~
<dependencyManagement>
    <dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-dependencies</artifactId>
        <version>${spring.boot}</version>
        <!-- ���๤�̴����ʽ -->
        <type>pom</type>

        <scope>import</scope>
    </dependency>
    </dependencies>
</dependencyManagement>
~~~
- [Dependency Scope](https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html#Importing_Dependencies)
~~~
import
This scope is only supported on a dependency of type pom in the <dependencyManagement> section. It indicates the dependency is to be replaced with the effective list of dependencies in the specified POM's <dependencyManagement> section. Since they are replaced, dependencies with a scope of import do not actually participate in limiting the transitivity of a dependency.
����Ŀ������������ ʹ����������е�dependency�İ汾
~~~

</span>
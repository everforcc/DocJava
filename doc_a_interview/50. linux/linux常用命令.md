<span style="font-family:Simsun,serif; font-size:17px;">

[TOC]

~~~
ls
ll
pwd
mv
cp
su
mkdir

grep
tail

tar
~~~

#### grep

- 主要功能是在文件中查找/过滤所需要的内容
~~~
-A<显示行数>：除了显示匹配 pattern 的那一行外，显示该行之后的内容
-B<显示行数>：除了显示匹配 pattern 的那一行外，显示该行之前的内容
-C<显示行数>：除了显示匹配 pattern 的那一行外，显示该行前、后的内容
-c：统计匹配的行数
-e：同时匹配多个pattern
-i：忽略字符的大小写
-n：显示匹配的行号
-o：只显示匹配的字符串
-v：显示没有匹配pattern的那一行，相当于反向匹配
-w：匹配整个单词
~~~

#### tail

- 查看实时刷新的日志
~~~
tail -f 10 file
~~~

</span>
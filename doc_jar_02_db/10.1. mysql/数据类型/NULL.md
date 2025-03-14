<span  style="font-family: Simsun,serif; font-size: 17px; ">

[参考](https://blog.csdn.net/qq_35383263/article/details/81281961)

- NULL 占磁盘空间(并不是数据本身占用空间，而是存储它是否为NULL的标记占用1个字节），而空字符串''是不占用磁盘空间的（它的长度是0字节所以不占用）
- 官方文档:NULL列需要行中的额外空间来记录它们的值是否为NULL。
- 即：定义字段类型时，如果允许为NULL，那么就要为每条数据多分配一个字节的空间来表示字段是否为NULL。

1. 字段类型是varchar时可以默认为空字符串，字段类型是int时不可以默认为空字符串，可以设置为0。
2. 当字段被设置为not null时，字段就不能是NULL但可以插入空字符串，但空字符串只能插入到字符串类型的字段中，插入其他类型的字段中会报错。而NULL可插入到任何允许为NULL的字段中。
3. SQL语句中对空字符串进行判断时可以使用=、>、<符号；但是对NULL进行判断时必须使用is null或is not null。
4. 包含NULL的字段列，如果在查询条件中使用is not null会导致索引失效，但是使用is null索引不会失效。
5. 使用count()函数进行统计时，会过滤掉NULL值，但不会过滤掉空字符串。

~~~sql
SELECT LENGTH(NULL), LENGTH(''), LENGTH('a'), LENGTH('1');

-- 返回值
-- length(NULL)  length('')  LENGTH('a')  LENGTH('1')  
-- (NULL)        0           1            1            
~~~

</span>
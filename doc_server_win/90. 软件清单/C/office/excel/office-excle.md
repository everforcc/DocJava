<span  style="font-family: Simsun,serif; font-size: 17px; ">

- 选择下拉框
- @ 替换单元格内数据
- 函数
~~~
=IF(INDIRECT(CHAR(COLUMN()+64)&"1")=INDIRECT("A"&ROW()),"是","不是")
~~~

### 数据类型

- 直接修改
- 菜单，数据》分列》修改类型(常规，文本，日期)

### 行数

~~~
=ROWS(A1:A10)
~~~

### 平均数

~~~
=AVERAGE(P3:P55)
~~~

### 过滤求和

~~~
=COUNTIF(P3:P55,">=96")-COUNTIF(P3:P55,">=108")

区间和大于等于，大于的区别，做的时候要注意
比如分数区间
A [108,120]
b [96,108)
~~~

</span>
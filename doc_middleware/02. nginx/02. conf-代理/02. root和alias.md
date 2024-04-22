<span  style="font-family: Simsun,serif; font-size: 17px; ">

### root

- 使用root，当访问/test/时，会到/www/abc/test/目录下找文件（如果没有test目录会报403）

~~~
location /test/ {
	root /www/abc;
	index  index.html index.htm;
}
~~~

### alias

- 使用alias，当访问/test/时，会到/www/abc/目录下找文件

~~~
location /test/ {
	alias /www/abc/;
	index  index.html index.htm;
}
~~~

</span>
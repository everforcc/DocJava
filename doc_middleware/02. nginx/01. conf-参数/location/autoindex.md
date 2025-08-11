<span  style="font-family: Simsun,serif; font-size: 17px; ">

### autoindex on

~~~nginx
    location /file/ {
        autoindex on;
        
        # 如果文件或目录有中文，则使用字符编码使用utf-8
        charset utf-8;
        charset_types text/html text/plain text/css application/json;
        
        #默认为on，显示出文件的确切大小，单位是bytes。   
        #改为off后，显示出文件的大概大小，单位是kB或者MB或者GB
        autoindex_exact_size off;
        
        #默认为off，显示的文件时间为GMT时间。
        #改为on后，显示的文件时间为文件的服务器时间
        autoindex_localtime on;
        
        alias D:/cache/BaiduSyncdisk/znkj/lhj/觉悟智慧/;
        
        # 有些环境下浏览器仍误判，可强制响应头
        add_header Content-Type "text/html; charset=utf-8" always;
        # 添加支持断点续传的配置
        add_header Accept-Ranges bytes;
    }
~~~

</span>
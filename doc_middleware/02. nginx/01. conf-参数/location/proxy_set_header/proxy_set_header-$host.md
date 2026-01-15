<span  style="font-family: Simsun,serif; font-size: 17px; ">

### $host

~~~conf
    location /prod-cloud-api/ {
            proxy_buffering off;
            proxy_cache off;
            proxy_http_version 1.1;
            proxy_set_header Connection '';
            # 301 报错
            #proxy_set_header Host $host;
            proxy_set_header Host test-znyd.zgzhongnan.com;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_read_timeout 300s;
            #include proxy_params;
            proxy_pass http://sys-server/;
    }
~~~

</span>
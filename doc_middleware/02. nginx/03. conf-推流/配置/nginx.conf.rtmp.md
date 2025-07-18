<span  style="font-family: Simsun,serif; font-size: 17px; ">

### rtmp -> server -> application

- 后面跟的是推流的地址，如果推流地址错误会报错

~~~
rtmp://localhost:1935/hls/qsmy01: I/O error
~~~

### 示例

~~~nginx.conf
rtmp {
  server {
    #端口
    listen 1935;
    # RTMP 直播流配置
    application rtmplive {
      # 非常重要， 设定让ngnix断开阻塞中的连接， 才能触发exec_record_done
      # 以及客户端的LFLiveKit reconnectCount自动重新连接才会好用
      drop_idle_publisher 5s;
      live on;
    }
    # HLS 直播流配置
    application hls {
      live on;
      record all;
      record_path /tmp;
      record_max_size 10485760K;
      record_unique off;
      record_append on;
      hls on;
      hls_path /tmp;
      hls_fragment 5s;
    }
  }
}
~~~

#### application 优化

- -tune zerolatency：极大降低编码延迟
- -g 30 -keyint_min 30 -sc_threshold 0 -bf 0：保证每秒一个关键帧，减少B帧，提升实时性
- -fflags nobuffer：采集端无缓冲

~~~nginx.conf
        application live {
            live on;
            record off;
            # gop_cache off;    # 关闭GOP缓存，减少延迟
            # drop_idle_publisher 5s; # 及时清理无效推流
            # sync 1ms;         # 尽量同步
            idle_streams off;
            # buflen 10ms;     # 已设置
        }
~~~

</span>
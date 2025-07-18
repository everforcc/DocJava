<span  style="font-family: Simsun,serif; font-size: 17px; ">

- 直播推流
- 需要的时候再看参考文档
- 已测试可用 - [整合ffmpe和nginx的插件,可以直接使用](https://www.jianshu.com/p/d4bc06b9f61e)
- 已测试可用 - [docker-rtmp](https://blog.csdn.net/taoruicheng1/article/details/123074275)
- 未测试 - [cnblogs](https://www.cnblogs.com/cshaptx4869/p/15401279.html)
- 未测试 - [带前端](https://blog.csdn.net/MYNAMEL/article/details/123127912)

### windwos

~~~shell
# 1. 启动nginx
cd live/nginx-1.7.11.3-Gryphon
nginx.exe -c conf\nginx-win-rtmp.conf

# 2. 访问 测试nginx是否启动
127.0.0.1:80

# 3. ffmpeg
# 推送的地址url，需要看nginx里面的配置
# 推送文件流
ffmpeg.exe -re -i E:/live/mp4/01.mp4 -vcodec libx264 -acodec aac -f flv rtmp://127.0.0.1:1935/live/home
# 推送硬件流，参数为硬件名
ffmpeg -f dshow -i video="LHT-820CH" -vcodec libx264 -f flv rtmp://127.0.0.1:1935/live/usb

# 4. 浏览器访问
rtmp://127.0.0.1:1935/live/home
rtmp://127.0.0.1:1935/live/usb
rtmp://192.168.0.158:1935/live/usb
~~~

#### 无显卡

~~~shell
ffmpeg -f dshow -video_size 640x480 -framerate 30 -fflags nobuffer -i video="LHT-820CH" -vcodec libx264 -preset ultrafast -tune zerolatency -g 30 -f flv rtmp://127.0.0.1:1935/live/usb
# cursor
ffmpeg -f dshow -video_size 640x480 -framerate 30 -fflags nobuffer -i video="LHT-820CH" ^
-vcodec libx264 -preset ultrafast -tune zerolatency -g 30 -keyint_min 30 -sc_threshold 0 ^
-bf 0 -f flv rtmp://127.0.0.1:1935/live/usb
~~~

#### 有显卡

~~~shell
ffmpeg -f dshow -video_size 640x480 -framerate 30 -fflags nobuffer -i video="LHT-820CH" -vcodec h264_nvenc -preset llhq -tune lowlatency -g 30 -f flv rtmp://127.0.0.1:1935/live/usb
# cursor
ffmpeg -f dshow -video_size 640x480 -framerate 30 -fflags nobuffer -i video="LHT-820CH" ^
-vcodec h264_nvenc -preset llhp -tune zerolatency -g 30 -bf 0 -f flv rtmp://127.0.0.1:1935/live/usb
~~~

</span>
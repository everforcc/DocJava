# nginx-rtmp-module 使用教程（Windows & Linux）

## 1. 官方地址

- GitHub: https://github.com/arut/nginx-rtmp-module

---

## 2. 下载源码

### 2.1 下载nginx-rtmp-module

```shell
git clone https://github.com/arut/nginx-rtmp-module.git
```

### 2.2 下载nginx源码

- [nginx官方下载页面](https://nginx.org/en/download.html)
- 选择合适版本（建议1.21.x及以上）

```shell
wget http://nginx.org/download/nginx-1.21.6.tar.gz
tar -zxvf nginx-1.21.6.tar.gz
```

---

## 3. 编译nginx并集成rtmp模块

### 3.1 Linux下编译

```shell
cd nginx-1.21.6
./configure --add-module=../nginx-rtmp-module
make
sudo make install
```

- 安装依赖（如未安装）：
  ```shell
  sudo apt-get install build-essential libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev
  ```

### 3.2 Windows下使用

- Windows下官方未提供直接编译方法，推荐使用预编译包：
  - [illuz/nginx-rtmp-win32](https://github.com/illuz/nginx-rtmp-win32/releases)
  - 或在GitHub等第三方下载带rtmp模块的nginx压缩包，解压即可用。
- 若需自行编译，需用MSYS2/MinGW等环境，过程较复杂，建议直接用预编译包。

---

## 4. 配置文件示例（低延迟推流）

在nginx配置文件（如nginx.conf或nginx-win-rtmp.conf）中添加：

```conf
rtmp {
    server {
        listen 1935;
        chunk_size 4096;
        application live {
            live on;
            record off;
            gop_cache off;
            drop_idle_publisher 5s;
            sync 1ms;
            idle_streams off;
            buflen 100ms;
        }
    }
}
```

http块中可加：

```conf
server {
    listen 80;
    location /stat {
        rtmp_stat all;
        rtmp_stat_stylesheet stat.xsl;
    }
    location /stat.xsl {
        root nginx-rtmp-module/;
    }
    location / {
        root html;
        index index.html index.htm;
    }
}
```

---

## 5. 启动nginx

- Linux:
  ```shell
  sudo ./nginx
  # 或
  sudo systemctl start nginx
  ```
- Windows:
  ```shell
  nginx.exe -c conf\nginx-win-rtmp.conf
  ```

---

## 6. ffmpeg推流命令（低延迟）

### 无显卡
```shell
ffmpeg -f dshow -video_size 640x480 -framerate 30 -fflags nobuffer -i video="LHT-820CH" -vcodec libx264 -preset ultrafast -tune zerolatency -g 30 -keyint_min 30 -sc_threshold 0 -bf 0 -f flv rtmp://127.0.0.1:1935/live/usb
ffmpeg -f dshow -video_size 640x480 -framerate 30 -fflags nobuffer -i video="4k Camera" -vcodec libx264 -preset ultrafast -tune zerolatency -g 30 -keyint_min 30 -sc_threshold 0 -bf 0 -f flv rtmp://127.0.0.1:1935/live/usb
```

### 有显卡
```shell
ffmpeg -f dshow -video_size 640x480 -framerate 30 -fflags nobuffer -i video="LHT-820CH" -vcodec h264_nvenc -preset llhp -tune zerolatency -g 30 -bf 0 -f flv rtmp://127.0.0.1:1935/live/usb
```

---

## 7. 常见问题与优化建议

- **延迟高**：确保ffmpeg和nginx配置均已优化，播放器端缓冲设置调低（如VLC设置网络缓存100ms）。
- **Windows建议**：优先用预编译包，避免自行编译的复杂性。
- **推流失败**：检查端口防火墙、nginx是否正常启动、推流URL是否正确。
- **低延迟优化**：
  - ffmpeg加`-tune zerolatency -g 30 -bf 0`等参数
  - nginx rtmp块加`gop_cache off`、`buflen 100ms`等
- **更多参考**：详见[nginx-rtmp-module官方文档](https://github.com/arut/nginx-rtmp-module) 
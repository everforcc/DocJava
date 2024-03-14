# 基础镜像
FROM nginx
# author
MAINTAINER hkzk

# 相对路径
# 复制conf文件到路径 参数一 本地路径 参数二 docker内路径
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
# 复制html文件到路径
COPY ./html /usr/share/nginx/html

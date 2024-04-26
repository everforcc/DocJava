docker build -t trc-nginx-rtmp .
docker images | grep trc-nginx-rtmp
docker run -d -p 1935:1935 -p 1900:8080 -v /Users/taoruicheng/temp:/tmp --privileged=true --name trc-nginx-rtmp trc-nginx-rtmp
docker build -t hardware .
docker run -d --restart=always --name hardware -p 9000:9000 hardware
# FROM  openjdk:8-jre
FROM  eclipse-temurin:17.0.10_7-jdk-centos7
MAINTAINER tuikuan

VOLUME /home/tuikuan
RUN mkdir -p /home/tuikuan
WORKDIR /home/tuikuan
COPY *.jar /home/tuikuan/tuikuan.jar
ENTRYPOINT ["java","-jar","tuikuan.jar"]
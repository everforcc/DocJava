# FROM  openjdk:8-jre
FROM  eclipse-temurin:17.0.10_7-jdk-centos7
MAINTAINER hardware-server-admin

ADD hardware-server-admin.jar hardware.jar
EXPOSE 9000
ENTRYPOINT ["java","-jar","hardware.jar"]
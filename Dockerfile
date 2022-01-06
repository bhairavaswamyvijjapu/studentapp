# FROM java:8
# EXPOSE 8080
# RUN mvn clean install
# ADD /target/studentapp-0.0.1-SNAPSHOT.jar studentapp-0.0.1-SNAPSHOT.jar
# ENTRYPOINT ["java","-jar","studentapp-0.0.1-SNAPSHOT.jar"]


# FROM openjdk:8-jdk-alpine
# EXPOSE 8080
# ARG JAR_FILE=target/*.jar
# COPY ${JAR_FILE} app.jar
# ENTRYPOINT ["java","-jar","/app.jar"]

# ### BUILD image
# FROM maven:3-jdk-11 as builder
# # create app folder for sources
# RUN mkdir -p /build
# WORKDIR /build
# COPY pom.xml /build
# #Download all required dependencies into one layer
# RUN mvn -B dependency:resolve dependency:resolve-plugins
# #Copy source code
# COPY src /build/src
# # Build application
# RUN mvn package



# FROM openjdk:11
# EXPOSE 8080
# COPY /target/studentapp-0.0.1-SNAPSHOT.jar studentapp-0.0.1-SNAPSHOT.jar
# ENTRYPOINT ["java","-jar","studentapp-0.0.1-SNAPSHOT.jar"]

FROM java:8
EXPOSE 8080
MAINTAINER Swamy
# RUN mvn clean install
# RUN apt-get update && apt-get install -y docker.io 267 && rm -rf /var/lib/apt/lists/*
ADD /target/studentapp-0.0.1-SNAPSHOT.jar studentapp-0.0.1-SNAPSHOT.jar
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/ && \
    rm -rf /var/cache/oracle-jdk8-installer;

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME
# COPY /var/jenkins_home/workspace/docker-test/target/studentapp-0.0.1-SNAPSHOT.jar studentapp-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","studentapp-0.0.1-SNAPSHOT.jar"]

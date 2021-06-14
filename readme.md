# Spring PetClinic Sample Application [![Build Status](https://travis-ci.org/spring-projects/spring-petclinic.png?branch=main)](https://travis-ci.org/spring-projects/spring-petclinic/)

## Understanding the Spring Petclinic application with a few diagrams
<a href="https://speakerdeck.com/michaelisvy/spring-petclinic-sample-application">See the presentation here</a>

## Running petclinic locally
Petclinic is a [Spring Boot](https://spring.io/guides/gs/spring-boot) application built using [Maven](https://spring.io/guides/gs/maven/). You can build a jar file and run it from the command line:


```
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic
./mvnw package
java -jar target/*.jar
```

You can then access petclinic here: http://localhost:8080/

In order to build locally, you can use Maven command to build and test by running locally.

Maven compile:

```
mvn clean install
```

Maven Test:
```
mvn test
```


Creating a Dockerfile for Spring Boot Pet clinic application, in order to run inside docker container.

Dockerfile:

```
FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/spring-petclinic-*.jar
COPY ${JAR_FILE} spring-petclinic.jar
ENTRYPOINT ["java","-jar","/spring-petclinic.jar"]
```

In order to build Docker Image locally make sure Docker is installed:
Docker Build command:
```
docker build -t ifaridi79/springboot-petclinic:latest .
```
List docker images:
```
docker images
```
Running docker image locally:
```
docker run -p 8080:8080 ifaridi79/springboot-petclinic:latest
```

Stopping and removing container:
```
docker stop <container_name>
docker rm <container_name>
```

Jenkins will be used as a pipeline to pull the latest source code from Github to compile, test, package as a docker image and then upload this image in DockerHub as an artifact ready to deploy code.

DockerHub Registry: ifaridi79/springboot-petclinic

In order to pull the latest image or specific tag image
```
docker pull ifaridi79/springboot-petclinic:<BUILD_NUMBER>
```
Jenkinsfile being used as a declarative pipeline as code, defined upto 5 stages:
1. Compile
2. Test
3. Package Docker Image
4. Upload Artifacts
5. Clean Up

Make sure to configure credential Id for Docker Hub in Jenkins and configure tools like Maven and JDK in Jenkins.

```
   tools { 
        maven 'Maven 3.8.1' 
        jdk 'jdk9' 
    }
```

For executing Docker command on Jenkins make sure Docker Node is up and running configured properly.




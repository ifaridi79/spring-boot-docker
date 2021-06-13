FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/spring-petclinic-*.jar
COPY ${JAR_FILE} spring-petclinic.jar
ENTRYPOINT ["java","-jar","/spring-petclinic.jar"]
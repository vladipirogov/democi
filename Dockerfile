FROM openjdk:8-jdk-alpine
EXPOSE 8080 5005 8443
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} /app.jar
ENV _JAVA_OPTIONS '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005'
ENTRYPOINT ["java","-jar","/app.jar"]
FROM openjdk:18-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY target/discovery-server-1.0-SNAPSHOT.jar /app.jar
RUN apk add --no-cache bash
ENTRYPOINT ["java", "-jar"]
CMD ["/app.jar"]

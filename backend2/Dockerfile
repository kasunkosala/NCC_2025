# Dockerfile for backend2 (Node.js/Java)
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY . .
RUN ./mvnw package || mvn package
EXPOSE 8080
CMD ["java", "-jar", "target/demo-0.0.1-SNAPSHOT.jar"]

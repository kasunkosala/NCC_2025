# Stage 1: Build with Maven
FROM maven:3.9.1-eclipse-temurin-17 AS build
WORKDIR /app

# Copy pom.xml and download dependencies
COPY backend2/pom.xml .
RUN mvn -B dependency:go-offline

# Copy source code
COPY backend2/src ./src
RUN mvn -B -DskipTests package

# Stage 2: Run with JDK 21
FROM openjdk:21-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

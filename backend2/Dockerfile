# Stage 1: Build the application
# We use a Maven image to build the Spring Boot application
FROM maven:3.8.3-openjdk AS build
WORKDIR /app

# Copy the project files
# First, copy the pom.xml to download dependencies. This leverages Docker's layer caching.
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy the source code
COPY src ./src

# Package the application into a runnable JAR file, skipping tests for faster build
RUN mvn package -DskipTests

# Stage 2: Create the final, production-ready image
# We use a smaller OpenJDK JRE image for the final container

FROM openjdk
WORKDIR /app

# Copy the JAR file from the 'build' stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port your application listens on
EXPOSE 5000

# Run the application when the container starts
CMD ["java", "-jar", "app.jar"]
# Use a small JRE image to run the jar you built locally
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY target/app.jar /app/app.jar
EXPOSE 8096
ENTRYPOINT ["java","-jar","/app/app.jar"]

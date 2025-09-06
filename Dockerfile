FROM eclipse-temurin:17-jdk-alpine
COPY HelloWorld.java .
RUN javac HelloWorld.java
CMD ["java", "HelloWorld"]
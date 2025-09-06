FROM openjdk:17-jdk-alpine
COPY . /app
WORKDIR /app
RUN javac HelloWorld.java
CMD ["java", "HelloWorld"]
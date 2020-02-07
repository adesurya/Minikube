FROM openjdk:8-jdk-alpine
ENV PORT 5000
EXPOSE 5000
COPY target/HelloWorld-0.0.1-SNAPSHOT.jar /opt/HelloWorld-0.0.1-SNAPSHOT.jar
WORKDIR /opt
CMD ["java", "-jar", "HelloWorld-0.0.1-SNAPSHOT.jar"]

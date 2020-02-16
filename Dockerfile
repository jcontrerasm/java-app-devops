FROM openjdk:8-jre-alpine

COPY target/java-app.jar java-app.jar

EXPOSE 8000

ENTRYPOINT ["java", "-jar", "java-app.jar"]

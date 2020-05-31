FROM openjdk:8-jdk-alpine

RUN addgroup -S spring && adduser -S spring -G spring

USER spring:spring

ARG DEPENDENCY=target/dependency

COPY demo/${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY demo/${DEPENDENCY}/META-INF /app/META-INF
COPY demo/${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT [ "java", "-cp", "app:app/lib/*", "com.walk2walk.demo.DemoApplication" ]
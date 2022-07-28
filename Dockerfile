# syntax=docker/dockerfile:1
FROM maven:3-openjdk-8 AS builder
RUN mvn -f myservice install

FROM eclipse-temurin:8
WORKDIR /root/
COPY --from=builder /repo/myservice/target/myservice-1.0-SNAPSHOT.jar ./
CMD ["java -classpath myservice-1.0-SNAPSHOT.jar com.mattzink.App"]

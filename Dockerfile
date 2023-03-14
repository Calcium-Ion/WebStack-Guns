FROM adoptopenjdk/maven-openjdk8:latest as builder
COPY . /app
WORKDIR /app

RUN mvn clean install -DskipTests

FROM adoptopenjdk/openjdk8:alpine-jre
RUN mkdir /app
COPY --from=builder /app/target/Webstack-Guns-1.0.jar /app
WORKDIR /app

EXPOSE 8000

CMD ["java", "-jar", "Webstack-Guns-1.0.jar"]

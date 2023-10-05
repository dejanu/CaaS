FROM maven:3.8.6-openjdk-18-slim AS build
WORKDIR /app
COPY . .
RUN mvn package -DskipTests

FROM openjdk:20
WORKDIR /app
COPY --from=build /app/target/hello-api-*.jar hello-api.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","hello-api.jar"]
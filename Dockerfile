FROM maven:3.9.12-eclipse-temurin-25 AS builder
 
WORKDIR /app
 
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
RUN ./mvnw dependency:go-offline -q
 
COPY src ./src
RUN ./mvnw clean package -DskipTests -q
 
FROM eclipse-temurin:25.0.2_10-jre AS runtime
 
WORKDIR /app
 
RUN addgroup --system clinic && adduser --system --ingroup clinic clinic
USER clinic
 
COPY --from=builder /app/target/*.jar app.jar
 
EXPOSE 8080
 
ENTRYPOINT ["java", "-jar", "app.jar"]
 
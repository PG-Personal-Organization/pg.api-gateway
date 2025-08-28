# ---- Build stage ----
FROM maven:3.9.9-eclipse-temurin-21 AS builder
WORKDIR /app

# Make Maven use your GitHub repos from settings.xml
COPY settings.xml /root/.m2/settings.xml

# Copy project sources
COPY . .

# Build (skip tests for speed)
RUN mvn -B clean package -DskipTests

# ---- Runtime stage ----
FROM eclipse-temurin:21-jre
WORKDIR /app

# Adjust JAR path if needed
ARG JAR_FILE=target/*.jar
COPY --from=builder /app/${JAR_FILE} /app/app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]

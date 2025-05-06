# 🏗️ Stage 1: Build the app using Maven
FROM maven:3.9.4-eclipse-temurin-17 AS builder

# Set working directory
WORKDIR /app

# Copy Maven files first (for Docker layer caching)
COPY pom.xml .
COPY src ./src

# Run Maven build to create the JAR
RUN mvn clean package -DskipTests


# 🚀 Stage 2: Run the app using a lightweight JDK
FROM eclipse-temurin:17-jdk

# Set working directory in runtime container
WORKDIR /app

# Copy the JAR file from the builder container
COPY --from=builder /app/target/*.jar app.jar

# Expose the app port (optional)
EXPOSE 8080

# Command to run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
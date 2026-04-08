# Single stage build: everything happens in one image
FROM maven:3.9.0-eclipse-temurin-11

WORKDIR /app

# Copy pom.xml
COPY pom.xml .

# Download dependencies
RUN mvn dependency:resolve

# Copy source code
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Expose port 8080
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080/api/health || exit 1

# Run the application directly from the target folder
ENTRYPOINT ["java", "-jar", "target/java-app-1.0.0.jar"]
CMD ["--server.port=8080"]

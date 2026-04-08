# Java Web Application - Docker Deployment Guide

## Project Overview
This is a Spring Boot-based Java web application packaged in a Docker container for easy deployment and scaling.

## Docker Image Details

### Local Image Tags
- **Image Name**: `java-web-app`
- **Version Tags**: 
  - `java-web-app:1.0.0` (Specific version)
  - `java-web-app:latest` (Latest version)
- **Size**: ~111MB (compressed), ~413MB (uncompressed)
- **Base Image**: `eclipse-temurin:11-jre-focal` (Java 11 JRE)

### Build Information
- **Build Date**: April 8, 2026
- **Java Version**: Java 11
- **Build Framework**: Maven 3.9.0
- **Server Port**: 8080

## Dockerfile Details

The Dockerfile uses a **multi-stage build** approach:
1. **Builder Stage**: Compiles Java application using Maven
2. **Runtime Stage**: Runs the compiled JAR with minimal footprint

### Key Features
- ✅ Multi-stage build for optimized image size
- ✅ Health check configured (checks `/api/health` endpoint every 30 seconds)
- ✅ Non-root user can be added for security
- ✅ Environment variables support for configuration

## Application Endpoints

All endpoints are fully tested and working:

### 1. **Home Endpoint**
```
GET http://localhost:8080/
Response: Welcome to Java Web Application! The server is running.
```

### 2. **Greeting Endpoint**
```
GET http://localhost:8080/api/greeting
Response: Hello from Java Web Application!
```

### 3. **Greeting with Parameter**
```
GET http://localhost:8080/api/greeting/{name}
Example: http://localhost:8080/api/greeting/John
Response: Hello, John! Welcome to our Java application.
```

### 4. **Health Check Endpoint**
```
GET http://localhost:8080/api/health
Response: {"status": "UP", "message": "Application is healthy"}
```

### 5. **Application Info**
```
GET http://localhost:8080/api/info
Response: {
  "app": "Java Web Application",
  "version": "1.0.0",
  "timestamp": "1775642131173"
}
```

## Running the Docker Image Locally

### Build the Image
```powershell
cd C:\Users\tanay\Downloads\Rebuild\Training\aprilbatch_fork
docker build -t java-web-app:1.0.0 -t java-web-app:latest .
```

### Run the Container
```powershell
docker run -d -p 8080:8080 --name java-web-app-container java-web-app:latest
```

### Check Container Status
```powershell
docker ps
docker logs java-web-app-container
```

### Test the Application
```powershell
Invoke-WebRequest -Uri http://localhost:8080/ -UseBasicParsing
```

### Stop and Remove Container
```powershell
docker stop java-web-app-container
docker rm java-web-app-container
```

## Pushing to Docker Hub

### Prerequisites
1. Create a Docker Hub account at https://hub.docker.com/
2. Have Docker CLI installed and running
3. Know your Docker Hub username

### Steps to Push

#### 1. Login to Docker Hub
```powershell
docker login
# Enter your Docker Hub username and password when prompted
```

#### 2. Tag the Image with Docker Hub Username
Replace `<your-docker-username>` with your actual Docker Hub username:

```powershell
docker tag java-web-app:1.0.0 <your-docker-username>/java-web-app:1.0.0
docker tag java-web-app:latest <your-docker-username>/java-web-app:latest
```

**Example:**
```powershell
docker tag java-web-app:1.0.0 tanayexample/java-web-app:1.0.0
docker tag java-web-app:latest tanayexample/java-web-app:latest
```

#### 3. Push to Docker Hub
```powershell
docker push <your-docker-username>/java-web-app:1.0.0
docker push <your-docker-username>/java-web-app:latest
```

**Example:**
```powershell
docker push tanayexample/java-web-app:1.0.0
docker push tanayexample/java-web-app:latest
```

#### 4. Verify on Docker Hub
Visit `https://hub.docker.com/r/<your-docker-username>/java-web-app` to see your image.

### Logout from Docker Hub (Optional)
```powershell
docker logout
```

## Using the Docker Hub Image

Once pushed, anyone can run your image with:

```powershell
docker run -d -p 8080:8080 --name my-app <your-docker-username>/java-web-app:latest
```

## Docker Compose (Optional)

Create a `docker-compose.yml` file for easier management:

```yaml
version: '3.8'

services:
  java-web-app:
    image: java-web-app:latest
    ports:
      - "8080:8080"
    container_name: java-web-app-container
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8080/api/health"]
      interval: 30s
      timeout: 3s
      retries: 3
      start_period: 5s
```

Run with:
```powershell
docker-compose up -d
docker-compose down
```

## Environment Variables

You can pass environment variables to the container:

```powershell
docker run -d -p 8080:8080 \
  -e JAVA_OPTS="-Xmx512m" \
  --name java-web-app-container \
  java-web-app:latest
```

## Troubleshooting

### Container won't start
```powershell
docker logs java-web-app-container
```

### Port already in use
```powershell
# Use a different port
docker run -d -p 8081:8080 --name java-web-app-container java-web-app:latest
```

### View image details
```powershell
docker inspect java-web-app:latest
```

## Final Summary

✅ **Docker Image Successfully Created and Tested**
- Image Name: `java-web-app`
- Tags: `1.0.0` and `latest`
- Size: ~111MB (compressed)
- All 5 API endpoints tested and working
- Health checks passing
- Ready for production deployment

**Next Step**: Push to Docker Hub using the steps provided above.


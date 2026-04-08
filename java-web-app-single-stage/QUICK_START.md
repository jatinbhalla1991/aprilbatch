# Quick Start Guide - Java Web App Docker Image

## 📦 What You Have

A fully built Docker image ready to run:
- **Image Name**: `java-web-app`
- **Tags**: `1.0.0` and `latest`
- **Size**: ~111MB
- **Status**: ✅ Tested and working

## 🚀 Quick Start (5 minutes)

### 1. Navigate to the Docker Directory
```powershell
cd java-web-app-docker
```

### 2. Run the Container
```powershell
docker run -d -p 8080:8080 --name myapp java-web-app:latest
```

### 3. Test It Works
```powershell
Invoke-WebRequest http://localhost:8080/ -UseBasicParsing
# Should return: "Welcome to Java Web Application! The server is running."
```

### 4. Stop the Container
```powershell
docker stop myapp
docker rm myapp
```

---

## 🐳 Push to Docker Hub (5 minutes)

### Prerequisites
- Docker Hub account (https://hub.docker.com/)
- Docker Desktop installed and running

### Steps
```powershell
# Step 1: Login
docker login

# Step 2: Tag your image with your username
docker tag java-web-app:1.0.0 YOUR_USERNAME/java-web-app:1.0.0
docker tag java-web-app:latest YOUR_USERNAME/java-web-app:latest

# Step 3: Push to Docker Hub
docker push YOUR_USERNAME/java-web-app:1.0.0
docker push YOUR_USERNAME/java-web-app:latest
```

**Result**: Image available at `https://hub.docker.com/r/YOUR_USERNAME/java-web-app`

---

## 📋 Available Endpoints

| Endpoint | Method | Response |
|----------|--------|----------|
| `/` | GET | Welcome message |
| `/api/greeting` | GET | Generic greeting |
| `/api/greeting/{name}` | GET | Personalized greeting |
| `/api/health` | GET | Health status (JSON) |
| `/api/info` | GET | App information (JSON) |

### Test Examples
```powershell
# Home page
http://localhost:8080/

# Say hello to John
http://localhost:8080/api/greeting/John

# Check health
http://localhost:8080/api/health

# Get app info
http://localhost:8080/api/info
```

---

## 🔧 Useful Commands

```powershell
# View all your images
docker images

# See running containers
docker ps

# View container logs
docker logs myapp

# View detailed container info
docker inspect myapp

# Stop and remove container
docker stop myapp
docker rm myapp

# View resource usage
docker stats

# Remove image
docker rmi java-web-app:latest
```

---

## 💡 Tips

- **Use a different port?** `docker run -d -p 9000:8080 java-web-app:latest`
  - Access at http://localhost:9000

- **Run in foreground?** Remove `-d` flag: `docker run -p 8080:8080 java-web-app:latest`

- **Keep container after stop?** Use `docker rename` to keep it for restart

- **Save logs?** `docker logs myapp > app.log`

---

## ✅ What's Next?

1. **Option A**: Keep image locally
   - Use for development/testing
   - Ideal for containers on your machine

2. **Option B**: Push to Docker Hub
   - Share with team members
   - Deploy to production servers
   - Collaborate on image updates

3. **Option C**: Use with Docker Compose
   - Multi-container applications
   - Service orchestration
   - Environment management

---

## 📞 Need Help?

Check the full guides:
- **DOCKER_DEPLOYMENT_GUIDE.md** - Detailed deployment guide
- **DOCKER_BUILD_SUMMARY.md** - Complete summary with all details

Or view the Dockerfile to understand the build process.

---

**Status**: ✅ Ready to use
**Last Updated**: April 8, 2026


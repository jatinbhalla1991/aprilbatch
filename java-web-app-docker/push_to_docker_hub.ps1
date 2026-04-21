# ============================================================
# Java Web App - Push to Docker Hub Script (PowerShell)
# ============================================================
# This script helps you push your Docker image to Docker Hub
# ============================================================

# Set your Docker Hub username here
$DOCKER_USERNAME = ""

# Check if username is provided as parameter
if ($args.Count -gt 0) {
    $DOCKER_USERNAME = $args[0]
}

# If still not set, prompt user
if ([string]::IsNullOrWhiteSpace($DOCKER_USERNAME)) {
    Write-Host ""
    Write-Host "============================================================" -ForegroundColor Yellow
    Write-Host "ERROR: Docker username not provided!" -ForegroundColor Red
    Write-Host "============================================================" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Usage:" -ForegroundColor Cyan
    Write-Host "  .\push_to_docker_hub.ps1 <your_docker_username>" -ForegroundColor Green
    Write-Host ""
    Write-Host "Or edit this script and set: `$DOCKER_USERNAME = 'your_username'" -ForegroundColor Green
    Write-Host ""
    exit 1
}

Write-Host ""
Write-Host "============================================================" -ForegroundColor Green
Write-Host "Java Web App - Docker Hub Push Script" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Green
Write-Host "Docker Username: $DOCKER_USERNAME" -ForegroundColor Cyan
Write-Host ""

# Step 1: Login to Docker Hub
Write-Host "[Step 1/4] Logging into Docker Hub..." -ForegroundColor Yellow
docker login
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to login to Docker Hub" -ForegroundColor Red
    exit 1
}

# Step 2: Tag the image
Write-Host ""
Write-Host "[Step 2/4] Tagging image as $DOCKER_USERNAME/java-web-app..." -ForegroundColor Yellow
docker tag java-web-app:1.0.0 "$DOCKER_USERNAME/java-web-app:1.0.0"
docker tag java-web-app:latest "$DOCKER_USERNAME/java-web-app:latest"

if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to tag image" -ForegroundColor Red
    exit 1
}

# Step 3: Push to Docker Hub
Write-Host ""
Write-Host "[Step 3/4] Pushing image to Docker Hub..." -ForegroundColor Yellow

Write-Host "Pushing version tag (1.0.0)..." -ForegroundColor Cyan
docker push "$DOCKER_USERNAME/java-web-app:1.0.0"
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to push version tag" -ForegroundColor Red
    exit 1
}

Write-Host "Pushing latest tag..." -ForegroundColor Cyan
docker push "$DOCKER_USERNAME/java-web-app:latest"
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to push latest tag" -ForegroundColor Red
    exit 1
}

# Step 4: Verify
Write-Host ""
Write-Host "[Step 4/4] Verification..." -ForegroundColor Yellow
docker images "$DOCKER_USERNAME/java-web-app"

Write-Host ""
Write-Host "============================================================" -ForegroundColor Green
Write-Host "SUCCESS! Image pushed to Docker Hub" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Your image is now available at:" -ForegroundColor Cyan
Write-Host "  https://hub.docker.com/r/$DOCKER_USERNAME/java-web-app" -ForegroundColor Green
Write-Host ""
Write-Host "To pull the image:" -ForegroundColor Cyan
Write-Host "  docker pull $DOCKER_USERNAME/java-web-app:latest" -ForegroundColor Green
Write-Host ""
Write-Host "To run the image:" -ForegroundColor Cyan
Write-Host "  docker run -d -p 8080:8080 $DOCKER_USERNAME/java-web-app:latest" -ForegroundColor Green
Write-Host ""


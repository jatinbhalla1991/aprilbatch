@echo off
REM ============================================================
REM Java Web App - Push to Docker Hub Script
REM ============================================================
REM This script helps you push your Docker image to Docker Hub
REM ============================================================

setlocal enabledelayedexpansion

REM Set your Docker Hub username here
set DOCKER_USERNAME=

if "%DOCKER_USERNAME%"=="" (
    echo.
    echo ============================================================
    echo ERROR: DOCKER_USERNAME is not set!
    echo ============================================================
    echo.
    echo Please edit this script and set your Docker Hub username:
    echo   set DOCKER_USERNAME=your_docker_username
    echo.
    echo Or provide it as an argument:
    echo   push_to_docker_hub.bat your_docker_username
    echo.
    pause
    exit /b 1
)

if not "%1%"=="" (
    set DOCKER_USERNAME=%1%
)

echo.
echo ============================================================
echo Java Web App - Docker Hub Push Script
echo ============================================================
echo Docker Username: %DOCKER_USERNAME%
echo.

REM Step 1: Login to Docker Hub
echo [Step 1/4] Logging into Docker Hub...
docker login
if errorlevel 1 (
    echo ERROR: Failed to login to Docker Hub
    pause
    exit /b 1
)

REM Step 2: Tag the image
echo.
echo [Step 2/4] Tagging image as %DOCKER_USERNAME%/java-web-app...
docker tag java-web-app:1.0.0 %DOCKER_USERNAME%/java-web-app:1.0.0
docker tag java-web-app:latest %DOCKER_USERNAME%/java-web-app:latest

REM Step 3: Push to Docker Hub
echo.
echo [Step 3/4] Pushing image to Docker Hub...
docker push %DOCKER_USERNAME%/java-web-app:1.0.0
if errorlevel 1 (
    echo ERROR: Failed to push version tag
    pause
    exit /b 1
)

docker push %DOCKER_USERNAME%/java-web-app:latest
if errorlevel 1 (
    echo ERROR: Failed to push latest tag
    pause
    exit /b 1
)

REM Step 4: Verify
echo.
echo [Step 4/4] Verification...
docker images %DOCKER_USERNAME%/java-web-app

echo.
echo ============================================================
echo SUCCESS! Image pushed to Docker Hub
echo ============================================================
echo.
echo Your image is now available at:
echo   https://hub.docker.com/r/%DOCKER_USERNAME%/java-web-app
echo.
echo To pull the image:
echo   docker pull %DOCKER_USERNAME%/java-web-app:latest
echo.
echo To run the image:
echo   docker run -d -p 8080:8080 %DOCKER_USERNAME%/java-web-app:latest
echo.
pause


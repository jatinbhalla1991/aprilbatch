# CI/CD Pipeline Guide

This document explains exactly how our automated GitHub Actions workflow (`.github/workflows/docker-ci-cd.yml`) operates.

Every time code is pushed to the target branches (`main` or `assignment3`), GitHub spins up an isolated Ubuntu Linux virtual machine in the cloud to execute this pipeline.

### 1. Triggers (`on:`)
```yaml
on:
  push:
    branches: [ "main", "assignment3" ]
  workflow_dispatch:
```
* **`push`**: The pipeline runs automatically anytime someone pushes code to the `main` or `assignment3` branches. It ignores pushes to any other branch.
* **`workflow_dispatch`**: This creates a manual "Run workflow" button in the GitHub Actions UI, allowing you to trigger the pipeline at will.

### 2. The Environment Setup
```yaml
runs-on: ubuntu-latest
defaults:
  run:
    working-directory: ./java-web-app-docker
```
* **`runs-on`**: Provisions a fresh, empty Ubuntu Linux runner.
* **`working-directory`**: Ensures that all run commands execute inside the `java-web-app-docker` directory where the application code lives.

### 3. Fetching Code & Java Setup
```yaml
- uses: actions/checkout@v4
- uses: actions/setup-java@v4
```
* **`checkout@v4`**: Clones the GitHub repository into the empty Ubuntu runner.
* **`setup-java@v4`**: Installs Java 11 and sets up the Maven environment required to compile the code.

### 4. Compiling the Code & Storing Artifacts
```yaml
- run: mvn clean package -DskipTests
- uses: actions/upload-artifact@v4
```
* **Compiling**: Maven reads `pom.xml`, downloads dependencies, and compiles the raw Java code into an executable `.jar` file.
* **Artifact Upload**: The generated `.jar` file is uploaded back to GitHub. You can download this executable from the bottom of the Actions summary page for up to 30 days.

### 5. Docker Authentication
```yaml
- name: Log in to Docker Hub
  uses: docker/login-action@v3
```
* Using your repository secrets (`DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN`), this step logs into Docker Hub to gain written permission to push your new image to your account.

### 6. Dynamic Docker Metadata & Tagging
```yaml
uses: docker/metadata-action@v5
```
* Strategically generates labels and tags for the Docker image. 
* Most importantly, it binds the `latest` tag but also creates a unique tag based on the Git commit SHA (e.g., `sha-a1b2c3d`). This creates an audit trail, making rollbacks effortless by linking deployments back to exact Git commits.

### 7. Build and Upload
```yaml
uses: docker/build-push-action@v5
```
* **The build**: Points to the `Dockerfile` in the project, automatically taking advantage of our multi-stage Docker setup.
* **The push**: Mounts the tags generated in the prior step to the finished image, and uploads the final container image to Docker Hub securely.

Following completion, the temporary Ubuntu cloud machine is destroyed.

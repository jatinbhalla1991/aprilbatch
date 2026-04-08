# Docker Multi-Stage vs Single-Stage Comparison

This document details the Docker image size comparison between single-stage and multi-stage builds using the Java web application as a reference.

### 📊 Image Size Breakdown

| Build Type | Directory | Image Tag Name | Image Size |
| :--- | :--- | :--- | :--- |
| **Multi-Stage** | `java-web-app-docker/` | `java-app-multi-stage` | **413 MB** |
| **Single-Stage** | `java-web-app-single-stage/` | `java-app-single-stage` | **967 MB** |

### 🛠️ Why is there such a massive difference?

#### 1. Single-Stage Build (`967 MB`)
- **How it works:** Everything happens in a single container. The code is compiled and run inside the same environment.
- **The Catch:** The base image used is `maven:3.9.0-eclipse-temurin-11`. This image contains a massive amount of tooling required to *compile* Java applications (Maven CLI, JDK, compilers, test frameworks, etc).
- **Result:** After the app is built, all of these build tools remain baked into the final image, bloating its size permanently.

#### 2. Multi-Stage Build (`413 MB`)
- **How it works:** The process is split into two "stages":
  1. **Builder Stage:** Uses the heavy `maven:3.9.0-eclipse-temurin-11` image to download dependencies and compile the code into a `.jar` file.
  2. **Runtime Stage:** Starts fresh with a lightweight `eclipse-temurin:11-jre-focal` image (containing *only* the JRE, not the full JDK/Maven stack). It simply copies the compiled `.jar` from the first stage and runs it.
- **Result:** Since the runtime image does not contain the Maven build tools, compilers, or source code, the image size is drastically reduced by more than half.

### 💡 Best Practices and Benefits
- **Smaller Images:** Lead to faster container startup times, quicker image pull/push speeds, and reduced cloud storage costs.
- **Security:** Multi-stage builds have a significantly smaller attack surface. Without build-tools (like compilers or package managers) left in the final image, malicious actors who compromise the container have fewer tools to exploit the system.
- **Cleanliness:** Multi-stage separates the build environment entirely from the runtime environment.

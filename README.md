# Java Application with GitHub Actions

This is a simple Java application that demonstrates how to build a JAR package using Maven and automatically upload it as a GitHub artifact using GitHub Actions.

## Project Structure

```
aprilbatch/
├── .github/
│   └── workflows/
│       └── build.yml          # GitHub Actions workflow with SonarCloud
├── src/
│   └── main/
│       └── java/
│           └── com/
│               └── example/
│                   └── app/
│                       ├── App.java         # Main application
│                       └── Calculator.java  # Calculator with duplicates
├── pom.xml                    # Maven configuration
├── sonar-project.properties   # SonarCloud configuration
├── DUPLICATION-GUIDE.md       # Guide to intentional duplications
└── .gitignore                 # Git ignore rules
```

## Prerequisites

- Java 11 or higher
- Maven 3.6 or higher

## Building Locally

To build the JAR package on your local machine:

```bash
mvn clean package
```

The JAR file will be created in the `target/` directory as `java-app-1.0.0.jar`.

## Running the Application

After building, run the application with:

```bash
java -jar target/java-app-1.0.0.jar
```

You can also pass arguments:

```bash
java -jar target/java-app-1.0.0.jar arg1 arg2
```

## GitHub Actions Workflow

The workflow (`.github/workflows/build.yml`) automatically:

1. **Triggers on**:
   - Push to `main` or `master` branch
   - Pull requests to `main` or `master` branch
   - Manual workflow dispatch

2. **Build Steps**:
   - Checks out the code
   - Sets up JDK 11
   - Builds the project with Maven
   - **Runs SonarCloud code scanning** (detects duplications, code smells, bugs)
   - Uploads the JAR as a GitHub artifact
   - Displays artifact information

## Code Quality Scanning with SonarCloud

This project includes **intentional code duplications** to demonstrate code quality scanning.

### What Gets Scanned:

- **Code Duplications**: Detects duplicate code blocks across files
- **Code Smells**: Identifies maintainability issues
- **Bugs**: Finds potential bugs
- **Security Vulnerabilities**: Checks for security issues
- **Code Coverage**: Measures test coverage (if tests exist)

### Viewing Scan Results:

1. After pushing to GitHub, the workflow runs automatically
2. Visit your SonarCloud dashboard: `https://sonarcloud.io/project/overview?id=jatinbhalla1991_aprildemo`
3. Check these tabs:
   - **Duplications**: See duplicated code blocks
   - **Code Smells**: Review maintainability issues
   - **Issues**: View all detected problems

### Intentional Duplications:

This codebase contains **intentional duplicate code** for testing purposes:

- **App.java**: Three methods (`processUserData`, `processEmployeeData`, `processCustomerData`) with identical logic
- **App.java**: Two calculation methods (`calculateTotal`, `calculateSum`) with same logic
- **Calculator.java**: Multiple duplicate methods for addition, multiplication, and validation

See [DUPLICATION-GUIDE.md](DUPLICATION-GUIDE.md) for detailed information about the duplications and how to fix them.

### Running SonarCloud Locally:

```bash
mvn clean verify sonar:sonar -Dsonar.token=YOUR_SONAR_TOKEN
```

## Downloading the Artifact

After the workflow runs successfully:

1. Go to your repository on GitHub
2. Click on the "Actions" tab
3. Select the latest workflow run
4. Scroll down to the "Artifacts" section
5. Download the `java-app-jar` artifact

The artifact will be retained for 30 days.

## Customization

- **Change Java version**: Update the version in `pom.xml` and `.github/workflows/build.yml`
- **Change artifact name**: Modify the `name` field in the `upload-artifact` step
- **Change retention period**: Modify the `retention-days` field (1-90 days)
- **Add dependencies**: Add them to the `<dependencies>` section in `pom.xml`

## License

This project is provided as-is for educational purposes.
# Code Duplication Examples

This document explains the intentional code duplications added to this project for testing code scanning tools like SonarCloud.

## Duplicate Code Blocks in App.java

### Methods with Duplicate Logic:
1. **processUserData()** - Lines ~32-45
2. **processEmployeeData()** - Lines ~48-61  
3. **processCustomerData()** - Lines ~64-77

These three methods contain identical logic for processing person data. They should be refactored into a single method.

### Duplicate Calculation Methods:
4. **calculateTotal()** - Lines ~80-88
5. **calculateSum()** - Lines ~91-99

Both methods perform the same addition operation.

## Duplicate Code Blocks in Calculator.java

### Addition Methods:
1. **addNumbers()** - Duplicate addition logic
2. **sumValues()** - Same logic as addNumbers()

### Multiplication Methods:
3. **multiplyNumbers()** - Multiplication via loop
4. **calculateProduct()** - Same multiplication logic

### Validation Methods:
5. **validatePositive()** - Checks if number is positive
6. **checkPositive()** - Same validation
7. **isPositiveNumber()** - Same validation again

## Expected SonarCloud Findings

When you run the code scan, SonarCloud should detect:

- **High code duplication** (multiple blocks with >90% similarity)
- **Code smells** related to duplicate code
- **Maintainability issues**
- **Suggestions to refactor** into common methods

## How to Fix (Refactoring Guidelines)

### Example Refactoring for processXXXData methods:

```java
// Instead of 3 separate methods, create one:
public static void processData(String name, int age, String role, String type) {
    System.out.println("Processing " + type + " data...");
    System.out.println("Name: " + name);
    System.out.println("Age: " + age);
    System.out.println("Role: " + role);
    
    if (age > 18) {
        System.out.println("Adult user");
    } else {
        System.out.println("Minor user");
    }
    
    System.out.println("Data validation completed");
    System.out.println("Saving to database...");
    System.out.println("Record saved successfully");
    System.out.println("---");
}
```

## Viewing SonarCloud Results

1. Push your code to GitHub
2. The GitHub Actions workflow will automatically run SonarCloud scan
3. Visit: https://sonarcloud.io/project/overview?id=jatinbhalla1991_aprildemo
4. Check the "Code Smells" and "Duplications" tabs
5. Review the detailed duplication report

## Purpose

These duplications are intentional for:
- Demonstrating code quality scanning
- Learning about code duplication detection
- Understanding refactoring principles
- Testing CI/CD quality gates

package com.example.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

/**
 * Spring Boot Web Application
 */
@SpringBootApplication
@RestController
public class App {
    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
        System.out.println("Application started successfully!");
    }

    @GetMapping("/")
    public String home() {
        return "Welcome to Java Web Application! The server is running.";
    }

    @GetMapping("/api/greeting")
    public String greeting() {
        return "Hello from Java Web Application!";
    }

    @GetMapping("/api/greeting/{name}")
    public String greetingWithName(@PathVariable String name) {
        return "Hello, " + name + "! Welcome to our Java application.";
    }

    @GetMapping("/api/health")
    public String health() {
        return "{\"status\": \"UP\", \"message\": \"Application is healthy\"}";
    }

    @GetMapping("/api/info")
    public String info() {
        return "{\n" +
                "  \"app\": \"Java Web Application\",\n" +
                "  \"version\": \"1.0.0\",\n" +
                "  \"timestamp\": \"" + System.currentTimeMillis() + "\"\n" +
                "}";
    }
    
    // DUPLICATE CODE BLOCK 1 - Intentional duplication
    public static void processUserData(String name, int age, String role) {
        System.out.println("Processing data...");
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
    
    // DUPLICATE CODE BLOCK 2 - Same logic as processUserData
    public static void processEmployeeData(String name, int age, String role) {
        System.out.println("Processing data...");
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
    
    // DUPLICATE CODE BLOCK 3 - Same logic again
    public static void processCustomerData(String name, int age, String role) {
        System.out.println("Processing data...");
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
    
    // DUPLICATE CODE BLOCK 4 - Duplicate calculation logic
    public static int calculateTotal(int a, int b) {
        int result = 0;
        result = a + b;
        System.out.println("Calculating total...");
        System.out.println("First number: " + a);
        System.out.println("Second number: " + b);
        System.out.println("Result: " + result);
        return result;
    }
    
    // DUPLICATE CODE BLOCK 5 - Same calculation logic
    public static int calculateSum(int a, int b) {
        int result = 0;
        result = a + b;
        System.out.println("Calculating total...");
        System.out.println("First number: " + a);
        System.out.println("Second number: " + b);
        System.out.println("Result: " + result);
        return result;
    }
}

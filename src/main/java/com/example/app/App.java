package com.example.app;

/**
 * Simple Java Application with Intentional Code Duplication for Testing
 */
public class App {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
        System.out.println("This is a sample Java application");
        
        // Testing different features
        processUserData("John", 25, "Engineer");
        processEmployeeData("Jane", 30, "Manager");
        processCustomerData("Bob", 35, "Client");
        
        calculateTotal(100, 200);
        calculateSum(150, 250);
        
        if (args.length > 0) {
            System.out.println("Arguments received:");
            for (int i = 0; i < args.length; i++) {
                System.out.println("  Arg " + i + ": " + args[i]);
            }
        }
        
        System.out.println("Application completed successfully!");
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

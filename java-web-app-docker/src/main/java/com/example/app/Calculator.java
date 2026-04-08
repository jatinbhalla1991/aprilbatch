package com.example.app;

/**
 * Calculator class with more duplicate code examples
 */
public class Calculator {
    
    // DUPLICATE BLOCK 1
    public int addNumbers(int x, int y) {
        int sum = 0;
        sum = x + y;
        System.out.println("Addition operation");
        System.out.println("First value: " + x);
        System.out.println("Second value: " + y);
        System.out.println("Total: " + sum);
        return sum;
    }
    
    // DUPLICATE BLOCK 2 - Similar to addNumbers
    public int sumValues(int x, int y) {
        int sum = 0;
        sum = x + y;
        System.out.println("Addition operation");
        System.out.println("First value: " + x);
        System.out.println("Second value: " + y);
        System.out.println("Total: " + sum);
        return sum;
    }
    
    // DUPLICATE BLOCK 3
    public int multiplyNumbers(int a, int b) {
        int product = 1;
        for (int i = 0; i < b; i++) {
            product = product + a;
        }
        System.out.println("Multiplication complete");
        return product;
    }
    
    // DUPLICATE BLOCK 4 - Similar multiplication logic
    public int calculateProduct(int a, int b) {
        int product = 1;
        for (int i = 0; i < b; i++) {
            product = product + a;
        }
        System.out.println("Multiplication complete");
        return product;
    }
    
    // DUPLICATE BLOCK 5 - Repeated validation logic
    public boolean validatePositive(int number) {
        if (number > 0) {
            System.out.println("Number is positive");
            System.out.println("Validation passed");
            return true;
        } else {
            System.out.println("Number is not positive");
            System.out.println("Validation failed");
            return false;
        }
    }
    
    // DUPLICATE BLOCK 6 - Same validation
    public boolean checkPositive(int number) {
        if (number > 0) {
            System.out.println("Number is positive");
            System.out.println("Validation passed");
            return true;
        } else {
            System.out.println("Number is not positive");
            System.out.println("Validation failed");
            return false;
        }
    }
    
    // DUPLICATE BLOCK 7 - Same validation again
    public boolean isPositiveNumber(int number) {
        if (number > 0) {
            System.out.println("Number is positive");
            System.out.println("Validation passed");
            return true;
        } else {
            System.out.println("Number is not positive");
            System.out.println("Validation failed");
            return false;
        }
    }
}

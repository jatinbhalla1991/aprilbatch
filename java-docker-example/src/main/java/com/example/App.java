package com.example;

import java.util.Collections;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class App {
    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(App.class);
        app.setDefaultProperties(Collections.singletonMap("server.port", "8081"));
        app.setDefaultProperties(Collections.singletonMap("spring.datasource.url", "jdbc:mysql://db:3306/mydatabase"));
        app.setDefaultProperties(Collections.singletonMap("spring.datasource.username", "root"));
        app.setDefaultProperties(Collections.singletonMap("spring.datasource.password", "rootpassword"));
        app.run(args);
    }
}

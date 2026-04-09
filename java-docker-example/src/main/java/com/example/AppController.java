package com.example;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;


@RestController
public class AppController {

    @GetMapping("/")
    public String home() {
        return "Hello, Tarun! This is a Spring Boot application running in a Docker container.";
    }

}

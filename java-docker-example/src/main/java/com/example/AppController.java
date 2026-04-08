package com.example;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;


@RestController
public class AppController {

    @GetMapping("/")
    public String home() {
        return "Hello, World! Welcome to the Java Docker World!";
    }

}

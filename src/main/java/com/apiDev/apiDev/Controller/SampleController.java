package com.apiDev.apiDev.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SampleController {
    
    @GetMapping("/hello")
    public String helloWorld() {
        return "Hello World!";
    }
}

package com.devteria.spring_mvc;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;



@RestController
public class HelloController {
    @GetMapping("/")
    public String index(){
        return "Nhan dep trai learn String Boot!";
    }
    @GetMapping("/user")
    public String userPage(){
        return "Users can access this page!!";
    }@GetMapping("/admin")
    public String adminPage(){
        return "Only admin access this page!";
    }
}

package com.devteria.spring_mvc.service;

import org.springframework.stereotype.Service;

@Service
public class UserService {
    public String handleHello() {
        return "hello from UserService";
    }
}

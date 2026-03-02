package com.devteria.spring_mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.devteria.spring_mvc.domain.User;
import com.devteria.spring_mvc.service.UserService;

import jakarta.annotation.PostConstruct;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
    private UserService userService;

    // code theo injection
    // chuot phai -> source action -> generate constructor using fields -> chon
    // userService
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        String test = this.userService.handleHello();
        model.addAttribute("dona", test);
        return "hello";
    }

    @GetMapping("/admin/user")
    public String getForm(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/form";
    }

    @PostMapping("/admin/user/create")
    public String createForm(Model model, @ModelAttribute("newUser") User user) {
        System.out.println("form submitted" + user);
        return "hello";
    }
}

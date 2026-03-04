package com.devteria.spring_mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.devteria.spring_mvc.domain.User;
import com.devteria.spring_mvc.repository.UserRepository;
import com.devteria.spring_mvc.service.UserService;

import jakarta.annotation.PostConstruct;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
    private final UserService userService;

    // code theo injection
    // chuot phai -> source action -> generate constructor using fields -> chon
    // userService
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        model.addAttribute("dona", "test");
        return "hello";
    }

    @GetMapping("/admin/user/create")
    public String getForm(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/form";
    }

    @PostMapping("/admin/user/create")
    public String createUserForm(Model model, @ModelAttribute("newUser") User hoidanit) {
        System.out.println("form submitted" + hoidanit);
        this.userService.handleSaveUser(hoidanit);
        return "redirect:/admin/user";
    }

    @RequestMapping(value = "/admin/user", method = RequestMethod.GET)
    public String userTable(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/user_table";
    }

}

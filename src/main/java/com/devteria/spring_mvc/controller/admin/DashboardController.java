package com.devteria.spring_mvc.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.devteria.spring_mvc.domain.User;
import com.devteria.spring_mvc.service.UserService;

@Controller
public class DashboardController {

    private final UserService userService;

    public DashboardController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("countUser", userService.countUsers());
        model.addAttribute("countProduct", userService.countProducts());
        model.addAttribute("countOrder", userService.countOrders());

        return "admin/dashboard/show";
    }
}

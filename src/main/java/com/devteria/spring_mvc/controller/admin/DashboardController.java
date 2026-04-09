package com.devteria.spring_mvc.controller.admin;

import java.time.LocalDate;
import java.time.Year;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.devteria.spring_mvc.service.OrderService;
import com.devteria.spring_mvc.service.UserService;

@Controller
public class DashboardController {

    private final UserService userService;
    private final OrderService orderService;

    public DashboardController(UserService userService, OrderService orderService) {
        this.userService = userService;
        this.orderService = orderService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        LocalDate now = LocalDate.now();
        int currentYear = Year.now().getValue();
        List<String> monthLabels = Arrays.asList(
                "January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December");
        List<Double> monthRevenue = orderService.getRevenueByMonth(currentYear);

        int currentMonthIndex = now.getMonthValue() - 1;
        double currentMonthRevenue = monthRevenue.get(currentMonthIndex);
        double previousMonthRevenue = currentMonthIndex > 0 ? monthRevenue.get(currentMonthIndex - 1) : 0.0;

        double revenueChangePercent;
        if (previousMonthRevenue == 0) {
            revenueChangePercent = currentMonthRevenue > 0 ? 100.0 : 0.0;
        } else {
            revenueChangePercent = ((currentMonthRevenue - previousMonthRevenue) / previousMonthRevenue) * 100;
        }

        model.addAttribute("countUser", userService.countUsers());
        model.addAttribute("countProduct", userService.countProducts());
        model.addAttribute("countOrder", userService.countOrders());
        model.addAttribute("revenueYear", currentYear);
        model.addAttribute("monthLabels", monthLabels);
        model.addAttribute("monthRevenue", monthRevenue);
        model.addAttribute("currentMonthName", monthLabels.get(currentMonthIndex));
        model.addAttribute("currentMonthRevenue", currentMonthRevenue);
        model.addAttribute("isRevenueUp", revenueChangePercent >= 0);
        model.addAttribute("revenueChangePercent", Math.abs(revenueChangePercent));

        return "admin/dashboard/show";
    }
}

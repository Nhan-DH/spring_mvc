package com.devteria.spring_mvc.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.devteria.spring_mvc.domain.User;
import com.devteria.spring_mvc.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AccountController {
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public AccountController(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/client/account")
    public String getAccountPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        long userId = (long) session.getAttribute("id");
        User user = this.userService.getUserById(userId);
        model.addAttribute("user", user);
        return "client/auth/account";
    }

    @GetMapping("/client/account/edit-info")
    public String getEditProfilePage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        long userId = (long) session.getAttribute("id");
        User user = this.userService.getUserById(userId);
        model.addAttribute("newUser", user);
        return "client/auth/edit-info";
    }

    @PostMapping("/client/account/update-info")
    public String updateProfileInfo(@ModelAttribute("newUser") User formUser, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        long userId = (long) session.getAttribute("id");
        User dbUser = this.userService.getUserById(userId);

        dbUser.setFullName(formUser.getFullName());
        dbUser.setPhoneNumber(formUser.getPhoneNumber());
        dbUser.setAddress(formUser.getAddress());

        this.userService.updatUser(dbUser);

        session.setAttribute("fullName", dbUser.getFullName());
        session.setAttribute("phone", dbUser.getPhoneNumber());
        return "redirect:/client/account?success=true";
    }

    @GetMapping("/client/account/change-password")
    public String getChangePasswordPage(Model model) {
        model.addAttribute("command", new User());
        return "client/auth/change-password";
    }

    @PostMapping("/client/account/update-password")
    public String updatePassword(
            @RequestParam("currentPassword") String currentPassword,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("confirmPassword") String confirmPassword,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        long userId = (long) session.getAttribute("id");
        User dbUser = this.userService.getUserById(userId);

        if (!passwordEncoder.matches(currentPassword, dbUser.getPassword())) {
            return "redirect:/client/account/change-password?error=invalidPassword";
        }

        if (!newPassword.equals(confirmPassword)) {
            return "redirect:/client/account/change-password?error=passwordMismatch";
        }

        if (newPassword.length() < 6) {
            return "redirect:/client/account/change-password?error=passwordTooShort";
        }

        dbUser.setPassword(passwordEncoder.encode(newPassword));
        this.userService.updatUser(dbUser);

        return "redirect:/client/account?passwordSuccess=true";
    }
}

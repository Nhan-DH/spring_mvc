package com.devteria.spring_mvc.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.nio.Buffer;
import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.devteria.spring_mvc.domain.User;
import com.devteria.spring_mvc.repository.UserRepository;
import com.devteria.spring_mvc.service.UploadService;
import com.devteria.spring_mvc.service.UserService;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.ServletContext;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;
    // code theo injection
    // chuot phai -> source action -> generate constructor using fields -> chon
    // userService

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        model.addAttribute("dona", "test");
        return "hello";
    }

    @GetMapping("/admin/user/create")
    public String getForm(Model model) {

        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUserForm(Model model,
            @ModelAttribute("newUser") @Valid User hoidanit,
            BindingResult newUserBindingResult,
            @RequestParam("avatarFile") MultipartFile avatarFile) {
        // validate
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>>>>>>>" + error.getField() + " - " + error.getDefaultMessage());
        }

        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }
        //
        if (!avatarFile.isEmpty()) {
            String avatar = uploadService.handleUploadFile(avatarFile, "avatar");
            hoidanit.setAvatar(avatar);// ghi de lai avatar sau khi da upload len server
        }

        String hashPassword = this.passwordEncoder.encode(hoidanit.getPassword());
        System.out.println("form submitted" + hoidanit);

        hoidanit.setPassword(hashPassword); // ghi de lai password sau khi da hash
        hoidanit.setRole(this.userService.getRoleByName(hoidanit.getRole().getName()));
        this.userService.handleSaveUser(hoidanit);
        return "redirect:/admin/user";
    }

    @RequestMapping(value = "/admin/user", method = RequestMethod.GET)
    public String userTable(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @GetMapping("admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);

        model.addAttribute("user", this.userService.getUserById(id));
        return "admin/user/detail";
    }

    @GetMapping("admin/user/update/{id}")
    public String editUser(Model model, @PathVariable long id) {
        model.addAttribute("newUser", this.userService.getUserById(id));
        model.addAttribute("id", id);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update/{id}")
    public String updateUser(
            Model model,
            @ModelAttribute("newUser") User newUser,
            @PathVariable long id,
            BindingResult result,
            @RequestParam("avatarFile") MultipartFile avatarFile) {
        if (result.hasErrors()) {
            return "admin/user/update";
        }
        User currentUser = userService.getUserById(id);
        // giữ password cũ
        newUser.setPassword(currentUser.getPassword());
        // xử lý avatar
        if (!avatarFile.isEmpty()) {
            String avatar = uploadService.handleUploadFile(avatarFile, "avatar");
            newUser.setAvatar(avatar);
        } else {
            // giữ avatar cũ
            newUser.setAvatar(currentUser.getAvatar());
        }
        newUser.setRole(userService.getRoleByName(newUser.getRole().getName()));
        userService.updatUser(newUser);
        return "redirect:/admin/user";
    }

    @GetMapping("admin/user/delete/{id}")
    public String deleteUser(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        return "admin/user/delete";
    }

    @PostMapping("admin/user/delete/{id}")
    public String postDeleteUser(@PathVariable long id) {
        this.userService.deleteUser(id);
        return "redirect:/admin/user";
    }

}

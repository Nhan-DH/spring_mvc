package com.devteria.spring_mvc.controller.client;

import java.util.List;
import java.util.Optional;

import org.springframework.boot.actuate.autoconfigure.observation.ObservationProperties.Http;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.devteria.spring_mvc.domain.Order;
import com.devteria.spring_mvc.domain.Product;
import com.devteria.spring_mvc.domain.User;
import com.devteria.spring_mvc.domain.dto.RegisterDTO;
import com.devteria.spring_mvc.service.OrderService;
import com.devteria.spring_mvc.service.ProductService;
import com.devteria.spring_mvc.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomePageController {
    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final OrderService orderService;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder,
            OrderService orderService) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.orderService = orderService;
    }

    @GetMapping("/")
    public String getMethodName(Model model) {

        Pageable pageable = PageRequest.of(0, 8); // CTRL clink of để xem chi tiết hàm of
        Page<Product> prs = this.productService.fetchProducts(pageable);
        List<Product> listProducts = prs.getContent();
        model.addAttribute("products", listProducts);
        return "client/homepage/show";

    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String postMethodName(@ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {
        // kiểm tra validation
        if (bindingResult.hasErrors()) {
            return "client/auth/register"; // quay lại trang register
        }
        User user = this.userService.registerDTOtoUser(registerDTO);
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));
        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getLoginPage() {
        return "client/auth/login";
    }

    @GetMapping("/access-deny")
    public String getDenyPage(Model model) {
        return "client/auth/deny";
    }

    @GetMapping("/client/my-orders")
    public String getMyOrderPage(Model model, HttpServletRequest request) {
        User curUser = new User();
        HttpSession session = request.getSession();
        long id = (long) session.getAttribute("id");
        curUser = this.userService.getUserById(id);

        List<Order> orders = this.orderService.getOrdersByUserId(curUser.getId());

        model.addAttribute("orders", orders);
        return "client/cart/my-orders";
    }

    @GetMapping("/contact")
    public String getContact() {

        return "client/contact";
    }

    @GetMapping("/client/account")
    public String getAccount() {

        return "client/auth/account";
    }

    @GetMapping("/client/products")
    public String getProducts(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            } else {
                page = 1;
            }
        } catch (Exception e) {

        }
        Pageable pageable = PageRequest.of(page - 1, 8); // CTRL clink of để xem chi tiết hàm of
        Page<Product> prs = this.productService.fetchProducts(pageable);
        List<Product> listProducts = prs.getContent();
        model.addAttribute("products", listProducts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        return "client/product/show";

    }
}

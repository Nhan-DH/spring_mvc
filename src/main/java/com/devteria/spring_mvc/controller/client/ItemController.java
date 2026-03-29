package com.devteria.spring_mvc.controller.client;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.hibernate.annotations.GeneratorType;
import org.springframework.boot.actuate.autoconfigure.observation.ObservationProperties.Http;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.devteria.spring_mvc.domain.Cart;
import com.devteria.spring_mvc.domain.CartDetail;
import com.devteria.spring_mvc.domain.Product;
import com.devteria.spring_mvc.domain.Product_;
import com.devteria.spring_mvc.domain.User;
import com.devteria.spring_mvc.domain.dto.ProductCriteriaDTO;
import com.devteria.spring_mvc.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.server.PathParam;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ItemController {
    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/client/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.findProduct(id);
        List<Product> relatedProducts = this.productService.getRelatedProducts(product, 8);
        model.addAttribute("product", product);
        model.addAttribute("relatedProducts", relatedProducts);
        model.addAttribute("id", id);
        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long productId = id;
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, productId, session);

        // Check if user came from products page and redirect back there
        String referer = request.getHeader("Referer");
        if (referer != null && referer.contains("/client/products")) {
            return "redirect:/client/products";
        }

        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCart(Model model, HttpServletRequest request) {
        User curUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        curUser.setId(id);
        Cart cart = this.productService.getCartByUser(curUser);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        double total = 0;
        for (CartDetail cd : cartDetails) {
            total += cd.getPrice() * cd.getQuantity();
        }
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("total", total);
        model.addAttribute("cart", cart);
        return "client/cart/show";
    }

    @GetMapping("/confirm-checkout")
    public String getCheckout(Model model, HttpServletRequest request) {
        User curUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        curUser.setId(id);
        Cart cart = this.productService.getCartByUser(curUser);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        double total = 0;
        for (CartDetail cd : cartDetails) {
            total += cd.getPrice() * cd.getQuantity();
        }
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("total", total);
        model.addAttribute("cart", cart);
        return "client/cart/checkout";
    }

    @PostMapping("/delete-cart-detail/{id}")
    public String deleteCartDetail(@PathVariable Long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.productService.handleRemoveCartDetail(cartDetailId, session);

        return "redirect:/cart";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckOut(cartDetails);
        return "redirect:/confirm-checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(HttpServletRequest request,
            @RequestParam("receiverName") String receiveName,
            @RequestParam("receiverPhone") String receiverPhone,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverNote") String receiverNote

    ) {

        User curUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        curUser.setId(id);

        this.productService.handlePlaceOrder(curUser, session, receiveName, receiverPhone, receiverAddress,
                receiverNote);
        return "client/cart/thanks";
    }

    @PostMapping("/add-product-from-view-detail")
    public String postMethodName(@RequestParam("id") long id,
            @RequestParam("quantity") int quantity,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCartFromViewDetail(email, id, session, quantity);
        return "redirect:/client/product/" + id;
    }

    @GetMapping("/client/products")
    public String getProducts(Model model,
            ProductCriteriaDTO productCriteriaDTO,
            HttpServletRequest request) {

        int page = 1;

        try {
            if (productCriteriaDTO.getPage().isPresent()) {
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            } else {
                // page = 1;
            }
        } catch (Exception e) {

        }
        // check sort
        Pageable pageable = PageRequest.of(page - 1, 8); // default
        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();

            if (sort.equals("asc")) {
                pageable = PageRequest.of(page - 1, 3, Sort.by(Product_.PRICE).ascending());

            } else if (sort.equals("desc")) {
                pageable = PageRequest.of(page - 1, 3, Sort.by(Product_.PRICE).descending());

            }
        }
        // Page<Product> prs = this.productService.fetchProducts(pageable);
        Page<Product> prs = this.productService.fetchProductsWithSpec(productCriteriaDTO, pageable);

        List<Product> listProducts = prs.getContent().size() > 0 ? prs.getContent() : new ArrayList<Product>();

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            qs = qs.replaceAll("(^|&)page=[^&]*", ""); // remove old page param
            qs = qs.replaceAll("^&|&$", ""); // trim leading/trailing &
        }
        qs = (qs == null || qs.isBlank()) ? "" : "&" + qs;
        model.addAttribute("products", listProducts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("queryString", qs);
        return "client/product/show";

    }
}

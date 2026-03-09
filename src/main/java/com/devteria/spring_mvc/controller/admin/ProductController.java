package com.devteria.spring_mvc.controller.admin;

import com.devteria.spring_mvc.service.ProductService;
import com.devteria.spring_mvc.service.UploadService;

import jakarta.validation.Valid;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devteria.spring_mvc.domain.Product;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProduct(Model model) {
        List<Product> prs = this.productService.fetchProducts();
        model.addAttribute("products", prs);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateForm(Model model) {
        model.addAttribute("newProduct", new Product());

        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(Model model,
            @ModelAttribute("newProduct") @Valid Product product,
            BindingResult newProductBindingResult,
            @RequestParam("productFile") MultipartFile imageFile) {

        // validate
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }

        String image = this.uploadService.handleUploadFile(imageFile, "image");
        product.setImage(image);
        this.productService.save(product);
        return "redirect:/admin/product";
    }

}

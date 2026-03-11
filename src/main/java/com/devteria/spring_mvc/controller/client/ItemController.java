package com.devteria.spring_mvc.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.devteria.spring_mvc.domain.Product;
import com.devteria.spring_mvc.service.ProductService;

@Controller
public class ItemController {
    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/client/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.findProduct(id);
        model.addAttribute("product", product);
        return "client/product/detail";
    }

}

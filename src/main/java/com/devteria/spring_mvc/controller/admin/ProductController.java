package com.devteria.spring_mvc.controller.admin;

import com.devteria.spring_mvc.service.ProductService;
import com.devteria.spring_mvc.service.UploadService;
import com.devteria.spring_mvc.service.UserService;
import jakarta.validation.Valid;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devteria.spring_mvc.domain.Product;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ProductController {

    private final UserService userService;

    private final ProductService productService;
    private final UploadService uploadService;

    ProductController(ProductService productService, UploadService uploadService, UserService userService) {
        this.productService = productService;
        this.uploadService = uploadService;
        this.userService = userService;
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

        String image = this.uploadService.handleUploadFile(imageFile, "product");
        product.setImage(image);
        this.productService.save(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateForm(Model model, @ModelAttribute("newProduct") Product newProduct, @PathVariable long id) {

        Product currentProduct = productService.getProductById(id);

        model.addAttribute("newProduct", this.productService.getProductById(id));
        model.addAttribute("id", id);
        return "admin/product/update";
    }

    @PostMapping("admin/product/update/{id}")
    public String postUploadString(Model model, @ModelAttribute("newProduct") Product newProduct) {
        this.productService.updateProduct(newProduct);
        return "redirect:/admin/product";
    }

    @GetMapping("admin/product/{id}")
    public String getProduct(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("product", this.productService.getProductById(id));
        return "admin/product/detail";
    }

    @GetMapping("admin/product/delete/{id}")
    public String deleteProduct(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        return "admin/product/delete";
    }

    @PostMapping("admin/product/delete/{id}")
    public String postDeleteProduct(@PathVariable long id) {
        this.productService.deleteProduct(id);
        return "redirect:/admin/product";
    }

}

package com.devteria.spring_mvc.service;

import com.devteria.spring_mvc.controller.admin.ProductController;
import com.devteria.spring_mvc.repository.CartDetailRepository;
import com.devteria.spring_mvc.repository.CartRepository;
import com.devteria.spring_mvc.repository.ProductRepository;
import com.devteria.spring_mvc.repository.UserRepository;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.devteria.spring_mvc.domain.Cart;
import com.devteria.spring_mvc.domain.CartDetail;
import com.devteria.spring_mvc.domain.Product;
import com.devteria.spring_mvc.domain.User;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserRepository userRepository;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserRepository userRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userRepository = userRepository;

    }

    public Product save(Product product) {
        return this.productRepository.save(product);
    }

    public List<Product> fetchProducts() {
        return this.productRepository.findAll();
    }

    public Product updateProduct(Product product) {
        return this.productRepository.save(product);
    }

    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public Product deleteProduct(long id) {
        return this.productRepository.deleteById(id);
    }

    public Product findProduct(long id) {
        return this.productRepository.findById(id);
    }

    public void handleAddProductToCart(String email, long id) {
        User user = this.userRepository.findByEmail(email);
        // if user haven't a cart , create new cart
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(1);
                cart = this.cartRepository.save(newCart);
            }

            // find product by id
            // save cart detail
            Product product = this.productRepository.findById(id);

            CartDetail cartDetail = new CartDetail();
            cartDetail.setCart(cart);
            cartDetail.setProduct(product);
            cartDetail.setPrice(product.getPrice());
            cartDetail.setQuantity(product.getQuantity());
            this.cartDetailRepository.save(cartDetail);

        }

    }
}

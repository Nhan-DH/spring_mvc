package com.devteria.spring_mvc.service;

import com.devteria.spring_mvc.repository.ProductRepository;

import java.util.List;

import org.springframework.stereotype.Service;

import com.devteria.spring_mvc.domain.Product;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product save(Product product) {
        return this.productRepository.save(product);
    }

    public List<Product> fetchProducts() {
        return this.productRepository.findAll();
    }
}

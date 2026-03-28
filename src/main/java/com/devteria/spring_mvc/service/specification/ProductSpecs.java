package com.devteria.spring_mvc.service.specification;

import org.springframework.data.jpa.domain.Specification;

import com.devteria.spring_mvc.domain.Product;
import com.devteria.spring_mvc.domain.Product_;

public class ProductSpecs {
    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    public static Specification<Product> targetLike(String target) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + target + "%");
    }

}

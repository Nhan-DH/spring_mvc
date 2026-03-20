package com.devteria.spring_mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devteria.spring_mvc.domain.Cart;
import com.devteria.spring_mvc.domain.CartDetail;
import com.devteria.spring_mvc.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    CartDetail findByCartAndProduct(Cart cart, Product product);
}

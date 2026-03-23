package com.devteria.spring_mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devteria.spring_mvc.domain.Order;
import com.devteria.spring_mvc.domain.Product;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    Order findById(long id);

    void deleteById(long id);

    List<Order> findByUserId(long userId);
}

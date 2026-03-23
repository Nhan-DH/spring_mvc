package com.devteria.spring_mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devteria.spring_mvc.domain.Order;
import com.devteria.spring_mvc.domain.Product;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

}

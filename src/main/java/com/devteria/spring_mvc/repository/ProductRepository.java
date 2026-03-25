package com.devteria.spring_mvc.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devteria.spring_mvc.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    Product findById(long id);

    Product deleteById(long id);

    Page<Product> findAll(Pageable pageable);
}

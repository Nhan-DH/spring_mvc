package com.devteria.spring_mvc.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.devteria.spring_mvc.domain.Order;
import com.devteria.spring_mvc.domain.Product;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    Order findById(long id);

    void deleteById(long id);

    List<Order> findByUserId(long userId);

    Page<Order> findAll(Pageable page);

    List<Order> findByUserIdOrderByCreatedDateDescIdDesc(long userId);

    @Query("SELECT FUNCTION('MONTH', o.createdDate), COALESCE(SUM(o.totalPrice), 0) "
            + "FROM Order o "
            + "WHERE FUNCTION('YEAR', o.createdDate) = :year "
            + "GROUP BY FUNCTION('MONTH', o.createdDate) "
            + "ORDER BY FUNCTION('MONTH', o.createdDate)")
    List<Object[]> getMonthlyRevenueByYear(@Param("year") int year);

}

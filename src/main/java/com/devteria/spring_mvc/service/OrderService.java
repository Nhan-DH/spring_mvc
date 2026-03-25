package com.devteria.spring_mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.devteria.spring_mvc.domain.Order;
import com.devteria.spring_mvc.domain.OrderDetail;
import com.devteria.spring_mvc.repository.OrderDetailRepository;
import com.devteria.spring_mvc.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Page<Order> getAllOrders(Pageable page) {
        return this.orderRepository.findAll(page);
    }

    public Order getOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public void updateOrder(Order order) {
        this.orderRepository.save(order);
    }

    public void deleteOrderById(long id) {
        // delete order details first
        Order order = this.orderRepository.findById(id);
        if (order != null) {
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
        }
        this.orderRepository.deleteById(id);
    }

    public List<Order> getOrdersByUserId(long userId) {
        return this.orderRepository.findByUserId(userId);
    }
}
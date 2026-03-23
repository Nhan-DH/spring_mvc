package com.devteria.spring_mvc.service;

import com.devteria.spring_mvc.controller.admin.ProductController;
import com.devteria.spring_mvc.repository.CartDetailRepository;
import com.devteria.spring_mvc.repository.CartRepository;
import com.devteria.spring_mvc.repository.OrderDetailRepository;
import com.devteria.spring_mvc.repository.OrderRepository;
import com.devteria.spring_mvc.repository.ProductRepository;
import com.devteria.spring_mvc.repository.UserRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.devteria.spring_mvc.domain.Cart;
import com.devteria.spring_mvc.domain.CartDetail;
import com.devteria.spring_mvc.domain.Order;
import com.devteria.spring_mvc.domain.OrderDetail;
import com.devteria.spring_mvc.domain.Product;
import com.devteria.spring_mvc.domain.User;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserRepository userRepository;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserRepository userRepository, OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userRepository = userRepository;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
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

    public void handleAddProductToCart(String email, long id, HttpSession session) {

        User user = this.userRepository.findByEmail(email);
        // if user haven't a cart , create new cart
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(0);
                cart = this.cartRepository.save(newCart);
            }

            // find product by id
            // save cart detail
            Product product = this.productRepository.findById(id);

            // check san pham da tung duoc them vao gio hang truoc day hay chua
            CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, product);
            if (oldDetail == null) {
                CartDetail cartDetail = new CartDetail();
                cartDetail.setCart(cart);
                cartDetail.setProduct(product);
                cartDetail.setPrice(product.getPrice());
                cartDetail.setQuantity(1);
                this.cartDetailRepository.save(cartDetail);
                // update cart(sum)
                int s = cart.getSum() + 1;
                cart.setSum(s);
                this.cartRepository.save(cart);
                session.setAttribute("sum", s);

            } else {
                oldDetail.setQuantity(oldDetail.getQuantity() + 1);
                this.cartDetailRepository.save(oldDetail);
            }

        }

    }

    public Cart getCartByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOpt = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetailOpt.isPresent()) {
            CartDetail cartDetail = cartDetailOpt.get();
            Cart curCart = cartDetail.getCart();
            this.cartDetailRepository.deleteById(cartDetailId);

            // update cart
            if (curCart.getSum() > 1) {
                int s = curCart.getSum() - 1;
                curCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(curCart);
            } else {
                this.cartRepository.deleteById(curCart.getId());
                session.setAttribute("sum", 0);
            }
        }

    }

    public void handleUpdateCartBeforeCheckOut(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail curCartDetail = cdOptional.get();
                curCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(curCartDetail);
            }
        }
    }

    public void handlePlaceOrder(User user, HttpSession session, String receiveName, String receivePhone,
            String receiveAddress, String receiverNote) {

        // create order detail

        // Step 1: get Cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();
            if (cartDetails != null) {

                // create oder
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiveName);
                order.setReceiverPhone(receivePhone);
                order.setReceiverAddress(receiveAddress);
                order.setReceiverNote(receiverNote);
                order.setStatus("Pending");
                double sum = 0;
                for (CartDetail cd : cartDetails) {
                    sum += cd.getPrice() * cd.getQuantity();
                }
                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);

                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());
                    this.orderDetailRepository.save(orderDetail);
                }
                // step 2: delete cart detail and cart
                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                }
                this.cartRepository.deleteById(cart.getId());
                // step 3 update session sum
                session.setAttribute("sum", 0);
            }
        }

    }
}

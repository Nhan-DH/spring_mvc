package com.devteria.spring_mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.devteria.spring_mvc.domain.Role;
import com.devteria.spring_mvc.domain.User;
import com.devteria.spring_mvc.service.UserService;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User hoidanit);

    User findByEmail(String email);

    List<User> findAll();

    User findById(long id);

    User deleteById(long id);

    boolean existsByEmail(String email);

}
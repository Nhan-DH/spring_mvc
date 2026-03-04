package com.devteria.spring_mvc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.devteria.spring_mvc.domain.User;
import com.devteria.spring_mvc.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }
}

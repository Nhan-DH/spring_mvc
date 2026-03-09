package com.devteria.spring_mvc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.devteria.spring_mvc.domain.Role;
import com.devteria.spring_mvc.domain.User;
import com.devteria.spring_mvc.repository.RoleRepository;
import com.devteria.spring_mvc.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public User updatUser(User user) {
        return this.userRepository.save(user);
    }

    public User deleteUser(long id) {
        return this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }
}

package com.devteria.spring_mvc.domain.dto;

import com.devteria.spring_mvc.service.validator.RegisterChecked;
import com.devteria.spring_mvc.service.validator.StrongPassword;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;

@RegisterChecked
public class RegisterDTO {
    @Size(min = 3, message = "The first name must have at least 3 characters")
    private String firstName;
    private String lastName;
    @Email(message = "Invalid email", regexp = "^[A-Za-z0-9+_.-]+@gmail\\.com$")
    private String email;
    @Size(min = 3, message = "The password must have at least 3 characters")
    @StrongPassword
    private String password;
    private String confirmPassword;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

}

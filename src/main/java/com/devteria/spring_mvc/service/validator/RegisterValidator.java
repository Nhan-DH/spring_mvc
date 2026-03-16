package com.devteria.spring_mvc.service.validator;

import org.springframework.stereotype.Service;

import com.devteria.spring_mvc.domain.dto.RegisterDTO;
import com.devteria.spring_mvc.service.UserService;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {
    private final UserService userService;

    public RegisterValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterDTO dto, ConstraintValidatorContext context) {

        if (!dto.getPassword().equals(dto.getConfirmPassword())) {

            context.disableDefaultConstraintViolation();

            context.buildConstraintViolationWithTemplate(
                    "Password confirmation does not match")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation();

            return false;
        }

        // checkExistBYEmail
        if (this.userService.checkEmailExist(dto.getEmail())) {
            context.disableDefaultConstraintViolation();

            context.buildConstraintViolationWithTemplate(
                    "Email already exists")
                    .addPropertyNode("email")
                    .addConstraintViolation();

            return false;
        }

        return true;
    }
}
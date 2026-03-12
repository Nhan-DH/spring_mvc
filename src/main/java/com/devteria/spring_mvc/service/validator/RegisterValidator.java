package com.devteria.spring_mvc.service.validator;

import com.devteria.spring_mvc.domain.dto.RegisterDTO;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {

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

        return true;
    }
}
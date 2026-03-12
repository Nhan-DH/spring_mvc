package com.devteria.spring_mvc.service.validator;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = RegisterValidator.class)
@Target({ ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)

public @interface RegisterChecked {

    String message() default "Password and Confirm Password must match";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
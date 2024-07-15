package com.axsos.project.validator;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.axsos.project.models.ShopForm;
import com.axsos.project.models.User;
import com.axsos.project.repositories.ShopRepository;
import com.axsos.project.repositories.UserRepository;

@Component
public class ShopValidator implements Validator {

    private final UserRepository userRepository;
    private final ShopRepository shopRepository;

    
    public ShopValidator(UserRepository userRepository,ShopRepository shopRepository) {
        this.userRepository = userRepository;
        this.shopRepository = shopRepository;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ShopForm user = (ShopForm) target;



        if (userRepository.existsByUsername(user.getUsername())) {
            errors.rejectValue("username", "Duplicate.user.username", "Username is already in use");
        }

        if (user.getCurrentSize() > user.getMaxCapacity()) {
            errors.rejectValue("currentSize", "Logical.user.maxCapacity", "current capacity should less than maximim capacity");
        }
    }
}

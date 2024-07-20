package com.axsos.project.validator;


import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.axsos.project.models.ShopForm;
import com.axsos.project.models.User;
import com.axsos.project.repositories.ShopRepository;
import com.axsos.project.repositories.UserRepository;

@Component
public class ShopValidator implements Validator {
	// ******************* Attributes *******************
	private final UserRepository userRepository;
	private final ShopRepository shopRepository;

	// ******************* Constructor *******************
	public ShopValidator(UserRepository userRepository,ShopRepository shopRepository) {
		this.userRepository = userRepository;
		this.shopRepository = shopRepository;
	}

	// ******************* Functions *******************
	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ShopForm user = (ShopForm) target;
		// Add validation for check if the user exist or not
		if (userRepository.existsByUsername(user.getUsername())) {
			errors.rejectValue("username", "Duplicate.user.username", "Username is already in use");
		}

		// Add validation to check the max capacity is larger than the current size
		if (user.getCurrentSize() > user.getMaxCapacity()) {
			errors.rejectValue("currentSize", "Logical.user.maxCapacity", "Current capacity should be less than maximum capacity");
		}
	}
}

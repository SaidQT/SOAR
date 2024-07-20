package com.axsos.project.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.axsos.project.models.User;
import com.axsos.project.repositories.UserRepository;

@Component
public class UserValidator implements Validator {
	// ******************* Attributes *******************
	@Autowired
	UserRepository userRepository;

	// ******************* Functions *******************
	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User user = (User) target;
		// Add validation to check if the password matches confirm password
		if (user.getPasswordConfirmation() == null) {
			errors.rejectValue("passwordConfirmation", "Null.user.passwordConfirmation",
					"Password confirmation cannot be null");
		} else if (!user.getPassword().equals(user.getPasswordConfirmation())) {
			errors.rejectValue("passwordConfirmation", "Match.user.passwordConfirmation", "Passwords do not match");
		}

		// Add validation for check if the user exist or not
		if (userRepository.existsByUsername(user.getUsername())) {
			errors.rejectValue("username", "Duplicate.user.username", "Username is already in use");
		}
	}
}
package com.axsos.project.validator;


import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.axsos.project.models.User;

@Component
public class UserValidator implements Validator {

	//    1
	@Override
	public boolean supports(Class<?> c) {
		return User.class.equals(c);
	}

	// 2
	@Override
	public void validate(Object o, Errors errors) {
		User user = (User) o;

		if (user.getPasswordConfirmation() == null) {
			errors.rejectValue("passwordConfirmation", "Null.user.passwordConfirmation", "Password confirmation cannot be null");
		} else if (!user.getPassword().equals(user.getPasswordConfirmation())) {
			errors.rejectValue("passwordConfirmation", "Match.user.passwordConfirmation", "Passwords do not match");
		}

	}
}

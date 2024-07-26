package com.axsos.project.models;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public class ShopForm {
	// Shop information
	@NotNull
	@Size(min = 2, max = 200, message = "Shop name must be at least 2 characters")
	private String shopName;
	@NotNull
	@Size(min = 2, max = 200, message = "City name must be at least 2 characters")
	private String city;
	@NotNull
	@Min(value = 5, message = "Maximum capacity should be at least 5")
	private Integer maxCapacity;
	@NotNull
	private Integer currentSize;
	@NotNull(message = "Phone number cannot be null")
	@Size(min = 10, max = 15, message = "Phone number must be between 10 and 15 digits")
	@Pattern(regexp = "^[0-9]*$", message = "Phone number must contain only digits")
	private String phoneNumber;

	// Shop owner information
	@NotEmpty(message = "Username is required!")
	@Size(min = 3, max = 30, message = "Username must be between 3 and 30 characters")
	private String username;

	@NotEmpty(message = "Email is required!")
	@Email(message = "Please enter a valid email!")
	private String email;

	@NotEmpty(message = "Password is required!")
	@Size(min = 5, message = "Password must be greater than 5 characters")
	private String password;

	// private String passwordConfirmation;

	public ShopForm() {
		this.currentSize = 0;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Integer getMaxCapacity() {
		return maxCapacity;
	}

	public void setMaxCapacity(Integer maxCapacity) {
		this.maxCapacity = maxCapacity;
	}

	public Integer getCurrentSize() {
		return currentSize;
	}

	public void setCurrentSize(Integer currentSize) {
		this.currentSize = currentSize;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	@Override
	public String toString() {
		return "ShopForm [shopName=" + shopName + ", city=" + city + ", maxCapacity=" + maxCapacity + ", currentSize="
				+ currentSize + ", phoneNumber=" + phoneNumber + ", username=" + username + ", email=" + email
				+ ", password=" + password + ", passwordConfirmation=" + "]";
	}

	// public String getPasswordConfirmation() {
	// return passwordConfirmation;
	// }
	//
	// public void setPasswordConfirmation(String passwordConfirmation) {
	// this.passwordConfirmation = passwordConfirmation;
	// }
}
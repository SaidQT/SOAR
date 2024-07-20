package com.axsos.project.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.axsos.project.models.Shop;
import com.axsos.project.models.User;
import com.axsos.project.repositories.RoleRepository;
import com.axsos.project.repositories.UserRepository;

@Service
public class UserService {
	// ******************* Attributes *******************
	@Autowired
	UserRepository userRepository;
	@Autowired
	RoleRepository roleRepository;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	// ******************* Functions *******************
	// Function to create a new user {for user and admin roles}
	public void newUser(User user, String role) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setRoles(roleRepository.findByName(role));
		userRepository.save(user);
	}

	// Function to update the update information
	public void updateUser(User user) {
		userRepository.save(user);
	}

	// Function to find user by his username
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	// Function to get all users from our database
	public List<User> allUsers() {
		return userRepository.findAll();
	}

	// Function to delete a user by his ID
	public void deleteUser(User user) {
		userRepository.delete(user);
	}

	// Function to find user by his ID
	public User findById(Long id) {
		Optional<User> potentialUser = userRepository.findById(id);
		if (potentialUser.isPresent()) {
			return potentialUser.get();
		}
		return null;
	}

	// Function to create a new user {for shop owner role}
	public User createShopOwner(String username, String email, String password, Shop shop) {
		User shopOwner = new User();
		shopOwner.setUsername(username);
		shopOwner.setEmail(email);
		shopOwner.setPassword(bCryptPasswordEncoder.encode(password));
		shopOwner.setPasswordConfirmation(bCryptPasswordEncoder.encode(password));
		userRepository.save(shopOwner);
		shopOwner.setRoles(roleRepository.findByName("ROLE_OWNER"));
		shopOwner.setShop(shop);
		userRepository.save(shopOwner);
		return shopOwner;
	}

	//	Function to upgrade user from user role to admin role
	public User upgradeUser(User user) {
		user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
		return userRepository.save(user);
	}
}
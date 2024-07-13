package com.axsos.project.services;

import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.axsos.project.models.Shop;
import com.axsos.project.models.User;
import com.axsos.project.repositories.RoleRepository;
import com.axsos.project.repositories.UserRepository;

@Service
public class UserService {
	private UserRepository userRepository;
	private RoleRepository roleRepository;
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	public UserService(UserRepository userRepository, RoleRepository roleRepository,
			BCryptPasswordEncoder bCryptPasswordEncoder) {
		this.userRepository = userRepository;
		this.roleRepository = roleRepository;
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
	}

	public void newUser(User user, String role) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setRoles(roleRepository.findByName(role));
		userRepository.save(user);
	}

	public void updateUser(User user) {
		userRepository.save(user);
	}

	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	public List<User> allUsers() {
		return userRepository.findAll();
	}

	public User upgradeUser(User user) {
		user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
		return userRepository.save(user);
	}

	public void deleteUser(User user) {
		userRepository.delete(user);
	}

	public User findById(Long id) {
		Optional<User> potentialUser = userRepository.findById(id);
		if (potentialUser.isPresent()) {
			return potentialUser.get();
		}
		return null;
	}

	public User createShopOwner(String username, String email, String password, Shop shop) {

		boolean potentialUser = userRepository.existsByUsername(username);
		if (potentialUser == true) {
			return null;
		} else {
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
	}
}
package com.axsos.project.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.axsos.project.models.User;

public interface UserRepository extends JpaRepository<User, Long> {
	Optional<User> findByEmail(String email);

	@Override
	Optional<User> findById(Long id);

	User findByUsername(String username);

	@Override
	List<User> findAll();

	boolean existsByUsername(String username);
}
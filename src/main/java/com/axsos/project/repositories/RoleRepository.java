package com.axsos.project.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.project.models.Role;

@Repository
public interface RoleRepository extends CrudRepository<Role, Long> {
	@Override
	List<Role> findAll();

	List<Role> findByName(String name);
}
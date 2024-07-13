package com.axsos.project.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.project.models.Pet;

@Repository
public interface PetRepository extends CrudRepository<Pet, Long> {
	 List<Pet> findAll();
}

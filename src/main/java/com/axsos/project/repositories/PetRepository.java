package com.axsos.project.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.project.models.Pet;

@Repository
public interface PetRepository extends CrudRepository<Pet, Long> {
	@Override
	List<Pet> findAll();

	@Query("SELECT COUNT(p) FROM Pet p WHERE p.status = 'Adopted'")
	long countAdoptedPets();

	@Query("SELECT COUNT(p) FROM Pet p WHERE p.status = 'Unadopted'")
	long countUnadoptedPets();
}

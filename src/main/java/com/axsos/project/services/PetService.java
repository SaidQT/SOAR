package com.axsos.project.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.axsos.project.models.Pet;
import com.axsos.project.repositories.PetRepository;

@Service
public class PetService {
	// ******************* Attributes *******************
	@Autowired
	PetRepository petRepository;
	@Autowired
	UserService userService;

	// ******************* Functions *******************
	// Function to get all pets from our database
	public List<Pet> allPets() {
		return petRepository.findAll();
	}

	// Function to create a new pet
	public Pet createPet(Pet b) {
		return petRepository.save(b);
	}

	// Function to find pet by its ID
	public Pet findPet(Long id) {
		Optional<Pet> optionalPet = petRepository.findById(id);
		if (optionalPet.isPresent()) {
			return optionalPet.get();
		} else {
			return null;
		}
	}

	// Function to update the pet information
	public Pet updatePet(Pet b) {
		return petRepository.save(b);
	}

	// Function to delete a pet by its ID
	public void deletePet(Long id) {
		petRepository.deleteById(id);
	}

	// Function to find the number for adopted pets
	public long getAdoptedPetCount() {
		return petRepository.countAdoptedPets();
	}

	// Function to find the number for unadopted pets
	public long getUnadoptedPetCount() {
		return petRepository.countUnadoptedPets();
	}
}

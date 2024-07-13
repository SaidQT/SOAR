package com.axsos.project.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.axsos.project.models.Pet;
import com.axsos.project.models.Shop;
import com.axsos.project.repositories.PetRepository;

@Service
public class PetService {
	@Autowired
	PetRepository petRepository;
	public List<Pet> allPets() {
		return petRepository.findAll();
	}

	
	public Pet createPet(Pet b) {
		return petRepository.save(b);
	}

	
	public Pet findPet(Long id) {
		Optional<Pet> optionalPet = petRepository.findById(id);
		if (optionalPet.isPresent()) {
			return optionalPet.get();
		} else {
			return null;
		}
	}
	
	public Pet updatePet(Pet b) {
		return petRepository.save(b);
	}
	public void deletePet(Long id) {
		petRepository.deleteById(id);
	}
}

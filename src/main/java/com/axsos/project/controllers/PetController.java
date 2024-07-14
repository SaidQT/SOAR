package com.axsos.project.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.axsos.project.models.Pet;
import com.axsos.project.models.Shop;
import com.axsos.project.models.User;
import com.axsos.project.services.PetService;
import com.axsos.project.services.ShopService;
import com.axsos.project.services.UserService;

import jakarta.validation.Valid;

@Controller
public class PetController {
	// ****************************** Attributes ******************************
	@Autowired
	PetService petService;
	@Autowired
	UserService userService;
	@Autowired
	ShopService shopService;

	// ****************************** C from {CRUD} ******************************
	// Functions allow the shop owner to add new pet to their shop
	@GetMapping("/shop/add")
	public String addShop(@ModelAttribute("pet") Pet pet) {
		return "addpet.jsp";
	}

	@PostMapping("/shop/new")
	public String createShop(@Valid @ModelAttribute("pet") Pet pet, BindingResult result, Principal principal) {
		// Principal here is the shop owner
		String username = principal.getName();
		User user = userService.findByUsername(username);
		Shop shop = user.getShop();

		if (result.hasErrors()) {
			return "addpet.jsp";
		} else {
			// To add new pet to the shop:
			// *) Set status to unadopted (by default)
			// *) Add relationship with shop(1 shop --have-- M pets)
			// *) Save the pet
			pet.setStatus("Unadopted");
			pet.setShop(shop);
			petService.createPet(pet);
			return "redirect:/shop/home";
		}
	}

	// ****************************** R from {CRUD} ******************************
	// Functions allow the shop owner to show all pets they have
	@GetMapping("/shop/home")
	public String showShops(Model model) {
		List<Pet> pets = petService.allPets();
		model.addAttribute("pets", pets);
		return "pet.jsp";
	}

	// ****************************** U from {CRUD} ******************************
	// Functions allow the shop owner to edit pet information
	// ID here is for the pet
	@GetMapping("/shop/{id}/edit")
	public String showInfo(@PathVariable("id") Long id, Model model) {
		Pet pet = petService.findPet(id);
		model.addAttribute("pet", pet);
		return "editpet.jsp";
	}

	@PatchMapping("/shop/{id}")
	public String editInfo(@Valid @ModelAttribute("pet") Pet pet, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("pet", pet);
			return "editpet.jsp";
		} else {
			petService.updatePet(pet);
			return "redirect:/shop/home";
		}
	}

	// ****************************** D from {CRUD} ******************************
	// Functions allow the shop owner to delete a pet from their shop
	// ID here is for the pet
	@GetMapping("/shop/{id}/delete")
	public String destroy(@PathVariable("id") Long id) {
		petService.deletePet(id);
		return "redirect:/shop/home";
	}

	// ****************************** R,U from {CRUD} ******************************
	// Functions to describe the adoption process:
	// Read the pet information --> any user can go to the pet profile so it is
	// public
	// ID here is for the pet
	@GetMapping("/public/{id}/details")
	public String showDetails(@PathVariable("id") Long id, Model model) {
		Pet pet = petService.findPet(id);
		model.addAttribute("pet", pet);
		return "petprofile.jsp";
	}

	// If user click on adoption button we need to change the pet status to pending
	// and add it to their besties
	// ID here is for the pet
	// Principal here is the adaptor(user)
	@PatchMapping("/user/{id}/details")
	public String requestAdoption(@PathVariable("id") Long id, Principal principal) {
		Pet pet = petService.findPet(id);
		String username = principal.getName();
		User user = userService.findByUsername(username);
		// Add relationship between pet and user (1 user --adapt-- M pets) + update
		// status before save
		pet.setUser(user);
		pet.setStatus("Pending");
		petService.createPet(pet);
		return "redirect:/user/besties";
	}

	// Read the requests information for shop owner --> show the pets according to
	// their status
	// ID here is for shop
	@GetMapping("/shop/{id}/requests")
	public String showRequests(@PathVariable("id") Long id, Model model) {
		Shop shop = shopService.findShop(id);
		// We will get all the shops' pets and separate them according to their status
		// in the JSP file
		List<Pet> pets = shop.getPets();
		model.addAttribute("pets", pets);
		return "requests.jsp";
	}

	// Accept request --> The shop owner can accept the adoption request {update the pet status to
	// adopted}
	// ID here is for pet and shopid for shop
	@GetMapping("/shop/{id}/{shopId}/accept")
	public String accept(@PathVariable("id") Long id, @PathVariable("shopId") Long shopId) {
		Pet pet = petService.findPet(id);
		// Just update the status before save pet
		pet.setStatus("Adopted");
		petService.createPet(pet);
		return "redirect:/shop/" + shopId + "/requests";
	}

	// Refuse request -->The shop owner can refuse the adoption request {update the pet status to
	// unadopted}
	// ID here is for pet and shopid for shop
	@GetMapping("/shop/{id}/{shopId}/destroy")
	public String destroy(@PathVariable("id") Long id, @PathVariable("shopId") Long shopId) {
		Pet pet = petService.findPet(id);
		pet.setStatus("Unadopted");
		// If there is relationship between pet and user we need to set it to null(the
		// pet is no longer adopted for this user)
		pet.setUser(null);
		petService.createPet(pet);
		return "redirect:/shop/" + shopId + "/requests";
	}
}

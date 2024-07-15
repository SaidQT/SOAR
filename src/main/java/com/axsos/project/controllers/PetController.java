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

import jakarta.servlet.http.HttpSession;
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
	public String showShops(Model model, Principal principal) {
		String username = principal.getName();
		User user = userService.findByUsername(username);
		Shop shop = user.getShop();
		model.addAttribute("shop", shop);
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
	@GetMapping("/details")
	public String showDetails(Model model, HttpSession session) {
		if (session.getAttribute("id") != null) {
			Pet pet = petService.findPet((Long) session.getAttribute("id"));
			model.addAttribute("pet", pet);
		}
		return "details.jsp";
	}

	@GetMapping("/public/{id}/details")
	public String show(@PathVariable("id") Long id, Model model, HttpSession session) {
		session.setAttribute("id", id);

		return "redirect:/details";
	}

	@PatchMapping("/user/details")
	public String requestAdoption(HttpSession session, Principal principal) {
		Long id = (Long) session.getAttribute("id");
		Pet pet = petService.findPet(id);
		String username = principal.getName();
		User user = userService.findByUsername(username);
		pet.setUser(user);
		pet.setStatus("Pending");
		petService.createPet(pet);
		return "redirect:/user/besties";
	}

	@GetMapping("/shop/{id}/requests")
	public String showRequests(@PathVariable("id") Long id, Model model, Principal principal) {
		String username = principal.getName();
		User user = userService.findByUsername(username);
		System.out.println("Id = " + id + "session id= " + user.getShop().getId());
		if (id != user.getShop().getId()) {
			return "accessDenied.jsp";
		}
		Shop shop = shopService.findShop(id);
		List<Pet> pets = shop.getPets();
		model.addAttribute("pets", pets);
		return "requests.jsp";
	}

	@GetMapping("/shop/{id}/{shopId}/accept")
	public String accept(@PathVariable("id") Long id, @PathVariable("shopId") Long shopId, Principal principal) {
		String username = principal.getName();
		User x = userService.findByUsername(username);
		if (id != x.getShop().getId()) {
			return "accessDenied.jsp";
		}
		Pet pet = petService.findPet(shopId);
		pet.setStatus("Adopted");
		User user = pet.getUser();
		user.addAdoptedPet(pet);
		userService.updateUser(user);
		petService.createPet(pet);
		return "redirect:/shop/" + id + "/requests";
	}

	@GetMapping("/shop/{id}/{shopId}/destroy")
	public String destroy(@PathVariable("id") Long id, @PathVariable("shopId") Long shopId, Principal principal) {
		String username = principal.getName();
		User user = userService.findByUsername(username);
		if (id != user.getShop().getId()) {
			return "accessDenied.jsp";
		}
		Pet pet = petService.findPet(shopId);
		pet.setStatus("Unadopted");
		pet.setUser(null);
		petService.createPet(pet);
		return "redirect:/shop/" + shopId + "/requests";
	}

}

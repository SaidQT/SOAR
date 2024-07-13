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
import com.axsos.project.services.UserService;

import jakarta.validation.Valid;

@Controller
public class PetController {
	@Autowired
	PetService petService;
	@Autowired
	UserService userService;

	@GetMapping("/shop/add")
	public String addShop(@ModelAttribute("pet") Pet pet) {
		return "addpet.jsp";
	}

	@PostMapping("/shop/new")
	public String createShop(@Valid @ModelAttribute("pet") Pet pet, BindingResult result, Principal principal) {
		String username = principal.getName();
		User user = userService.findByUsername(username);
		Shop shop = user.getShop();

		if (result.hasErrors()) {
			return "addpet.jsp";
		} else {
			pet.setStatus("Unadopted");
			pet.setShop(shop);
			petService.createPet(pet);
			return "redirect:/shop/home";
		}
	}

	@GetMapping("/shop/home")
	public String showShops(Model model) {
		List<Pet> pets = petService.allPets();
		model.addAttribute("pets", pets);
		return "pet.jsp";
	}

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

	@GetMapping("/shop/{id}/delete")
	public String destroy(@PathVariable("id") Long id) {
		petService.deletePet(id);
		return "redirect:/shop/home";
	}

	// @GetMapping("/")
	// public String UserPage() {
	// return "UserPage.jsp";
	// }

	@GetMapping("/contactus")
	public String ContactUs() {

		return "ContactUs.jsp";
	}

	@GetMapping("/favoritepage")
	public String FavoritePage(Principal principal, Model model) {
		String username = principal.getName();
		User user = userService.findByUsername(username);
		List<Pet> pets= user.getPets();
		model.addAttribute("favorite", pets);
		return "FavortiePage.jsp";
	}

	@GetMapping("/categoriesname")
	public String CategoriesName() {
		return "categoryName.jsp";
	}

}

package com.axsos.project.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.axsos.project.models.Pet;
import com.axsos.project.models.Role;
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

	@PostMapping("/pets/new")
	public String createShop(@Valid @ModelAttribute("pet") Pet pet, BindingResult result) {
		if (result.hasErrors()) {
			return "addpet.jsp";
		} else {
			pet.setStatus("Unadopted");
			petService.createPet(pet);
			return "redirect:/pet/home";
		}
	}

	@GetMapping("/pet/home")
	public String showShops(Model model) {
		List<Pet> pets = petService.allPets();
		model.addAttribute("pets", pets);
		return "pet.jsp";
	}

	@GetMapping("/pet/{id}/edit")
	public String showInfo(@PathVariable("id") Long id, Model model) {
		Pet pet = petService.findPet(id);
		model.addAttribute("pet", pet);
		return "editpet.jsp";
	}

	@PutMapping("/pet/{id}")
	public String editInfo(@Valid @ModelAttribute("pet") Pet pet, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("pet", pet);
			return "editpet.jsp";
		} else {
			petService.updatePet(pet);
			return "redirect:/pet/home";
		}
	}

	@GetMapping("/pet/{id}/delete")
	public String destroy(@PathVariable("id") Long id) {
		petService.deletePet(id);
		return "redirect:/pet/home";
	}

	@GetMapping("/")
	public String UserPage() {
		return "UserPage.jsp";
	}

	@GetMapping("/contactus")
	public String ContactUs() {

		return "ContactUs.jsp";
	}

	@GetMapping("/favoritepage")
	public String FavoritePage() {
		return "FavortiePage.jsp";
	}

	@GetMapping("/categoriesname")
	public String CategoriesName() {
		return "categoryName.jsp";
	}

	


}

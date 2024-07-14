package com.axsos.project.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.axsos.project.models.Pet;
import com.axsos.project.models.User;
import com.axsos.project.services.PetService;
import com.axsos.project.services.ShopService;
import com.axsos.project.services.UserService;

@Controller
public class MainController {
	// ****************************** Attributes ******************************
	@Autowired
	PetService petService;
	@Autowired
	UserService userService;
	@Autowired
	ShopService shopService;

	@GetMapping("/categoriesname")
	public String CategoriesName() {
		return "categoryName.jsp";
	}

	@GetMapping("/contactus")
	public String ContactUs() {

		return "ContactUs.jsp";
	}

	@GetMapping("/user/favorites")
	public String FavoritePage(Principal principal, Model model) {
		String username = principal.getName();
		User user = userService.findByUsername(username);
		List<Pet> pets = user.getPets();
		model.addAttribute("favorite", pets);
		return "FavortiePage.jsp";
	}

}

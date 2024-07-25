package com.axsos.project.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.axsos.project.models.Role;
import com.axsos.project.models.Shop;
import com.axsos.project.models.ShopForm;
import com.axsos.project.models.User;
import com.axsos.project.services.PetService;
import com.axsos.project.services.ShopService;
import com.axsos.project.services.UserService;
import com.axsos.project.validator.ShopValidator;

import jakarta.validation.Valid;

@Controller
public class ShopController {
	// ****************************** Attributes ******************************
	@Autowired
	ShopService shopService;
	@Autowired
	UserService userService;
	// To validate the shop form {add new shop and shop owner}
	private final ShopValidator shopValidator;
	@Autowired
	PetService petService;

	// ****************************** Constructor ******************************
	ShopController(ShopValidator shopValidator) {
		this.shopValidator = shopValidator;
	}

	// ****************************** C from {CRUD} ******************************
	// Functions allow the admin to add new shop to their partners
	@GetMapping("/admin/add")
	public String addShop(@ModelAttribute("shopForm") ShopForm shopForm) {
		return "addshop.jsp";
	}

	@PostMapping("/admin/add")
	public String createShop(@Valid @ModelAttribute("shopForm") ShopForm shopForm, BindingResult result) {
		// Add a custom validation for shopForm class
		// inside validator for{unique username, max capacity > current capacity}
		shopValidator.validate(shopForm, result);
		if (result.hasErrors()) {
			return "addshop.jsp";
		} else {
			// In this form we will:
			// *) Add new shop
			// *) Add new shop owner {user with owner role}
			// *) Connect this shop with shop owner in one to one relationship (1 shop owner
			// --own-- 1 shop)
			Shop shop = shopService.createShop(shopForm.getShopName(), shopForm.getCity(), shopForm.getPhoneNumber(),
					shopForm.getMaxCapacity(), shopForm.getCurrentSize());
			User shopOwner = userService.createShopOwner(shopForm.getUsername(), shopForm.getEmail(),
					shopForm.getPassword(), shop);
			return "redirect:/admin/home";
		}
	}

	// ****************************** R from {CRUD} ******************************
	// Functions allow the admin to see all partners and users
	@GetMapping("/admin/home")
	public String showShops(Model model) {
		List<Shop> shops = shopService.findAll();
		model.addAttribute("shops", shops);
		List<User> users = userService.allUsers();
		// This list is used to add non admin users and change their roles name
		List<User> nonAdminUsers = new ArrayList<>();
		for (User user : users) {
			boolean flag = true;
			for (Role role : user.getRoles()) {
				if (role.getName().equals("ROLE_USER")) {
					role.setName("User");
				} else if (role.getName().equals("ROLE_OWNER")) {
					role.setName("Shop owner");
				} else if (role.getName().equals("ROLE_ADMIN")) {
					flag = false;
					break;
				}
			}
			if (flag == true) {
				nonAdminUsers.add(user);
			}
		}
		model.addAttribute("users", nonAdminUsers);
		return "shop.jsp";
	}

	// Functions allow the admin to distribution of shops across cities,total
	// partners,total of adopted and unadopted pets and last 5 partners
	@GetMapping("/admin/dashboard")
	public String AdminDashboard(Model model) {
		Map<String, Long> shopsPerCity = shopService.countShopsByCity();
		List<Shop> lastFiveShops = shopService.getLastFiveShops();
		long totalShops = shopService.getTotalShops();
		long adoptedPetCount = petService.getAdoptedPetCount();
		long unadoptedPetCount = petService.getUnadoptedPetCount();
		model.addAttribute("totalShops", totalShops);
		model.addAttribute("lastFiveShops", lastFiveShops);
		model.addAttribute("shopsPerCity", shopsPerCity);
		model.addAttribute("adoptedPetCount", adoptedPetCount);
		model.addAttribute("unadoptedPetCount", unadoptedPetCount);
		model.addAttribute("totalDonations", User.getTotalDonations());
		return "adminDashboard.jsp";
	}

	// ****************************** U from {CRUD} ******************************
	// Functions allow the admin to update shop information
	// ID here is for shop
	@GetMapping("/admin/{id}/edit")
	public String showInfo(@PathVariable("id") Long id, Model model) {
		Shop shop = shopService.findShop(id);
		model.addAttribute("shop", shop);
		return "editshop.jsp";
	}

	// ID here is for shop
	@PatchMapping("/admin/{id}")
	public String editInfo(@Valid @ModelAttribute("shop") Shop shop, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("shop", shop);
			return "editshop.jsp";
		} else {
			Shop shopEdit= shopService.updateShop(shop, result);
			if (shopEdit == null) { 
				return "editshop.jsp";
			}
			return "redirect:/admin/home";
		}
	}

	// ****************************** D from {CRUD} ******************************
	// Functions allow the admin to delete a shop
	// ID here is for shop
	@GetMapping("/admin/{id}/delete")
	public String destroy(@PathVariable("id") Long id) {
		shopService.deleteShop(id);
		return "redirect:/admin/home";
	}

	// Functions allow the admin to delete a user
	// ID here is for user
	@GetMapping("/admin/{id}/delete/user")
	public String deleteUser(@PathVariable("id") Long id) {
		User user = userService.findById(id);
		userService.deleteUser(user);
		return "redirect:/admin/home";
	}
}
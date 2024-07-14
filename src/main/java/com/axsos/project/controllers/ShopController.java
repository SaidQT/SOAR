package com.axsos.project.controllers;

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

import com.axsos.project.models.Shop;
import com.axsos.project.models.ShopForm;
import com.axsos.project.models.User;
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
	private final ShopValidator shopValidator;

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

	// To Do: add confirm password in shop Form
	@PostMapping("/admin/shops/new")
	public String createShop(@Valid @ModelAttribute("shopForm") ShopForm shopForm, BindingResult result) {
		shopValidator.validate(shopForm, result);
		if (result.hasErrors()) {
			return "addshop.jsp";
		} else {
			// In this form we will:
			// *) Add new shop
			// *) Add new shop owner {user with owner role}
			// *) Connect this shop with shop owner in one to one relationship (1 shop owner --own-- 1 shop)
			Shop shop = shopService.createShop(shopForm.getShopName(), shopForm.getCity(), shopForm.getPhoneNumber(),
					shopForm.getMaxCapacity(), shopForm.getCurrentSize());
			User shopOwner = userService.createShopOwner(shopForm.getUsername(), shopForm.getEmail(),
					shopForm.getPassword(), shop);
			// To Do: Need to change we need to add a custom validation for shopForm class
			// inside validator  for{password and confirm password, unique username, max capacity > current capacity}
			if (shopOwner == null) {
				result.rejectValue("username", "Matches", "This username is already used!");
				return "addshop.jsp";
			}
			return "redirect:/admin/home";
		}
	}

	// ****************************** R from {CRUD} ******************************
	// Functions allow the admin to see all partners
	@GetMapping("/admin/home")
	public String showShops(Model model) {
		List<Shop> shops = shopService.findAll();
		model.addAttribute("shops", shops);
		return "shop.jsp";
	}

	// ****************************** U from {CRUD} ******************************
	// Functions allow the admin to update shop information
	// To Do:allow admin to modify shop owner information
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
			shopService.updateShop(shop);
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
	
	
	@GetMapping("/admin/dashboard")
	public String AdminDashboard(Model model) {
		List<Shop> shops = shopService.findAll();
        model.addAttribute("shops", shops);
        long totalShops = shopService.getTotalShops();
        model.addAttribute("totalShops", totalShops);
		return "adminDashboard.jsp";
	}  
}
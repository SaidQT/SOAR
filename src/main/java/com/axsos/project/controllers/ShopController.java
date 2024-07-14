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

import jakarta.validation.Valid;

@Controller
public class ShopController {
	@Autowired
	ShopService shopService;

	@Autowired
	UserService userService;

	@GetMapping("/admin/add")
	public String addShop(@ModelAttribute("shopForm") ShopForm shopForm) {
		return "addshop.jsp";
	}

	@PostMapping("/admin/shops/new")
	public String createShop(@Valid @ModelAttribute("shopForm") ShopForm shopForm, BindingResult result) {

		if (result.hasErrors()) {
			System.out.println(shopForm.toString());
			return "addshop.jsp";
		} else {

			Shop shop = new Shop();
			shop.setName(shopForm.getShopName());
			shop.setCity(shopForm.getCity());
			shop.setPhoneNumber(shopForm.getPhoneNumber());
			shop.setMaxCapacity(shopForm.getMaxCapacity());
			shop.setCurrentSize(shopForm.getCurrentSize());
			shopService.createShop(shop);
			User shopOwner = userService.createShopOwner(shopForm.getUsername(), shopForm.getEmail(),
					shopForm.getPassword(), shop);
			if (shopOwner == null) {
				result.rejectValue("username", "Matches", "This username is already used!");
				return "addshop.jsp";
			}
			return "redirect:/admin/home";
		}
	}

	@GetMapping("/admin/home")
	public String showShops(Model model) {
		List<Shop> shops = shopService.findAll();
		model.addAttribute("shops", shops);
		return "shop.jsp";
	}

	@GetMapping("/admin/{id}/edit")
	public String showInfo(@PathVariable("id") Long id, Model model) {
		Shop shop = shopService.findShop(id);
		model.addAttribute("shop", shop);
		return "editshop.jsp";
	}

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
	
	@GetMapping("/aboutus")
	public String AboutUs(Model model) {
		model.addAttribute("allPartners", shopService.findAll());
		return "AboutUs.jsp";
	}
	
}
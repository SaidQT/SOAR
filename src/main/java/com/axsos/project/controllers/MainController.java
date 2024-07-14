package com.axsos.project.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.axsos.project.models.Contact;
import com.axsos.project.models.Shop;
import com.axsos.project.services.ContactService;
import com.axsos.project.services.EmailService;
import com.axsos.project.services.PetService;
import com.axsos.project.services.ShopService;
import com.axsos.project.services.UserService;

import jakarta.validation.Valid;

@Controller
public class MainController {
	// ****************************** Attributes ******************************
	@Autowired
	PetService petService;
	@Autowired
	UserService userService;
	@Autowired
	ShopService shopService;
	@Autowired
	private ContactService contactService;
	@Autowired
	private EmailService emailService;

	@GetMapping("/categoriesname")
	public String CategoriesName() {
		return "categoryName.jsp";
	}

	@GetMapping("/contactus")
	public String ContactUs() {

		return "ContactUs.jsp";
	}

	@GetMapping("/aboutus")
	public String AboutUs(Model model) {
		model.addAttribute("allPartners", shopService.findAll());
		return "AboutUs.jsp";
	}

	@GetMapping("/contact")
	public String showContactForm(Model model) {
		model.addAttribute("contact", new Contact());
		return "contact.jsp";
	}

	@PostMapping("/contact")
	public String submitContactForm(@Valid @ModelAttribute("contact") Contact contact, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			return "contact.jsp";
		}
		contactService.saveContact(contact);
		emailService.sendContactMessage(contact);
		model.addAttribute("successMessage", "Your message has been sent successfully!");
		return "redirect:/contact";
	}

	@GetMapping("/faqs")
	public String showFaqsForm(Model model) {
		model.addAttribute("contact", new Contact());

		return "faqs.jsp";
	}

	@PostMapping("/faqs")
	public String submitFaqsForm(@Valid @ModelAttribute("contact") Contact contact, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "faqs.jsp";
		}
		contactService.saveContact(contact);
		emailService.sendContactMessage(contact);
		model.addAttribute("successMessage", "Your message has been sent successfully!");
		return "faqs.jsp";
	}

	@GetMapping("/partners")
	public String showPartners(Model model) {
		List<Shop> shop = shopService.findAll();
		model.addAttribute("shops", shop);
		return "partners.jsp";
	}

}
package com.axsos.project.controllers;

import java.security.Principal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.axsos.project.models.LoginUser;
import com.axsos.project.models.Pet;
import com.axsos.project.models.User;
import com.axsos.project.services.PetService;
import com.axsos.project.services.UserService;
import com.axsos.project.validator.UserValidator;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	// ****************************** Attributes ******************************
	@Autowired
	private UserService userService;
	@Autowired
	private PetService petService;
	private final UserValidator userValidator;

	// ****************************** Constructor ******************************
	UserController(UserValidator userValidator) {
		this.userValidator = userValidator;
	}

	// ****************************** R from {CRUD} ******************************
	// Function to render the page that contains forms for login and registration
	@RequestMapping("/login")
	public String loginAndRegisterForm(@ModelAttribute("user") User user, Model model,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
		model.addAttribute("newLogin", new LoginUser());

		if (error != null) {
			model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
		}
		model.addAttribute("activeTab", "login");
		return "login.jsp";
	}

	// Function to submit the Register form
	@PostMapping("/register")
	public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model,
			HttpSession session, HttpServletRequest request) {
		userValidator.validate(user, result);

		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			model.addAttribute("activeTab", "register");
			return "login.jsp";
		}

		// Determine user role based on existing users
		String role = userService.allUsers().isEmpty() ? "ROLE_ADMIN" : "ROLE_USER";
		userService.newUser(user, role);

		// Log in new user with the password we stored before encrypting it
		authWithHttpServletRequest(request, user.getUsername(), user.getPassword());
		return "redirect:/login";
	}

	public void authWithHttpServletRequest(HttpServletRequest request, String email, String password) {
		try {
			request.login(email, password);
		} catch (ServletException e) {
			System.out.println("Error while login: " + e);
		}
	}

	// ****************************** R from {CRUD} ******************************
	// Function to render the home page
	@GetMapping({ "/", "/home" })
	public String home() {

		return "home.jsp";
	}

	// Function to render a page that show all pets
	@GetMapping("/cart")
	public String showPets(Model model, Principal principal, HttpSession session) {
		List<Pet> pets = petService.allPets();
		String activeFilter = (String) session.getAttribute("activeFilter");

		if (activeFilter != null) {
			pets = pets.stream().filter(pet -> pet.getType().equalsIgnoreCase(activeFilter))
					.collect(Collectors.toList());
		}

		model.addAttribute("pets", pets);
		if (principal != null) {
			String username = principal.getName();
			User user = userService.findByUsername(username);
			model.addAttribute("currentUser", user);
		}

		model.addAttribute("activeFilter", activeFilter);
		return "cart.jsp";
	}

	// This one is to filter cats
	@GetMapping("/cart/cat")
	public String showCats(HttpSession session) {
		session.setAttribute("activeFilter", "cat");
		return "redirect:/cart";
	}

	// This one is to filter dogs
	@GetMapping("/cart/dog")
	public String showDogs(HttpSession session) {
		session.setAttribute("activeFilter", "dog");
		return "redirect:/cart";
	}

	// This one is to filter birds
	@GetMapping("/cart/bird")
	public String showBirds(HttpSession session) {
		session.setAttribute("activeFilter", "bird");
		return "redirect:/cart";
	}

	// This one is for all pets
	@GetMapping("/cart/all")
	public String showAll(HttpSession session) {
		session.removeAttribute("activeFilter");
		return "redirect:/cart";
	}

	// Function for users to add/remove pets for favorite {using Ajax}
	@PostMapping("/public/cart/add")
	@ResponseBody
	public Map<String, String> addPetToUserCart(@RequestParam(name = "petId") Long petId, Principal principal) {
		String username = principal.getName();
		User user = userService.findByUsername(username);
		Pet pet = petService.findPet(petId);

		Map<String, String> response = new HashMap<>();

		if (user != null && pet != null) {
			if (user.getPets().contains(pet)) {
				pet.getUsers().remove(user);
				petService.createPet(pet);
				response.put("action", "removed");
			} else {
				pet.getUsers().add(user);
				petService.createPet(pet);
				response.put("action", "added");
			}
		} else {
			response.put("action", "error");
		}
		return response;
	}

	// Function to get user favorite list
	@GetMapping("/wish")
	public String favoritePage(Principal principal, Model model) {
		String username = principal.getName();
		User user = userService.findByUsername(username);
		List<Pet> pets = user.getPets();
		model.addAttribute("favorite", pets);
		return "wishlist.jsp";
	}

	@GetMapping("/user/favorites")
	public String Favorite(Principal principal, Model model) {
		return "redirect:/wish";
	}

	// Function to render the page that contains user adoption request and their status
	@GetMapping("/besties")
	public String besties(Principal principal, Model model) {
		String username = principal.getName();
		User user = userService.findByUsername(username);
		List<Pet> requestPets = user.getAdoptedPets();
		List<Pet> pendingPet = user.getRequestedPets();
		model.addAttribute("requestPets", requestPets);
		model.addAttribute("pending", pendingPet);
		return "besties.jsp";
	}

	@GetMapping("/user/besties")
	public String userBesties(Principal principal, Model model) {
		String username = principal.getName();
		User user = userService.findByUsername(username);
		List<Pet> requestPets = user.getAdoptedPets();
		if (requestPets != null) {
			Iterator<Pet> iterator = requestPets.iterator();
			while (iterator.hasNext()) {
				Pet pet = iterator.next();
				if (pet.getStatus().equals("Pending")) {
					iterator.remove();
				}
			}
			model.addAttribute("requestPets", requestPets);
		}
		return "redirect:/besties";
	}

	// ****************************** U from {CRUD} ******************************
	// Function to canaling adoption request while request still pending
	/*
	 * @PatchMapping("/user/cancel") public String cancelRequest(@RequestParam(name
	 * = "petId") Long petId, Principal principal) { Pet pet =
	 * petService.findPet(petId); String username = principal.getName(); User user =
	 * userService.findByUsername(username); pet.setUser(null);
	 * pet.setStatus("Unadopted"); petService.createPet(pet);
	 * user.removeAdoptedPet(pet); // user.addRefusedPets(pet);
	 * userService.updateUser(user); return "redirect:/user/besties"; }
	 */

}
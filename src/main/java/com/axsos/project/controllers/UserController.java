package com.axsos.project.controllers;

import java.security.Principal;
import java.util.List;
import java.util.Set;
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
		// if (logout != null) {
		// model.addAttribute("logoutMessage", "Logout Successful!");
		// }
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
	public String home(Principal principal, Model model) {
		String username = principal.getName();

		model.addAttribute("currentUser", userService.findByUsername(username));
		return "home.jsp";
	}

	// ****************************** R from {CRUD} ******************************
	// Function to render a page that show all pets
	// To Do: Add filtering to pets according to type
	@GetMapping("/cart") // public/cart
	public String showPets(Model model, Principal principal, HttpSession session) {
		List<Pet> pets = petService.allPets();
		model.addAttribute("pets", pets);
		String activeFilter = (String) session.getAttribute("activeFilter");
		if (activeFilter == null) {
			activeFilter = "all"; // Default filter
		}
		model.addAttribute("activeFilter", activeFilter);
		if (principal != null) {
			String username = principal.getName();
			User currentUser = userService.findByUsername(username);
			model.addAttribute("currentUser", currentUser);

			// Check if each pet is favorited by the current user
			Set<Long> favoritePetIds = currentUser.getPets().stream().map(Pet::getId).collect(Collectors.toSet());
			model.addAttribute("favoritePetIds", favoritePetIds);
		}

		return "cart.jsp";
	}

	@PostMapping("/public/cart/add")
	public String addPetToUserCart(@RequestParam(name = "petId") Long petId, @RequestParam("location") String location,
			Principal principal, HttpSession session) {
		String username = principal.getName();
		User user = userService.findByUsername(username);
		Pet pet = petService.findPet(petId);

		if (user != null && pet != null) {
			if (!user.getPets().contains(pet)) {
				user.getPets().add(pet);
			} else {
				user.getPets().remove(pet);
			}
			userService.saveUser(user); // Save changes to the user
			session.setAttribute("flag", user.getPets().contains(pet));
		}

		if ("wishlist".equals(location)) {
			return "redirect:/wishlist";
		}
		return "redirect:/cart";
	}

	@GetMapping("/wishlist") // user/wishlist
	public String showWishlist(Model model, Principal principal) {
		if (principal != null) {
			String username = principal.getName();
			User user = userService.findByUsername(username); // Fetch the current user
			model.addAttribute("currentUser", user); // Add the current user to the model
			model.addAttribute("favorites", user.getPets()); // Add the user's favorite pets to the model
		}
		return "wishlist.jsp"; // Return the name of the wishlist JSP view
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
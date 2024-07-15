package com.axsos.project.controllers;

import java.security.Principal;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
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
	public String home() {

		return "home.jsp";
	}

	// ****************************** R from {CRUD} ******************************
	// Function to render a page that show all pets
	// To Do: Add filtering to pets according to type
	@GetMapping("/cart")
	public String showPets(Model model, Principal principal, HttpSession session) {
		List<Pet> pets = petService.allPets();
		model.addAttribute("pets", pets);

		if (principal != null) {
			String username = principal.getName();
			model.addAttribute("currentUser", userService.findByUsername(username));
		}
		// We use flag variable in order to check if this
		if (session.getAttribute("flag") != null) {
			boolean flag = (boolean) session.getAttribute("flag");
			model.addAttribute("flag", flag);
		}
		return "cart.jsp";
	}

	@PostMapping("/public/cart/add")
	public String addPetToUserCart(@RequestParam(name = "petId") Long petId, @RequestParam("location") String location,
			Principal principal, HttpSession session) {
		String username = principal.getName();
		User user = userService.findByUsername(username);
		Pet pet = petService.findPet(petId);
		System.out.print(user.getRoles().get(0).getName());
		boolean flag = user.getPets().contains(pet);
		session.setAttribute("flag", flag);
		if (user != null && pet != null && !user.getPets().contains(pet)) { // checks if there is a principal, and if
			// the user has favorited this pet
			pet.getUsers().add(user);
			petService.createPet(pet);

			return "redirect:/cart";

		} else if (user != null && pet != null && user.getPets().contains(pet)) {
			pet.getUsers().remove(user);
			petService.createPet(pet);
			if (location.equals("cart")) { // checks if the current user is on the favorites page or the public page
				return "redirect:/cart";
			}
			if (location.equals("favorite")) {
				return "redirect:/user/favorites";
			}
		}
		return "redirect:/cart";
	}

	@GetMapping("/wish")
	public String FavoritePage(Principal principal, Model model) {
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

	// ****************************** R from {CRUD} ******************************
	// Function to render the page that contains user adoption request and their
	// status
	@GetMapping("/user/besties")
	public String userBesties(Principal principal, Model model) {
		String username = principal.getName();
		User user = userService.findByUsername(username);
		List<Pet> requestPets = user.getAdoptedPets();
		// List<Pet> resfuedPets = user.getRefusedPets();
		// List<Pet> pets = user.getAdoptedPets();
		// List<Pet> userPets = new ArrayList<>();
		// Pet tempPet = new Pet();
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

		// System.out.println("Requ pets");
		// for (Pet x : requestPets) {
		// System.out.println("Requ pets"+x.getStatus()+ " "+x.getName());
		// }
		// System.out.println("refused pets");
		// for (Pet x : resfuedPets) {
		// System.out.println(x.getStatus()+ " "+x.getName());
		// }
		// model.addAttribute("refusedPets", resfuedPets);
		return "besties.jsp";
	}

	// ****************************** U from {CRUD} ******************************
	// Function to canaling adoption request while request still pending
	@PatchMapping("/user/cancel")
	public String cancelRequest(@RequestParam(name = "petId") Long petId, Principal principal) {
		Pet pet = petService.findPet(petId);
		String username = principal.getName();
		User user = userService.findByUsername(username);
		// Step for remove relationship {adoption} between user and pet:
		// *) Remove relationship between pet and user (1 user --adapt-- M pets) from
		// pet side
		// --> By make the user null in the pet
		// *) Remove relationship between pet and user (1 user --adapt-- M pets) from
		// user side
		// --> By remove the pet from adoptedPet list for user
		// *) Update the pet status to be Unadopted
		// *) Add the pet in the cancel request in the refusedPets list for the user
		// *) Save the changes in both pet and user
		pet.setUser(null);
		pet.setStatus("Unadopted");
		petService.createPet(pet);
		user.removeAdoptedPet(pet);
		// user.addRefusedPets(pet);
		userService.updateUser(user);
		return "redirect:/user/besties";
	}

}
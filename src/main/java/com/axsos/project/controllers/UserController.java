package com.axsos.project.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.axsos.project.models.Contact;
import com.axsos.project.models.LoginUser;
import com.axsos.project.models.Pet;
import com.axsos.project.models.User;
import com.axsos.project.services.ContactService;
import com.axsos.project.services.EmailService;
import com.axsos.project.services.PetService;
import com.axsos.project.services.UserService;
import com.axsos.project.validator.UserValidator;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	// ******************* Attributes *******************
	@Autowired
	private ContactService contactService;

	@Autowired
	private EmailService emailService;

	@Autowired
	private UserService userService;

	@Autowired
	private PetService petService;

	private final UserValidator userValidator;

	// ******************* Constructor *******************
	UserController(UserValidator userValidator) {
		this.userValidator = userValidator;
	}

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
			return "login.jsp"; // Stay on the registration page if there are errors
		}

		// Determine user role based on existing users
		String role = userService.allUsers().isEmpty() ? "ROLE_ADMIN" : "ROLE_USER";
		userService.newUser(user, role);

		// Log in new user with the password we stored before encrypting it
		// authenticateUserAndSetSession(user, request);

		authWithHttpServletRequest(request, user.getUsername(), user.getPassword());

		return "redirect:/login"; // Redirect to home page after successful registration

	} // Redirect to home page after successful registration

	public void authWithHttpServletRequest(HttpServletRequest request, String email, String password) {
		try {
			request.login(email, password);
		} catch (ServletException e) {
			System.out.println("Error while login: " + e);
		}
	}

	@RequestMapping("/user")
	public String userPage(Principal principal, Model model) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByUsername(username));
		return "userPage.jsp";
	}

	@GetMapping("/public")
	public String publicPage(Principal principal, Model model) {
		return "publicPage.jsp";
	}

	@GetMapping({ "/", "/home", "/user/home" })
	public String home(Principal principal, Model model) {
		String username = principal.getName();

		model.addAttribute("currentUser", userService.findByUsername(username));
		return "home.jsp";
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

	@GetMapping("/user")
	public String user(@ModelAttribute("pet") Pet pet) {
		return "UserPage.jsp";
	}

	@PostMapping("/user/pets/new")
	public String createShop(@Valid @ModelAttribute("pet") Pet pet, BindingResult result) {
		if (result.hasErrors()) {
			return "UserPage.jsp";
		} else {
			pet.setStatus("Unadopted");
			petService.createPet(pet);
			return "redirect:/user";
		}
	}

	@GetMapping("/public/cart")
	public String showPets(Model model, Principal principal, HttpSession session) {
		List<Pet> pets = petService.allPets();
		model.addAttribute("pets", pets);

		if (principal != null) {
			String username = principal.getName();
			model.addAttribute("currentUser", userService.findByUsername(username));
		}
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

			return "redirect:/public/cart";

		} else if (user != null && pet != null && user.getPets().contains(pet)) {
			pet.getUsers().remove(user);
			petService.createPet(pet);
			if (location.equals("cart") ) { // checks if the current user is on the favorites page or the public page
				return "redirect:/public/cart";
			}
			if (location.equals("favorite")) {
				return "redirect:/user/favorites";
			}
		}
		return "redirect:/public/cart";
	}
	
	
	// @GetMapping("/login")
	// public String index(Model model) {
	// model.addAttribute("newUser", new User());
	// model.addAttribute("newLogin", new LoginUser());
	// return "login.jsp";
	// }

	// @GetMapping("/x")
	// public String contactUs(Model model) {
	// return "newPet.jsp";
	// }

	// @PostMapping("/register")
	// public String register(@Valid @ModelAttribute("newUser") User newUser,
	// BindingResult result, Model model,
	// HttpSession session) {
	// User registeredUser = userService.register(newUser, result);
	//
	// if (result.hasErrors()) {
	// model.addAttribute("newLogin", new LoginUser());
	// return "login.jsp";
	// }
	//
	// // Store user ID in session (log them in)
	// session.setAttribute("userId", registeredUser.getId());
	//
	// return "redirect:/home";
	// }
	//
	// @PostMapping("/login")
	// public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,
	// BindingResult result, Model model,
	// HttpSession session) {
	// User user = userService.login(newLogin, result);
	//
	// if (result.hasErrors()) {
	// model.addAttribute("newUser", new User());
	// return "login.jsp";
	// }
	//
	// session.setAttribute("userId", user.getId());
	//
	// return "redirect:/home";
	// }

	// @GetMapping("/home")
	// public String home(HttpSession session, Model model) {
	// Long userId = (Long) session.getAttribute("userId");
	// if (userId == null) {
	// return "redirect:/";
	// }
	//
	// Optional<User> user = userService.findUserById(userId);
	// if (user.isPresent()) {
	// model.addAttribute("user", user.get());
	// return "home.jsp";
	// } else {
	// session.invalidate();
	// return "redirect:/";
	// }
	// }

	// @GetMapping("/home")
	// public String home1(Model model) {
	// return "home.jsp";
	// }

	@GetMapping("/cats")
	public String cats(Model model) {
		return "cats.jsp";
	}

	@GetMapping("/dogs")
	public String dogs(Model model) {
		return "dogs.jsp";
	}

	@GetMapping("/birds")
	public String birds(Model model) {
		return "birds.jsp";
	}
}
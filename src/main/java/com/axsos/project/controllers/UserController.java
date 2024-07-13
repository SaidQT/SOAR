package com.axsos.project.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
//
//	@PostMapping("/login")
//	public String login(@RequestParam String username, @RequestParam String password, HttpSession session) {
//		try {
//			Authentication authentication = authenticationManager
//					.authenticate(new UsernamePasswordAuthenticationToken(username, password));
//			SecurityContextHolder.getContext().setAuthentication(authentication);
//			return "redirect:/home"; // Redirect to home on successful login
//		} catch (BadCredentialsException e) {
//			// Handle bad credentials
//			return "login"; // Return to login page with error
//		}
//	}

	// Function to submit the Register form
	/*
	 * @PostMapping("/register") public String
	 * registration(@Valid @ModelAttribute("user") User user, BindingResult result,
	 * Model model, HttpSession session, HttpServletRequest request) {
	 * userValidator.validate(user, result);
	 * 
	 * if (result.hasErrors()) {
	 * 
	 * model.addAttribute("newLogin",new LoginUser());
	 * model.addAttribute("activeTab", "register"); return "login.jsp"; // Stay on
	 * the registration page if there are errors }
	 * 
	 * // Determine user role based on existing users String role =
	 * userService.allUsers().isEmpty() ? "ROLE_ADMIN" : "ROLE_USER";
	 * userService.newUser(user, role); // System.out.print(role); // Log in new
	 * user with the password we stored before encrypting it
	 * authWithHttpServletRequest(request, user.getUsername(), user.getPassword());
	 * 
	 * return "redirect:/login"; // Redirect to home page after successful
	 * registration }
	 */
	// We will call this method to automatically log in newly registered users
//	public void authWithHttpServletRequest(HttpServletRequest request, String username, String password) {
//		try {
//			request.login(username, password);
//		} catch (ServletException e) {
//			System.out.println("Error while login: " + e);
//		}
//	}
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
//		authenticateUserAndSetSession(user, request);

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

//	private void authenticateUserAndSetSession(User user, HttpServletRequest request) {
//		try {
////			UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(user.getUsername(),
////					user.getPassword());
////			Authentication authentication = authenticationManager.authenticate(authToken);
////			SecurityContextHolder.getContext().setAuthentication(authentication);
//			Authentication authentication = authenticationManager
//					.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword()));
//			SecurityContextHolder.getContext().setAuthentication(authentication);
//			request.getSession().setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY,
//					SecurityContextHolder.getContext());
//		} catch (Exception e) {
//			e.printStackTrace(); // Log the error or handle it appropriately
//		}
//	}

	@RequestMapping("/admin/add")
	public String adminPage(Principal principal, Model model) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByUsername(username));
		return "adminPage.jsp";
	}

	@RequestMapping("/user")
	public String userPage(Principal principal, Model model) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByUsername(username));
		return "userPage.jsp";
	}

	@RequestMapping("/public")
	public String publicPage(Principal principal, Model model) {
		return "publicPage.jsp";
	}

	@RequestMapping(value = { "/", "/home", "/user/home" })
	public String home(Principal principal, Model model) {
		String username = principal.getName();

		model.addAttribute("currentUser", userService.findByUsername(username));
		return "home.jsp";
	}

	@RequestMapping("/admin/home")
	public String adminHome(Principal principal, Model model) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByUsername(username));
		return "homeAdminPage.jsp";
	}

	@GetMapping("/contact")
	public String showContactForm(Model model) {
		model.addAttribute("contact", new Contact());
		return "ContactUs.jsp";
	}

	@PostMapping("/contact")
	public String submitContactForm(@Valid @ModelAttribute("contact") Contact contact, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			return "ContactUs.jsp";
		}
		contactService.saveContact(contact);
		emailService.sendContactMessage(contact);
		model.addAttribute("successMessage", "Your message has been sent successfully!");
		return "ContactUs.jsp";
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
	public String showPets(Model model, Principal principal) {
		List<Pet> pets = petService.allPets();
		model.addAttribute("pets", pets);
		if (principal != null) {
			String username = principal.getName();
			model.addAttribute("currentUser", userService.findByUsername(username));
		}
		return "cart.jsp";
	}

	@PostMapping("/public/cart/add")
	public String addPetToUserCart(@RequestParam Long petId, Principal principal) {
		String username = principal.getName();
		User user = userService.findByUsername(username);
		Pet pet = petService.findPet(petId);
		System.out.print(user.getRoles().get(0).getName());
		if (user != null && pet != null) {
			pet.getUsers().add(user);
			petService.createPet(pet);

			return "cart.jsp";
		} else {
			return "redirect:/user/cart";
		}
	}

	// @GetMapping("/login")
	// public String index(Model model) {
	// model.addAttribute("newUser", new User());
	// model.addAttribute("newLogin", new LoginUser());
	// return "login.jsp";
	// }

//	@GetMapping("/x")
//	public String contactUs(Model model) {
//		return "newPet.jsp";
//	}

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
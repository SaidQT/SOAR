package com.axsos.project.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {
	// ******************* Attributes *******************
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty(message = "Username is required!")
	@Size(min = 3, max = 30, message = "Username must be between 3 and 30 characters")
	@Column(unique = true)
	private String username;

	@NotEmpty(message = "Email is required!")
	@Email(message = "Please enter a valid email!")
	private String email;

	@NotEmpty(message = "Password is required!")
	@Size(min = 5, message = "Password must be greater than 5 characters")
	private String password;

	@Transient
	@NotEmpty(message = "Confirm Password is required!")
	private String passwordConfirmation;

	private Date createdAt;
	private Date updatedAt;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "users_roles", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	private List<Role> roles;

	@ManyToMany //This relationship is established for users who wish to like the pet. 
	@JoinTable(name = "user_pet", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "pet_id"))
	private List<Pet> pets;

	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY)//This relationship is established for users who adopt the pet.
	private List<Pet> adoptedPets;

	@ManyToMany //This relationship is established for users who wants to request adopting the pet
	@JoinTable(name = "requests", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "pet_id"))
	private List<Pet> requestedPets;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "shop_id")
	private Shop shop;

	// ******************* Constructor *******************
	public User() {
		this.roles = new ArrayList<Role>();
		this.adoptedPets = new ArrayList<Pet>();
		this.pets = new ArrayList<Pet>();
	}
	// ******************* Setters and Getters *******************

	public Long getId() {
		return id;
	}

	public List<Pet> getRequestedPets() {
		return requestedPets;
	}

	public void setRequestedPets(List<Pet> requestedPets) {
		this.requestedPets = requestedPets;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}

	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public void addRole(Role role) {

		this.roles.add(role);
	}

	public List<Pet> getAdoptedPets() {
		return adoptedPets;
	}

	public void setAdoptedPets(List<Pet> adoptedPets) {
		this.adoptedPets = adoptedPets;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public List<Pet> getPets() {
		return pets;
	}

	public void setPets(List<Pet> pets) {
		this.pets = pets;
	}

	// Function to add a new adopted pet
	public void addAdoptedPet(Pet pet) {
		this.adoptedPets.add(pet);
	}

	// Function to remove a pet from adopted pet
	public void removeAdoptedPet(Pet pet) {
		this.adoptedPets.remove(pet);
	}

	// ******************* For create and update *******************
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
}
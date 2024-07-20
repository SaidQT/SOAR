package com.axsos.project.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "pets")
public class Pet {
	// ******************* Attributes *******************
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	@Size(min = 2, max = 200, message = "Pet name must be at least 2 characters")
	private String name;

	@NotNull
	@Size(min = 2, max = 200, message = "Pet type must be at least 2 characters")
	private String type;

	@NotNull
	@Size(min = 2, max = 200, message = "Pet breed must be at least 2 characters")
	private String breed;

	@NotNull
	@Size(min = 2, max = 200, message = "City name must be at least 2 characters")
	private String city;

	//	@NotNull
	@Min(0)
	private Float age;

	@NotNull(message = "Image URL is required")
	@Size(min = 2, message = "Image URL must be at least 2 characters")
	@Column(columnDefinition = "TEXT")
	private String imageUrl;

	@NotNull
	@Size(min = 5, message = "Description must be at least 5 characters")
	@Column(columnDefinition = "TEXT")
	private String description;

	@Size(min = 3)
	private String status;

	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

	@ManyToMany // this relationship is for favorites
	@JoinTable(name = "user_pet", joinColumns = @JoinColumn(name = "pet_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> users;

	@ManyToOne(fetch = FetchType.LAZY) // this relationship is for adopting pets
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToMany
	@JoinTable(name = "requests", joinColumns = @JoinColumn(name = "pet_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> request;

	@ManyToOne(fetch = FetchType.LAZY) // this relationship is for shops and pets
	@JoinColumn(name = "shop_id")
	private Shop shop;

	// ******************* Constructor *******************
	public Pet() {
	}

	// ******************* Setters and Getters *******************
	public List<User> getRequest() {
		return request;
	}

	public Float getAge() {
		return age;
	}

	public void setAge(Float age) {
		this.age = age;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setRequest(List<User> request) {
		this.request = request;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
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
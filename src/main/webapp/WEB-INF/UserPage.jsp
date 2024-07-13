<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
.carousel-item img {
	border-radius: 50%;
	max-width: 100%;
	height: auto;
}

.carousel-caption {
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	display: none;
}

.carousel-control-prev::after {
	content: '<';
	font-size: 2rem;
	color: black;
}

.carousel-control-next::after {
	content: '>';
	font-size: 2rem;
	color: black;
}

.pet-category {
	margin-top: 20px;
}

.pet-category img {
	max-width: 100%;
	height: auto;
	border-radius: 10px;
	cursor: pointer;
	transition: transform 0.3s ease;
}

.pet-category img:hover {
	transform: scale(1.1);
}

nav img {
	width: 60px;
	height: auto;
	display: block;
	margin: 0 auto;
	margin-right: 20px;
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light w-100">
		<img src="<spring:url value='/images/cat.png' />" alt="Cat"> <a
			class="navbar-brand" href="/">Brand</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="/">Home
						<span class="sr-only">(current)</span>
				</a></li>

				<li class="nav-item"><a class="nav-link" href="/loginregister">Login&Register</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/favoritepage">Favorite</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/categoriesname">Categories</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/contactus">Contact
						Us</a></li>
				<li class="nav-item"><a class="nav-link" href="/aboutus">About
						Us</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">
					<i class="fas fa-search"></i>
				</button>
			</form>
		</div>
	</nav>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="d-flex align-items-center">
					<img src="https://via.placeholder.com/200" class="d-block mx-auto"
						alt="...">
					<div class="carousel-caption d-none d-md-block w-50">
						<h5>First Slide Label</h5>
						<p>Some representative placeholder content for the first
							slide.</p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="d-flex align-items-center">
					<img src="https://via.placeholder.com/200" class="d-block mx-auto"
						alt="...">
					<div class="carousel-caption d-none d-md-block w-50">
						<h5>Second Slide Label</h5>
						<p>Some representative placeholder content for the second
							slide.</p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="d-flex align-items-center">
					<img src="https://via.placeholder.com/200" class="d-block mx-auto"
						alt="...">
					<div class="carousel-caption d-none d-md-block w-50">
						<h5>Third Slide Label</h5>
						<p>Some representative placeholder content for the third
							slide.</p>
					</div>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>

	<div class="container pet-category">
		<h2>Pet Categories</h2>
		<div class="row">
			<div class="col-md-3">
				<a href="/categoriesname"> <img
					src="https://via.placeholder.com/200x200" alt="Pet Category 1">
				</a>
			</div>
			<div class="col-md-3">
				<a href="/categoriesname"> <img
					src="https://via.placeholder.com/200x200" alt="Pet Category 2">
				</a>
			</div>
			<div class="col-md-3">
				<a href="/categoriesname"> <img
					src="https://via.placeholder.com/200x200" alt="Pet Category 3">
				</a>
			</div>
			<div class="col-md-3">
				<a href="/categoriesname"> <img
					src="https://via.placeholder.com/200x200" alt="Pet Category 4">
				</a>
			</div>
		</div>
	</div>
	<form:form action="/user/pets/new" method="post" modelAttribute="pet">
		<p>

			<form:input path="name" placeholder="Name" required="true" />

		</p>
		<p>

			<form:select path="type">
				<form:option value="dog">Dog</form:option>
				<form:option value="cat">Cat</form:option>
				<form:option value="bird">Bird</form:option>
				<form:option value="other">Other</form:option>
			</form:select>
		</p>
		<p>
			<form:input path="city" required="true" placeholder="City" />
		</p>
		<p>

			<form:textarea path="imageUrl" placeholder="Image URL"
				required="true" />
		</p>
		<p>

			<form:textarea path="description" required="true"
				placeholder="Description" />
		</p>
		<p>
			<form:errors path="name" />
		</p>
		<p>
			<form:errors path="type" />
		</p>
		<p>
			<form:errors path="city" />
		</p>
		<p>
			<form:errors path="imageUrl" />
		</p>
		<p>
			<form:errors path="description" />
		</p>
		<p>
			<form:errors path="status" />
		</p>

		<input type="submit" value="Add Pet" />
	</form:form>

	<footer class="footer bg-dark text-light">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<h5>Social Media</h5>
					<ul class="list-unstyled">
						<li><a href="https://www.facebook.com" target="_blank"><i
								class="fab fa-facebook-square"></i> Facebook</a></li>
						<li><a href="https://www.instagram.com" target="_blank"><i
								class="fab fa-instagram-square"></i> Instagram</a></li>
						<li><a href="https://www.youtube.com" target="_blank"><i
								class="fab fa-youtube-square"></i> YouTube</a></li>
						<li><a href="https://www.twitter.com" target="_blank"><i
								class="fab fa-twitter-square"></i> Twitter</a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<h5>Contact Us</h5>
					<ul class="list-unstyled">
						<li><i class="fas fa-phone-square-alt"></i> Phone: <a
							href="tel:+05685...">+05685...</a></li>
						<li><i class="far fa-envelope"></i> Email: <a
							href="mailto:test.test@gmail.com">test.test@gmail.com</a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<h5>
						<a href="/aboutus#ourPartners">Our Partners</a>
					</h5>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-12 text-center">
					<p>&copy; 2024 Your Company. All rights reserved.</p>
				</div>
			</div>
		</div>
	</footer>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

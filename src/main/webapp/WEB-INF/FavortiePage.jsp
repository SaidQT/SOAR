<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Categories</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
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

.pet-card img {
	max-width: 100%;
	height: auto;
	border-radius: 10px;
	cursor: pointer;
	transition: transform 0.3s ease;
	position: relative;
}

.pet-card .favorite-icon {
	position: absolute;
	top: 10px;
	right: 10px;
	color: red;
	font-size: 24px;
	cursor: pointer;
}

.pet-card .favorite-icon.favorited {
	color: red;
}

.pet-card .dummy-data {
	text-align: center;
	margin-top: 10px;
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
				<li class="nav-item"><a class="nav-link" href="/contact">Contact
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
	<div class="container pet-category">
		<div class="row">
			<c:forEach var="pet" items="${favorite}">
				<div class="col-md-4">
					<div class="pet-card">
						<img src="${pet.imageUrl}" alt="${pet.name}"> </a> <i
							class="favorite-icon far fa-heart" data-pet-id="1"></i>
						<div class="dummy-data">
							<p>
								<c:out value="${pet.type}"></c:out>
							</p>
							<p>
								<c:out value="${pet.name}"></c:out>
							</p>

						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
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
	<script>
		$(document).ready(function() {
			$('.favorite-icon').click(function() {
				$(this).toggleClass('favorited');
			});
		});
	</script>
</body>
</html>

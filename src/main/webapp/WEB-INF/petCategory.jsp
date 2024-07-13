<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Details</title>
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
  <img src="<spring:url value='/images/cat.png' />" alt="Cat">
  <a class="navbar-brand" href="/">Brand</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/loginregister">Login & Register</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/favoritepage">Favorite</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/categoriesname">Categories</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/contactus">Contact Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/aboutus">About Us</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
        <i class="fas fa-search"></i>
      </button>
    </form>
  </div>
</nav>

<div class="container">
  <div class="row">
    <div class="col-md-4">
      <img src="${pet.imageUrl}" alt="Pet Image" class="img-fluid rounded">
    </div>
    <div class="col-md-8">
      <h2>Pet Category Details for Pet ID: ${pet.name}</h2>
      <p>Type: ${pet.type}</p>
      <p>Description: ${pet.description}</p>
      <p>City: ${pet.city}</p>
      <p>Status: ${pet.status}</p>
      <div class="container mt-4">
        <a href="/categoriesname" class="btn btn-primary">Make it your besties</a>
      </div>
    </div>
  </div>
</div>

<footer class="footer bg-dark text-light mt-5">
  <div class="container">
    <div class="row">
      <div class="col-md-4">
        <h5>Social Media</h5>
        <ul class="list-unstyled">
          <li><a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook-square"></i> Facebook</a></li>
          <li><a href="https://www.instagram.com" target="_blank"><i class="fab fa-instagram-square"></i> Instagram</a></li>
          <li><a href="https://www.youtube.com" target="_blank"><i class="fab fa-youtube-square"></i> YouTube</a></li>
          <li><a href="https://www.twitter.com" target="_blank"><i class="fab fa-twitter-square"></i> Twitter</a></li>
        </ul>
      </div>
      <div class="col-md-4">
        <h5>Contact Us</h5>
        <ul class="list-unstyled">
          <li><i class="fas fa-phone-square-alt"></i> Phone: <a href="tel:+05685...">+05685...</a></li>
          <li><i class="far fa-envelope"></i> Email: <a href="mailto:test.test@gmail.com">test.test@gmail.com</a></li>
        </ul>
      </div>
      <div class="col-md-4">
        <h5><a href="/aboutus#ourPartners">Our Partners</a></h5>
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

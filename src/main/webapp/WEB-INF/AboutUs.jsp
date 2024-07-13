<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
.about-section img {
	max-width: 100%;
	height: auto;
	border-radius: 10px;
	cursor: pointer;
	transition: transform 0.3s ease;
}

.about-section img:hover {
	transform: scale(1.1);
}

.partner-section img {
	max-width: 100%;
	height: auto;
	border-radius: 10px;
	cursor: pointer;
	transition: transform 0.3s ease;
}

.partner-section img:hover {
	transform: scale(1.1);
}

.hr {
	margin: 20px 0;
}

img {
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
<!-- 				<li class="nav-item"><a class="nav-link" href="/login">Login&Register</a>
 -->				</li>
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


<div class="container">
  <div class="row about-section mt-4">
    <div class="col-md-4">
      <img src="https://cdn.prod.website-files.com/62196607bf1b46c300301846/6568adc6401542df279ea6c3_bb8sa1slxdbdyjqqb5mn-p-800.webp" alt="About Us Image">
    </div>
    <div class="col-md-8">
      <h2>About Us</h2>
      <p>We take care of pet care, providing them with support and life care. You can adopt these pets and give them a loving home.</p>
    </div>
  </div>


  <div class="row partner-section mt-4" id="ourPartners">
    <div class="col-12">
      <h1>Our Partners</h1>
    </div>
    <!-- Loop for three cards -->
    <c:forEach items="${allPartners}" var="partner" varStatus="loop">
      <c:if test="${loop.index < 3}">
        <div class="col-md-4 mb-4">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">${partner.name}</h5>
              <p class="card-text">City: ${partner.city}</p>
              <p class="card-text">Max Capacity: ${partner.maxCapacity}</p>
              <p class="card-text">Current Size: ${partner.currentSize}</p>
              <p class="card-text">Phone Number: ${partner.phoneNumber}</p>
            </div>
          </div>
        </div>
      </c:if>
    </c:forEach>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<hr class="hr">

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

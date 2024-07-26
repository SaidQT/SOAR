<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<html lang="en">

<head>
<title>SOAR</title>
<!-- <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="description" content=""> -->


<style>

/* Adjust image size and spacing */
.swiper-slide .col-md-2 {
	text-align: center;
	padding-top: 20px; /* Adjust spacing between image and text */
}

.swiper-slide .col-md-2 img {
	max-width: 100%;
	height: auto;
	border-radius: 50%; /* Creates a circular shape for the image */
}

/* Adjust text alignment and spacing */
.swiper-slide .col-md-10 {
	padding: 20px; /* Adjust padding as needed */
}

#testimonial p {
	font-size: 1.2rem; /* Adjust font size as needed */
	line-height: 1.6; /* Adjust line height for readability */
	margin-bottom: 20px; /* Add some bottom margin between paragraphs */
}

#testimonial .swiper-slide {
	display: flex; /* Ensure each slide takes full width */
	justify-content: center; /* Center content horizontally */
}

#testimonial .swiper-slide .col-md-10 {
	width: 200%; /* Limit the maximum width of the text block */
}

@media ( min-width : 992px) {
	#testimonial .swiper-slide .col-md-10 {
		padding: 30px;
		/* Add padding inside the text block for better spacing */
	}
}

.category-image {
	width: 100px; /* Adjust width as needed */
	height: 100px; /* Adjust height as needed */
	/*  border-radius: 50%; /* Makes the image circular */ */
	object-fit: cover; /* Ensures the image covers the entire circle */
}

#banner {
	position: relative;
	overflow: hidden;
	background: #F9F3EC;
	min-height: 60vh; /* Adjust this value as needed for larger height */
	display: flex;
	align-items: center;
	justify-content: center;

	/* 
    
    position: relative;
    overflow: hidden;
    background: #F9F3EC;
    min-height: 80vh; */
	/* Adjust this value as needed for larger height */
}

#bestselling .swiper-slide img {
	width: 100%; /* Make images take the full width of the container */
	height: 200px; /* Set the desired height */
	object-fit: cover;
}

#bestselling .swiper-slide .card-body {
	text-align: center; /* Center-align text */
}

.text-background {
	background: rgba(255, 255, 255, 0.3); /* Semi-transparent background */
	backdrop-filter: blur(10px); /* Blur effect */
	padding: 20px;
	border-radius: 10px;
	align-items: center;
	justify-content: center;
}

.video-background {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	/* z-index: -1; */
}

.banner-content-wrapper {
	position: relative;
	z-index: 1;
	align-items: center;
	/*  justify-content: center; */
	height: 100%;
	/* Ensures the content wrapper takes full height of the container */
	text-align: center;
	color: white; /* Set text color for better visibility on images */
}

/* .banner-content-wrapper {
    position: relative;
    z-index: 1;
    text-align: center;
    color: white; /* Set text color for better visibility on videos */
padding















 










:








 









20px



















;
background















 










:








 








rgba

















(
















0
,
0
,
0
,
0


















.5
















)















; /* Semi-transparent background color for contrast */
border-radius
















:








 








10px
















;
}
* /

 @keyframes moveText { 0% {
	transform: translateX(0);
}

50


















%
{
transform
















:

















translateX















(
















20px

















)














;
}
100














%
{
transform

















:
















translateX















(
















0

















)














;
}
}
.animate-text {
	display: inline-block;
	animation: moveText 3s infinite;
}

.preloader-wrapper, .offcanvas-header, .offcanvas-body, .order-md-last,
	.main-menu, .banner-content, .categories-item, .content-wrapper {
	text-align: center;
}

.content-wrapper {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.banner-title {
	width: 100%;
	text-align: center;
}

.banner-title a span:hover {
	text-decoration: underline;
}

.btn {
	display: inline-flex;
	align-items: center;
	justify-content: center;
}

.secondary-font {
	display: block;
}

.search-bar {
	display: flex;
	justify-content: center;
	align-items: center;
}

.swiper-slide {
	text-align: center;
}

.navbar-nav {
	justify-content: center;
}

.list-group-item {
	justify-content: center;
}

.list-group-item h6, .list-group-item small, .list-group-item span {
	text-align: center;
	display: block;
}
</style>






<link rel="stylesheet" href="css/swiper.css" />
<link rel="stylesheet" href="css/bootstrap.css" />


<link rel="stylesheet" type="text/css" href="css/vendor.css">
<link rel="stylesheet" type="text/css" href="css/style.css">





</head>



<body>


	<div class="preloader-wrapper">
		<div class="preloader"></div>
	</div>

	<header
		style="position: sticky; top: 0; z-index: 1000; background-color: white;">
		<div class="container py-2">
			<div class="row py-4 pb-0 pb-sm-4 align-items-center ">



				<div class="container-fluid">
					<hr class="m-0">
				</div>

				<div class="container">
					<nav class="main-menu d-flex navbar navbar-expand-lg ">

						<div class="col-sm-4 col-lg-3 text-center text-sm-start">
							<div class="main-logo">
								<a href="/home"> <img src="images/logo.png" alt="logo"
									class="img-fluid1">
								</a>
							</div>
						</div>

						<div class="d-flex d-lg-none align-items-end mt-3">
							<ul class="d-flex justify-content-end list-unstyled m-0">
								<li><a href="/login" class="mx-3"> <iconify-icon
											icon="healthicons:person" class="fs-4"></iconify-icon>
								</a></li>
								<li><a href="/user/favorites" class="mx-3"> <iconify-icon
											icon="mdi:heart" class="fs-4"></iconify-icon>
								</a></li>

								<!-- <li><a href="#" class="mx-3" data-bs-toggle="offcanvas"
									data-bs-target="#offcanvasCart" aria-controls="offcanvasCart">
										<iconify-icon icon="mdi:cart" class="fs-4 position-relative"></iconify-icon>
										<span
										class="position-absolute translate-middle badge rounded-circle bg-primary pt-2">
											04 </span>
								</a></li>

								<li><a href="#" class="mx-3" data-bs-toggle="offcanvas"
									data-bs-target="#offcanvasSearch"
									aria-controls="offcanvasSearch"> <iconify-icon
											icon="tabler:search" class="fs-4"></iconify-icon> </span>
								</a></li> -->
							</ul>
							f
						</div>

						<!--         <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
          aria-controls="offcanvasNavbar">
          <span class="navbar-toggler-icon"></span>
        </button> -->

						<div class="offcanvas offcanvas-end" tabindex="-1"
							id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">

							<div class="offcanvas-header justify-content-center">
								<button type="button" class="btn-close"
									data-bs-dismiss="offcanvas" aria-label="Close"></button>
							</div>

							<div class="offcanvas-body justify-content-between">


								<ul
									class="navbar-nav menu-list list-unstyled d-flex gap-md-3 mb-0">

									<!--          
              <li style="padding: 0;margin: 0" >
            <a href="index.html">
              <img src="images/logo.png" alt="logo" style="height: auto ;width: 20%;padding: 0;margin: 0" >
            </a>
            </li> -->


									<li class="nav-item"><a href="/home" class="nav-link">Home</a>
									</li>


									<!-- <li class="nav-item">
                <a href="contact.html" class="nav-link">Contact Us</a>
              </li> -->


									<li class="nav-item"><a href="/aboutus" class="nav-link">About
											Us</a></li>

									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" role="button" id="pages"
										data-bs-toggle="dropdown" aria-expanded="false">Adoption</a>
										<ul class="dropdown-menu" aria-labelledby="pages">
											<li class="nav-item"><a href="/cart/cat"
												class="dropdown-item">Cats</a></li>
											<li class="nav-item"><a href="/cart/dog"
												class="dropdown-item">Dogs</a></li>
											<li class="nav-item"><a href="/cart/bird"
												class="dropdown-item">Birds</a></li>
											<li class="nav-item"><a href="/cart/all"
												class="dropdown-item">All</a></li>

										</ul></li>

									<li><a href="/faqs" class="nav-link">FAQs</a></li>
									<li><a href="/contact" class="nav-link">Contact Us</a></li>
									<li><a href="/user/besties" class="nav-link">My
											Besties</a></li>

									<li><a href="/partners" class="nav-link">Partners</a></li>




								</ul>

								<div class="d-none d-lg-flex align-items-end">
									<ul class="d-flex justify-content-end list-unstyled m-0">
									<c:if test="${currentUser != null}">
											<li><a href="/edit" class="mx-3"> <iconify-icon
														icon="healthicons:person" class="fs-4"></iconify-icon>
											</a></li>
										</c:if>
										<c:if test="${currentUser == null}">
											<li><a href="/login" class="mx-3"> <iconify-icon
														icon="healthicons:person" class="fs-4"></iconify-icon>
											</a></li>
										</c:if>
										<li><a href="/user/favorites" class="mx-3"> <iconify-icon
													icon="mdi:heart" class="fs-4"></iconify-icon>
										</a></li>
										<c:if test="${currentUser != null}">
											<li>
												<form id="logoutForm" method="POST" action="/logout">
													<input type="hidden" name="${_csrf.parameterName}"
														value="${_csrf.token}" />
													<button type="submit"
														style="border: none; background: none;">
														<iconify-icon icon="mdi:logout" class="fs-4"></iconify-icon>
													</button>
												</form>

											</li>
										</c:if>
										<!-- <li class=""><a href="#" class="mx-3"
											data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart"
											aria-controls="offcanvasCart"> <iconify-icon
													icon="mdi:bell" class="fs-4 position-relative"></iconify-icon>
												<span
												class="position-absolute translate-middle badge rounded-circle bg-primary pt-2">
													04 </span>
										</a></li> -->
									</ul>

								</div>

							</div>

						</div>

					</nav>



				</div>
	</header>
	<section id="banner" class="py-0" style="background: #F9F3EC;">
		<div class="container p-0">
			<div class="row align-items-center">
				<div class="col-md-6">
					<div class="hero-content py-0 my-0">
						<h2 class="display-1 mt-3 mb-0">About Us</h2>

					</div>
				</div>
				<div class="col-md-6">
					<img src="images/soar.png" class="img-fluid soarIm mt-3"
						alt="About Us Image" style="max-width: 100%;">
				</div>
			</div>
		</div>
	</section>



	<div class="my-5 py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-6 my-4 pe-5">
					<h2>How SOAR Started Helping Pets Find Homes</h2>
					<p>At SOAR, our mission began with a passion for helping pets
						in need find loving homes. Lorem ipsum dolor sit amet, consectetur
						adipiscing elit. Integer nec odio. Praesent libero. Sed cursus
						ante dapibus diam. Sed nisi.</p>
					<a href="#"
						class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1 py-2 px-4">
						Read Our Story <svg width="24" height="24" viewBox="0 0 24 24"
							class="mb-1">
                        <use xlink:href="#arrow-right"></use>
                    </svg>
					</a>
				</div>
				<div class="col-md-6 my-4">
					<h2>Discover Our Adoption Process</h2>
					<p>Interested in adopting a pet through SOAR? Learn about our
						straightforward adoption process and how we make it easy for you
						to find your new furry companion.</p>
					<ul>
						<li><span class="text-primary"></span> Explore available pets</li>
						<li><span class="text-primary"></span> Submit an adoption
							application</li>
						<li><span class="text-primary"></span> Meet your potential
							pet</li>
						<li><span class="text-primary"></span> Finalize the adoption</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-counter" id="section-counter"
		style="background: #F9F3EC; padding: 2rem">
		<div class="container">
			<div class="row">
				<div
					class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
					<div class="block-18 text-center">
						<div class="text">
							<strong class="number" data-number="150">0</strong>
						</div>
						<div class="text">
							<span>Pets Saved</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
					<div class="block-18 text-center">
						<div class="text">
							<strong class="number" data-number="500">0</strong>
						</div>
						<div class="text">
							<span>Successful Adoptions</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
					<div class="block-18 text-center">
						<div class="text">
							<strong class="number" data-number="30">0</strong>
						</div>
						<div class="text">
							<span>Dedicated Volunteers</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
					<div class="block-18 text-center">
						<div class="text">
							<strong class="number" data-number="200">0</strong>
						</div>
						<div class="text">
							<span>Community Events Hosted</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="my-5 pb-5">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h2 class="display-4">Meet Your New Best Friend with SOAR.</h2>
				</div>
				<div class="col-md-6">
					<p>Discover the joy of adopting a pet from SOAR. Lorem ipsum
						dolor sit amet, consectetur adipiscing elit. Aliquam euismod nunc
						vitae interdum mauris. Vivamus pretium lectus mauris, vitae ornare
						quam diam felis.</p>
					<p>Join us in making a difference in a pet's life today.</p>
				</div>
			</div>
		</div>
	</div>

	<section id="register"
		style="background: url('images/background-img.png');">
		<div class="container ">
			<div class="row my-5 py-5">
				<div class="offset-md-3 col-md-6 my-5 ">
					<div class="container banner-content-wrapper">
						<div class="row banner-content align-items-center">
							<div class="content-wrapper text-background">
								<h2 class="display-3 fw-normal text-center">
									Donate for Love <span class="text-primary">Spread love
										with giving</span>
								</h2>
								<form>


									<div class="mb-3">
										<input type="email" class="form-control form-control-lg"
											name="email" id="email"
											placeholder="Enter Your Email Address">
									</div>
									<div class="mb-3">
										<input type="number" class="form-control form-control-lg"
											name="email" id="password1" placeholder="Donation Amount">
									</div>
									<div class="mb-3">
										<input type="number" class="form-control form-control-lg"
											name="email" id="password2" placeholder="Visa">
									</div>

									<div class="d-grid gap-2">
										<button type="submit" class="btn btn-dark btn-lg rounded-1">Donate
											Now</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>






	<footer id="footer" class="my-5" style="border-top: 1px solid #ccc">
		<div class="container py-5 my-5">
			<div class="row"
				style="align-items: center; justify-content: space-between;">

				<div class="col-md-3">
					<div class="footer-menu">
						<a href="/home"><img src="images/logo.png" alt="logo"
							style="height: 50%; width: 50%"></a>

					</div>
				</div>
				<div class="col-md-3">
					<div class="footer-menu">

						<!-- <p class="blog-paragraph fs-6 mt-3">Subscribe to our newsletter to get updates about our grand offers.</p> -->
						<div class="social-links">
							<ul class="d-flex list-unstyled gap-2">
								<li class="social"><a href="#"> <iconify-icon
											class="social-icon" icon="ri:facebook-fill"></iconify-icon>
								</a></li>
								<li class="social"><a href="#"> <iconify-icon
											class="social-icon" icon="ri:twitter-fill"></iconify-icon>
								</a></li>
								<li class="social"><a href="#"> <iconify-icon
											class="social-icon" icon="ri:pinterest-fill"></iconify-icon>
								</a></li>
								<li class="social"><a href="#"> <iconify-icon
											class="social-icon" icon="ri:instagram-fill"></iconify-icon>
								</a></li>
								<li class="social"><a href="#"> <iconify-icon
											class="social-icon" icon="ri:youtube-fill"></iconify-icon>
								</a></li>

							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="footer-menu">
						<h3>Quick Links</h3>
						<ul class="menu-list list-unstyled">
							<li class="menu-item"><a href="/home" class="nav-link">Home</a>
							</li>
							<li class="menu-item"><a href="/aboutus" class="nav-link">About
									us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3">
					<div class="footer-menu">
						<h3>
							Help Center
							</h5>
							<ul class="menu-list list-unstyled">
								<li class="menu-item"><a href="/faqs" class="nav-link">FAQs</a>
								</li>
								<li class="menu-item"><a href="/contact" class="nav-link">Contact
										Us</a></li>
							</ul>
					</div>
				</div>


			</div>
		</div>
	</footer>




	<script src="js/jquery-1.11.0.min.js"></script>
	<script src="js/swiper.js"></script>
	<script src="js/bootstrap.bundle.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/script.js"></script>
	<script src="js/iconify.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

</body>

</html>

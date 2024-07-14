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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="description" content="">






<link rel="stylesheet" href="css/swiper.css" />
<link rel="stylesheet" href="css/bootstrap.css" />


<link rel="stylesheet" type="text/css" href="css/vendor.css">
<link rel="stylesheet" type="text/css" href="css/style.css">



<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap"
	rel="stylesheet">

<style>
/* .fixed-size-img {
	width: 250px; /* Set desired width percentage */
height
:
 
300px
; /* Maintain aspect ratio */

	
object-fit
:
 
cover
;
/* Ensure the image fits within the specified dimensions */


}
* /
.card {
	border: 2px solid #007bff; /* Use the same color as the button */
	transition: border-color 0.3s ease, box-shadow 0.3s ease;
	overflow: hidden;
}

.fixed-size-img {
	width: 100%;
	height: 300px;
	/* Fixed height to ensure all images are the same height */
	object-fit: cover;
	/* Maintain aspect ratio and cover the entire area */
}

.card-img-top {
	width: 100%;
	height: 300px;
}

.card:hover {
	border-color: #007bff;
	box-shadow: none; /* Remove any shadow or transform effect on hover */
}

.card-body {
	border-left: 1px solid #DEAD6F; /* Left border */
	border-right: 1px solid #DEAD6F; /* Right border */
	border-bottom: 1px solid #DEAD6F; /* Bottom border */
	transition: none;
}

.position-absolute {
	position: absolute;
	top: 10px;
	right: 10px;
}

.btn-wishlist {
	background: rgba(255, 255, 255, 0.7);
	border-radius: 50%;
}
</style>

</head>



<body>

	<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <defs>
      <symbol xmlns="http://www.w3.org/2000/svg" id="link"
			viewBox="0 0 24 24">
        <path fill="currentColor"
			d="M12 19a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm5 0a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm0-4a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm-5 0a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm7-12h-1V2a1 1 0 0 0-2 0v1H8V2a1 1 0 0 0-2 0v1H5a3 3 0 0 0-3 3v14a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3V6a3 3 0 0 0-3-3Zm1 17a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-9h16Zm0-11H4V6a1 1 0 0 1 1-1h1v1a1 1 0 0 0 2 0V5h8v1a1 1 0 0 0 2 0V5h1a1 1 0 0 1 1 1ZM7 15a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm0 4a1 1 0 1 0-1-1a1 1 0 0 0 1 1Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="arrow-right"
			viewBox="0 0 24 24">
        <path fill="currentColor"
			d="M17.92 11.62a1 1 0 0 0-.21-.33l-5-5a1 1 0 0 0-1.42 1.42l3.3 3.29H7a1 1 0 0 0 0 2h7.59l-3.3 3.29a1 1 0 0 0 0 1.42a1 1 0 0 0 1.42 0l5-5a1 1 0 0 0 .21-.33a1 1 0 0 0 0-.76Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="category"
			viewBox="0 0 24 24">
        <path fill="currentColor"
			d="M19 5.5h-6.28l-.32-1a3 3 0 0 0-2.84-2H5a3 3 0 0 0-3 3v13a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3v-10a3 3 0 0 0-3-3Zm1 13a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-13a1 1 0 0 1 1-1h4.56a1 1 0 0 1 .95.68l.54 1.64a1 1 0 0 0 .95.68h7a1 1 0 0 1 1 1Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="calendar"
			viewBox="0 0 24 24">
        <path fill="currentColor"
			d="M19 4h-2V3a1 1 0 0 0-2 0v1H9V3a1 1 0 0 0-2 0v1H5a3 3 0 0 0-3 3v12a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3V7a3 3 0 0 0-3-3Zm1 15a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-7h16Zm0-9H4V7a1 1 0 0 1 1-1h2v1a1 1 0 0 0 2 0V6h6v1a1 1 0 0 0 2 0V6h2a1 1 0 0 1 1 1Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="heart"
			viewBox="0 0 24 24">
        <path fill="currentColor"
			d="M20.16 4.61A6.27 6.27 0 0 0 12 4a6.27 6.27 0 0 0-8.16 9.48l7.45 7.45a1 1 0 0 0 1.42 0l7.45-7.45a6.27 6.27 0 0 0 0-8.87Zm-1.41 7.46L12 18.81l-6.75-6.74a4.28 4.28 0 0 1 3-7.3a4.25 4.25 0 0 1 3 1.25a1 1 0 0 0 1.42 0a4.27 4.27 0 0 1 6 6.05Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="plus"
			viewBox="0 0 24 24">
        <path fill="currentColor"
			d="M19 11h-6V5a1 1 0 0 0-2 0v6H5a1 1 0 0 0 0 2h6v6a1 1 0 0 0 2 0v-6h6a1 1 0 0 0 0-2Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="minus"
			viewBox="0 0 24 24">
        <path fill="currentColor"
			d="M19 11H5a1 1 0 0 0 0 2h14a1 1 0 0 0 0-2Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="cart"
			viewBox="0 0 24 24">
        <path fill="currentColor"
			d="M8.5 19a1.5 1.5 0 1 0 1.5 1.5A1.5 1.5 0 0 0 8.5 19ZM19 16H7a1 1 0 0 1 0-2h8.491a3.013 3.013 0 0 0 2.885-2.176l1.585-5.55A1 1 0 0 0 19 5H6.74a3.007 3.007 0 0 0-2.82-2H3a1 1 0 0 0 0 2h.921a1.005 1.005 0 0 1 .962.725l.155.545v.005l1.641 5.742A3 3 0 0 0 7 18h12a1 1 0 0 0 0-2Zm-1.326-9l-1.22 4.274a1.005 1.005 0 0 1-.963.726H8.754l-.255-.892L7.326 7ZM16.5 19a1.5 1.5 0 1 0 1.5 1.5a1.5 1.5 0 0 0-1.5-1.5Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="check"
			viewBox="0 0 24 24">
        <path fill="currentColor"
			d="M18.71 7.21a1 1 0 0 0-1.42 0l-7.45 7.46l-3.13-3.14A1 1 0 1 0 5.29 13l3.84 3.84a1 1 0 0 0 1.42 0l8.16-8.16a1 1 0 0 0 0-1.47Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="trash"
			viewBox="0 0 24 24">
        <path fill="currentColor"
			d="M10 18a1 1 0 0 0 1-1v-6a1 1 0 0 0-2 0v6a1 1 0 0 0 1 1ZM20 6h-4V5a3 3 0 0 0-3-3h-2a3 3 0 0 0-3 3v1H4a1 1 0 0 0 0 2h1v11a3 3 0 0 0 3 3h8a3 3 0 0 0 3-3V8h1a1 1 0 0 0 0-2ZM10 5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v1h-4Zm7 14a1 1 0 0 1-1 1H8a1 1 0 0 1-1-1V8h10Zm-3-1a1 1 0 0 0 1-1v-6a1 1 0 0 0-2 0v6a1 1 0 0 0 1 1Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="star-outline"
			viewBox="0 0 15 15">
        <path fill="none" stroke="currentColor" stroke-linecap="round"
			stroke-linejoin="round"
			d="M7.5 9.804L5.337 11l.413-2.533L4 6.674l2.418-.37L7.5 4l1.082 2.304l2.418.37l-1.75 1.793L9.663 11L7.5 9.804Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="star-solid"
			viewBox="0 0 15 15">
        <path fill="currentColor"
			d="M7.953 3.788a.5.5 0 0 0-.906 0L6.08 5.85l-2.154.33a.5.5 0 0 0-.283.843l1.574 1.613l-.373 2.284a.5.5 0 0 0 .736.518l1.92-1.063l1.921 1.063a.5.5 0 0 0 .736-.519l-.373-2.283l1.574-1.613a.5.5 0 0 0-.283-.844L8.921 5.85l-.968-2.062Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="search"
			viewBox="0 0 24 24">
        <path fill="currentColor"
			d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="user"
			viewBox="0 0 24 24">
        <path fill="currentColor"
			d="M15.71 12.71a6 6 0 1 0-7.42 0a10 10 0 0 0-6.22 8.18a1 1 0 0 0 2 .22a8 8 0 0 1 15.9 0a1 1 0 0 0 1 .89h.11a1 1 0 0 0 .88-1.1a10 10 0 0 0-6.25-8.19ZM12 12a4 4 0 1 1 4-4a4 4 0 0 1-4 4Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="close"
			viewBox="0 0 15 15">
        <path fill="currentColor"
			d="M7.953 3.788a.5.5 0 0 0-.906 0L6.08 5.85l-2.154.33a.5.5 0 0 0-.283.843l1.574 1.613l-.373 2.284a.5.5 0 0 0 .736.518l1.92-1.063l1.921 1.063a.5.5 0 0 0 .736-.519l-.373-2.283l1.574-1.613a.5.5 0 0 0-.283-.844L8.921 5.85l-.968-2.062Z" />
      </symbol>

    </defs>
  </svg>
	<div class="preloader-wrapper">
		<div class="preloader"></div>
	</div>

	<div class="offcanvas offcanvas-end" data-bs-scroll="true"
		tabindex="-1" id="offcanvasCart" aria-labelledby="My Cart">
		<div class="offcanvas-header justify-content-center">
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<div class="order-md-last">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-primary">New Blogs</span> <span
						class="badge bg-primary rounded-circle pt-2">3</span>
				</h4>
				<ul class="list-group mb-3">
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<h6 class="my-0">Ola Jaafreh</h6>
							<small class="text-body-secondary">Brief description</small>
						</div> <span class="text-body-secondary">12:00 am</span>
					</li>
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<h6 class="my-0">Rand Farhood</h6>
							<small class="text-body-secondary">Brief description</small>
						</div> <span class="text-body-secondary">03:00 pm</span>
					</li>
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<h6 class="my-0">Andree Ayad</h6>
							<small class="text-body-secondary">Brief description</small>
						</div> <span class="text-body-secondary">02:00 pm</span>
					</li>
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<h6 class="my-0">Said QT</h6>
							<small class="text-body-secondary">Brief description</small>
						</div> <span class="text-body-secondary">12:00 pm</span>
					</li>
				</ul>

				<button class="w-100 btn btn-primary btn-lg" type="submit">Show
					More</button>
			</div>
		</div>
	</div>

	<div class="offcanvas offcanvas-end" data-bs-scroll="true"
		tabindex="-1" id="offcanvasSearch" aria-labelledby="Search">
		<div class="offcanvas-header justify-content-center">
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">

			<div class="order-md-last">
				<h4 class="text-primary text-uppercase mb-3">Search</h4>
				<div class="search-bar border rounded-2 border-dark-subtle">
					<form id="search-form"
						class="text-center d-flex align-items-center" action="" method="">
						<input type="text" class="form-control border-0 bg-transparent"
							placeholder="Search Here" />
						<iconify-icon icon="tabler:search" class="fs-4 me-3"></iconify-icon>
					</form>
				</div>
			</div>
		</div>
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
								<li><a href="account.html" class="mx-3"> <iconify-icon
											icon="healthicons:person" class="fs-4"></iconify-icon>
								</a></li>
								<li><a href="wishlist.html" class="mx-3"> <iconify-icon
											icon="mdi:heart" class="fs-4"></iconify-icon>
								</a></li>

								<li><a href="#" class="mx-3" data-bs-toggle="offcanvas"
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
								</a></li>
							</ul>

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
											<li class="nav-item"><a href="/cart"
												class="dropdown-item">Other</a></li>

										</ul></li>

									<li><a href="/faqs" class="nav-link">FAQs</a></li>
									<li><a href="/contact" class="nav-link">Contact Us</a></li>
									<li><a href="single-post.html" class="nav-link">My
											Besties</a></li>
									<li><a href="single-post.html" class="nav-link">Single
											Post</a></li>
									<li><a href="/partner" class="nav-link">Partners</a></li>




								</ul>

								<div class="d-none d-lg-flex align-items-end">
									<ul class="d-flex justify-content-end list-unstyled m-0">
										<li><a href="/login" class="mx-3"> <iconify-icon
													icon="healthicons:person" class="fs-4"></iconify-icon>
										</a></li>
										<li><a href="/wishlist" class="mx-3"> <iconify-icon
													icon="mdi:heart" class="fs-4"></iconify-icon>
										</a></li>

										<li class=""><a href="#" class="mx-3"
											data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart"
											aria-controls="offcanvasCart"> <iconify-icon
													icon="mdi:bell" class="fs-4 position-relative"></iconify-icon>
												<span
												class="position-absolute translate-middle badge rounded-circle bg-primary pt-2">
													04 </span>
										</a></li>


									</ul>

								</div>

							</div>

						</div>

					</nav>



				</div>
	</header>
	<section id="banner" class="py-3" style="background: #F9F3EC;">
		<div class="container">
			<div class="hero-content py-5 my-3">
				<h2 class="display-1 mt-3 mb-0">Cart</h2>
				<nav class="breadcrumb">
					<a class="breadcrumb-item nav-link" href="#">Home</a> <a
						class="breadcrumb-item nav-link" href="#">Pages</a> <span
						class="breadcrumb-item active" aria-current="page">Cart</span>
				</nav>
			</div>
		</div>
	</section>

























	<%--  <section id="cartt" class="my-5 py-5">
    <div class="container my-5 py-5">
        <div class="section-header d-md-flex justify-content-between align-items-center">
            <h2 class="display-3 fw-normal">Pets</h2>
            <div class="mb-4 mb-md-0">
                <button class="filter-button me-4 active" data-filter="*">ALL</button>
                <button class="filter-button me-4" data-filter=".cat">CAT</button>
                <button class="filter-button me-4" data-filter=".dog">DOG</button>
                <button class="filter-button me-4" data-filter=".bird">BIRD</button>
            </div>
        </div>

        <div class="isotope-container row">
            <c:forEach var="pet" items="${pets}">
                <c:if test="${pet.status.equals('Unadopted')}">
                    <div class="item col-md-4 col-lg-3 my-4 ${pet.type.toLowerCase()}">
                        <div class="card position-relative">
                            <img src="images/item9.jpg" class="img-fluid rounded-4" alt="image">
                            <div class="card-body p-0">
                                <h3 class="card-title pt-4 m-0">${pet.name}</h3>
                                <h3 class="secondary-font text-primary">${pet.breed}</h3>
                                <div class="d-flex flex-wrap mt-3">
                                    <form action="/public/cart/add" method="post">
                                        <c:if test="${currentUser != null}">
                                            <input type="hidden" name="petId" value="${pet.id}">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <input type="hidden" name="location" value="cart">
                                            <button type="submit" class="btn-cart me-3 px-4 pt-3 pb-3">
                                                <h5 class="text-uppercase m-0">Let's cuddle</h5>
                                            </button>
                                            <button type="submit" class="btn-wishlist px-4 pt-3">
                                                <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
                                            </button>
                                        </c:if>
                                        <c:if test="${currentUser == null}">
                                            <button type="submit" class="btn-cart me-3 px-4 pt-3 pb-3" disabled>
                                                <h5 class="text-uppercase m-0">Let's cuddle</h5>
                                            </button>
                                            <button type="submit" class="btn-wishlist px-4 pt-3" disabled>
                                                <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
                                            </button>
                                        </c:if>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</section> --%>




























	<section id="foodies" class="my-5">
		<div class="container my-5 py-5">

			<div
				class="section-header d-md-flex justify-content-between align-items-center">
				<h2 class="display-3 fw-normal">Pets</h2>
				<div class="mb-4 mb-md-0">
					<p class="m-0">
						<button class="filter-button me-4  " data-filter="*">ALL</button>
						<button class="filter-button me-4 " data-filter=".cat">CAT</button>
						<button class="filter-button me-4   active" data-filter=".dog">DOG</button>
						<button class="filter-button me-4    " data-filter=".bird">BIRD</button>
					</p>
				</div>
				<div>
					<a href=""
						class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
						lets cuddle <svg width="24" height="24" viewBox="0 0 24 24"
							class="mb-1">
              <use xlink:href="#arrow-right"></use>
            </svg>
					</a>
				</div>
			</div>

			<div class="isotope-container row">


<%-- 
				<c:forEach var="pet" items="${pets}">
					<c:if test="${pet.status.equals('Unadopted')}">
						<c:if test="${pet.type.equals('cat')}">
							<div class="item cat col-md-4 col-lg-3 my-4">
								<div
									class="card position-relative border-0 rounded-4 overflow-hidden">
									<div class="position-relative">
										<img src="${pet.imageUrl}" class="card-img-top fixed-size-img"
											alt="image">
										<form action="/public/cart/add" method="post"
											class="position-absolute top-0 end-0 m-2">
											<input type="hidden" name="petId" value="${pet.id}">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}"> <input type="hidden"
												name="location" value="cart">
											<c:if test="${currentUser != null}">
												<c:if test="${favoritePetIds.contains(pet.id)}">
													<button class="btn btn-outline-danger p-2" type="submit">
														<iconify-icon icon="emojione-v1:broken-heart" class="fs-5"></iconify-icon>
													</button>
												</c:if>
												<c:if test="${!favoritePetIds.contains(pet.id)}">
													<button class="btn btn-outline-primary p-2" type="submit">
														<iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
													</button>
												</c:if>
											</c:if>
											<c:if test="${currentUser == null}">
												<button class="btn btn-outline-primary p-2" type="submit"
													disabled>
													<iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
												</button>
											</c:if>
										</form>
									</div>
									<div class="card-body p-3">
										<a href="" class="text-decoration-none">
											<h3 class="card-title text-dark">
												<c:out value="${pet.name}"></c:out>
											</h3>
										</a>
										<h4 class="secondary-font text-primary">
											<c:out value="${pet.breed}"></c:out>
										</h4>
										<div class="d-flex flex-wrap mt-3">
											<a href="#"
												class="btn btn-primary me-3 px-4 py-2 text-uppercase">
												Lets cuddle </a>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:if>
				</c:forEach>
 --%>




				<c:forEach var="pet" items="${pets}">
					<c:if test="${pet.status.equals('Unadopted')}">
						<c:if test="${pet.type.equals('dog')}">
							<div class="item dog col-md-4 col-lg-3 my-4">
								<div
									class="card position-relative border-0 rounded-4 overflow-hidden">
									<div class="position-relative">
										<img src="${pet.imageUrl}" class="card-img-top fixed-size-img"
											alt="image">
										<form action="/public/cart/add" method="post"
											class="position-absolute top-0 end-0 m-2">
											<input type="hidden" name="petId" value="${pet.id}">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}"> <input type="hidden"
												name="location" value="cart">
											<c:if test="${currentUser != null}">
												<c:if test="${favoritePetIds.contains(pet.id)}">
													<button class="btn btn-outline-danger p-2" type="submit">
														<iconify-icon icon="emojione-v1:broken-heart" class="fs-5"></iconify-icon>
													</button>
												</c:if>
												<c:if test="${!favoritePetIds.contains(pet.id)}">
													<button class="btn btn-outline-primary p-2" type="submit">
														<iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
													</button>
												</c:if>
											</c:if>
											<c:if test="${currentUser == null}">
												<button class="btn btn-outline-primary p-2" type="submit">
													<iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
												</button>
											</c:if>
										</form>
									</div>
									<div class="card-body p-3">
										<a href="single-product.html" class="text-decoration-none">
											<h3 class="card-title text-dark">
												<c:out value="${pet.name}"></c:out>
											</h3>
										</a>
										<h4 class="secondary-font text-primary">
											<c:out value="${pet.breed}"></c:out>
										</h4>
										<div class="d-flex flex-wrap mt-3">
											<a href="#"
												class="btn btn-primary me-3 px-4 py-2 text-uppercase">
												Lets cuddle </a>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:if>
				</c:forEach>





			<%-- 	<c:forEach var="pet" items="${pets}">
					<c:if test="${pet.status.equals('Unadopted')}">
						<c:if test="${pet.type.equals('bird')}">
							<div class="item bird col-md-4 col-lg-3 my-4">
								<div
									class="card position-relative border-0 rounded-4 overflow-hidden">
									<div class="position-relative">
										<img src="${pet.imageUrl}" class="card-img-top fixed-size-img"
											alt="image">
										<form action="/public/cart/add" method="post"
											class="position-absolute top-0 end-0 m-2">
											<input type="hidden" name="petId" value="${pet.id}">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}"> <input type="hidden"
												name="location" value="cart">
											<c:if test="${currentUser != null}">
												<c:if test="${favoritePetIds.contains(pet.id)}">
													<button class="btn btn-outline-danger p-2" type="submit">
														<iconify-icon icon="emojione-v1:broken-heart" class="fs-5"></iconify-icon>
													</button>
												</c:if>
												<c:if test="${!favoritePetIds.contains(pet.id)}">
													<button class="btn btn-outline-primary p-2" type="submit">
														<iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
													</button>
												</c:if>
											</c:if>
											<c:if test="${currentUser == null}">
												<button class="btn btn-outline-primary p-2" type="submit">
													<iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
												</button>
											</c:if>
										</form>
									</div>
									<div class="card-body p-3">
										<a href="single-product.html" class="text-decoration-none">
											<h3 class="card-title text-dark">
												<c:out value="${pet.name}"></c:out>
											</h3>
										</a>
										<h4 class="secondary-font text-primary">
											<c:out value="${pet.breed}"></c:out>
										</h4>
										<div class="d-flex flex-wrap mt-3">
											<a href="#"
												class="btn btn-primary me-3 px-4 py-2 text-uppercase">
												Lets cuddle </a>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:if>
				</c:forEach>
 --%>






			</div>


		</div>
	</section>

	<section id="register"
		style="background: url('images/background-img.png') no-repeat;">
		<div class="container ">
			<div class="row my-5 py-5">
				<div class="offset-md-3 col-md-6 my-5 ">
					<h2 class="display-3 fw-normal text-center">
						Donate for Love <span class="text-primary">Spread love with
							giving</span>
					</h2>
					<form>
						<div class="mb-3">
							<input type="email" class="form-control form-control-lg"
								name="email" id="email" placeholder="Enter Your Email Address">
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
	</section>




	<section id="insta" class="my-5">
		<div class="row g-0 py-5">
			<div class="col instagram-item  text-center position-relative">
				<div
					class="icon-overlay d-flex justify-content-center position-absolute">
					<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
				</div>
				<a href="#"> <img src="images/insta1.jpg" alt="insta-img"
					class="img-fluid rounded-3">
				</a>
			</div>
			<div class="col instagram-item  text-center position-relative">
				<div
					class="icon-overlay d-flex justify-content-center position-absolute">
					<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
				</div>
				<a href="#"> <img src="images/insta2.jpg" alt="insta-img"
					class="img-fluid rounded-3">
				</a>
			</div>
			<div class="col instagram-item  text-center position-relative">
				<div
					class="icon-overlay d-flex justify-content-center position-absolute">
					<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
				</div>
				<a href="#"> <img src="images/insta3.jpg" alt="insta-img"
					class="img-fluid rounded-3">
				</a>
			</div>
			<div class="col instagram-item  text-center position-relative">
				<div
					class="icon-overlay d-flex justify-content-center position-absolute">
					<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
				</div>
				<a href="#"> <img src="images/insta4.jpg" alt="insta-img"
					class="img-fluid rounded-3">
				</a>
			</div>
			<div class="col instagram-item  text-center position-relative">
				<div
					class="icon-overlay d-flex justify-content-center position-absolute">
					<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
				</div>
				<a href="#"> <img src="images/insta5.jpg" alt="insta-img"
					class="img-fluid rounded-3">
				</a>
			</div>
			<div class="col instagram-item  text-center position-relative">
				<div
					class="icon-overlay d-flex justify-content-center position-absolute">
					<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
				</div>
				<a href="#"> <img src="images/insta6.jpg" alt="insta-img"
					class="img-fluid rounded-3">
				</a>
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
							<li class="menu-item"><a href="/contact" class="nav-link">Conatct
									Us</a></li>
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
								<li class="menu-item"><a class="nav-link">Phone:
										0560000000</a></li>

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

</body>

</html>
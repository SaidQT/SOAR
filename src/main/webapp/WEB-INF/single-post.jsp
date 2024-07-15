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
</head>


<link rel="stylesheet" href="css/swiper.css" />
<link rel="stylesheet" href="css/bootstrap.css" />


<link rel="stylesheet" type="text/css" href="css/vendor.css">
<link rel="stylesheet" type="text/css" href="css/style.css">



<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap"
	rel="stylesheet">

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
					<span class="text-primary">Your cart</span> <span
						class="badge bg-primary rounded-circle pt-2">3</span>
				</h4>
				<ul class="list-group mb-3">
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<h6 class="my-0">Grey Hoodie</h6>
							<small class="text-body-secondary">Brief description</small>
						</div> <span class="text-body-secondary">$12</span>
					</li>
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<h6 class="my-0">Dog Food</h6>
							<small class="text-body-secondary">Brief description</small>
						</div> <span class="text-body-secondary">$8</span>
					</li>
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<h6 class="my-0">Soft Toy</h6>
							<small class="text-body-secondary">Brief description</small>
						</div> <span class="text-body-secondary">$5</span>
					</li>
					<li class="list-group-item d-flex justify-content-between"><span
						class="fw-bold">Total (USD)</span> <strong>$20</strong></li>
				</ul>

				<button class="w-100 btn btn-primary btn-lg" type="submit">Continue
					to checkout</button>
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
								<a href=""> <img src="images/logo.png" alt="logo"
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
											03 </span>
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


									<li class="nav-item"><a href="index.html" class="nav-link">Home</a>
									</li>


									<!-- <li class="nav-item">
                <a href="contact.html" class="nav-link">Contact Us</a>
              </li> -->


									<li class="nav-item"><a href="about.html" class="nav-link">About
											Us</a></li>

									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" role="button" id="pages"
										data-bs-toggle="dropdown" aria-expanded="false">Adoption</a>
										<ul class="dropdown-menu" aria-labelledby="pages">
											<li class="nav-item"><a href="cart.html"
												class="dropdown-item">Cats</a></li>
											<li class="nav-item"><a href="cart.html"
												class="dropdown-item">Dogs</a></li>
											<li class="nav-item"><a href="cart.html"
												class="dropdown-item">Birds</a></li>
											<li class="nav-item"><a href="cart.html"
												class="dropdown-item">Other</a></li>

										</ul></li>

									<li><a href="faqs.html" class="nav-link">FAQs</a></li>
									<li><a href="single-post.html" class="nav-link">My
											Besties</a></li>
									<li><a href="single-post.html" class="nav-link">Single
											Post</a></li>
									<li><a href="" class="nav-link">Partners</a></li>




								</ul>

								<div class="d-none d-lg-flex align-items-end">
									<ul class="d-flex justify-content-end list-unstyled m-0">
										<li><a href="account.html" class="mx-3"> <iconify-icon
													icon="healthicons:person" class="fs-4"></iconify-icon>
										</a></li>
										<li><a href="wishlist.html" class="mx-3"> <iconify-icon
													icon="mdi:heart" class="fs-4"></iconify-icon>
										</a></li>

										<li class=""><a href="#" class="mx-3"
											data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart"
											aria-controls="offcanvasCart"> <iconify-icon
													icon="mdi:cart" class="fs-4 position-relative"></iconify-icon>
												<span
												class="position-absolute translate-middle badge rounded-circle bg-primary pt-2">
													03 </span>
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
        <h2 class="display-1 mt-3 mb-0">Single <span class="text-primary">Post</span> </h2>
        <nav class="breadcrumb">
          <a class="breadcrumb-item nav-link" href="#">Home</a>
          <a class="breadcrumb-item nav-link" href="#">Pages</a>
          <span class="breadcrumb-item active" aria-current="page">Single Post</span>
        </nav>
      </div>
    </div>
  </section>

<section class="py-5">
  <div class="container">
    <div class="mt-5">
      <div class="post-meta">
        <span class="post-category">Pets</span> / <span class="meta-date">Jul 13, 2024</span>
      </div>
      <h1 class="page-title">Why You Should Consider Adopting a Pet</h1>
    </div>
  </div>
</section>

<div>
  <div class="container">
    <div class="row">
      <main class="post-grid">
        <div class="row">
          <article class="post-item">
            <div class="post-content">
              <div class="post-thumbnail mb-5">
               <img src="images/blog-large.jpg" alt="single-post" class="img-fluid">
              </div>
              <div class="post-description py-4">
                <p>
                  <strong>Adopting a pet is a wonderful way to bring joy and companionship into your life. Pets offer
                    unconditional love and can improve your overall well-being.</strong>
                </p>
                <p>Many animals in shelters are looking for loving homes. By adopting, you are giving an animal a second
                  chance at life and freeing up space for other animals in need.</p>
                <blockquote>“Saving one animal won't change the world, but it will change the world for that one
                  animal.”</blockquote>

                <div class="row align-items-center mb-5">
                  <div class="col-12 col-md-6">
                    <p>
                      <strong>Benefits of Adopting a Pet</strong>
                    </p>
                    <ul style="list-style-type:disc;" class="inner-list">
                      <li>You'll save a life.</li>
                      <li>Adopting helps reduce the number of homeless animals.</li>
                      <li>Shelter pets are often already vaccinated and spayed/neutered.</li>
                      <li>Adopting a pet is more affordable than buying one.</li>
                      <li>You can find a pet that fits your lifestyle and personality.</li>
                    </ul>
                  </div>
                  <div class="col-12 col-md-6">
                    <img src="images/blog3.jpg" alt="post-image" class="img-fluid">
                  </div>
                </div>

                <p>Adopting a pet can also provide a sense of purpose and routine, helping to alleviate stress and
                  loneliness. Pets are known to provide emotional support and can even improve your physical health.</p>
                <div class="d-none d-xl-flex justify-content-between my-5">
                  <img src="images/insta1.jpg" alt="post-image" class="img-fluid">
                  <img src="images/insta2.jpg" alt="post-image" class="img-fluid">
                  <img src="images/insta3.jpg" alt="post-image" class="img-fluid">
                  <img src="images/insta4.jpg" alt="post-image" class="img-fluid">
                </div>
                <p>
                  <strong>Get Involved</strong>
                </p>
                <p>If you're not ready to adopt, consider volunteering at your local shelter or donating to support their
                  efforts. Every bit of help counts and makes a difference.</p>

                <div class="post-tags mt-5">
                  <div class="block-tag col-md-12">
                    <ul class="list-unstyled d-flex">
                      <li class="pe-3">
                        <a href="#" class="btn btn-dark fs-6 py-2 px-3">Adopt</a>
                      </li>
                      <li class="pe-3">
                        <a href="#" class="btn btn-dark fs-6 py-2 px-3">Volunteer</a>
                      </li>
                      <li class="pe-3">
                        <a href="#" class="btn btn-dark fs-6 py-2 px-3">Donate</a>
                      </li>
                    </ul>
                  </div>
                </div>

              </div>

<!--               <div id="single-post-navigation" class="my-5">
                <div class="post-navigation d-flex flex-wrap align-items-center justify-content-between">
                  <a itemprop="url" class="post-prev d-flex flex-column text-decoration-none" href="#"
                    title="Previous Post">
                    <span class="text-muted">Previous</span>
                    <h3 class="page-nav-title">How to Care for Your New Pet</h3>
                  </a>
                  <a itemprop="url" class="post-next d-flex flex-column text-decoration-none" href="#"
                    title="Next Post">
                    <span class="text-muted">Next</span>
                    <h3 class="page-nav-title">Top 10 Family-Friendly Pets</h3>
                  </a>
                </div>
              </div> -->

            </div>
          </article>

          <!-- comments -->
      
<section id="post-comment">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="comments-wrap">
                    <h2 class="display-6 fw-normal text-dark my-5">
                        <span class="count" th:text="${comments.size()}"></span> Comments
                    </h2>
                    <div class="comment-list padding-small">
                        <div th:each="comment : ${comments}">
                            <article class="comment-item d-flex flex-wrap mb-3">
                                <div class="col-lg-1 col-sm-3 me-4 mb-3">
                                    <img th:src="${comment.user.profileImageUrl}" alt="default" class="img-fluid rounded-circle">
                                </div>
                                <div class="col-lg-10 col-sm-9 author-wrap">
                                    <div class="author-post">
                                        <div class="comment-meta d-flex">
                                            <h4 class="author-name text-dark pe-1" th:text="${comment.user.username}">Username</h4>
                                            <span class="meta-date text-muted" th:text="${#temporals.format(comment.createdAt, 'MMM d')}">Date</span>
                                        </div>
                                        <p class="no-margin" th:text="${comment.message}">Comment message</p>
                                        <div class="comments-reply">
                                            <a href="#" class="text-decoration-underline text-dark">Reply Now</a>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
                <div class="comment-respond pt-3 mt-5">
                    <h2 class="display-6 fw-normal text-dark my-5">Leave a Comment</h2>
                    <form action="#" th:action="@{/comments}" th:object="${new Comment()}" method="post" class="form-group flex-wrap">
                        <div class="col-lg-12 mb-3">
                            <textarea name="message" placeholder="Write Your Message Here*" class="form-control ps-3" rows="8"></textarea>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-arrow btn-primary btn-lg btn-pill btn-dark fs-6">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
        </div>
      </main>
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
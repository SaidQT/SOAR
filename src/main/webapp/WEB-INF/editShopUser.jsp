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
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Shop user information</title>
<link rel="stylesheet" type="text/css" href="/css/admin.css">
<link rel="stylesheet" type="text/css" href="/css/adminform.css">
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
</head>
<body>
	<div class="container1">
		<div class="navigation">
			<ul>

				<li><img src="/images/logo1.png" alt="logo" id="logo"> <span
					class="title" id="soar">S.O.A.R</span></li>
				<li><a href="/shop/home"> <span class="icon"> <ion-icon
								name="home-outline"></ion-icon>
					</span> <span class="title">Dashboard</span>
				</a></li>

				<li><a href="/shop/add"> <span class="icon"> <ion-icon
								name="paw-outline"></ion-icon>
					</span> <span class="title">Add Pet</span>
				</a></li>
				<li><a href="/shop/edit"> <span class="icon"> <ion-icon
								name="person-outline"></ion-icon>
					</span> <span class="title">Profile</span>
				</a></li>
				<li><a href="/shop/${shop.id}/requests"> <span class="icon">
							<ion-icon name="document-text-outline"></ion-icon>
					</span> <span class="title">Requests</span>
				</a></li>
				<li>
					<form id="logoutForm" method="POST" action="/logout">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<button type="submit" class="logout-button">
							<span class="icon"> <ion-icon name="log-out-outline"></ion-icon>
							</span> <span class="title">Sign Out</span>
						</button>
					</form>
				</li>
			</ul>
			<img src="/images/n.png" id="footer-image">
		</div>
	</div>
	<div class="main">
		<div class="topbar">
			<div class="toggle">
				<ion-icon name="menu-outline"></ion-icon>
			</div>
			<h1 id="page">Edit user information</h1>
		</div>
		<div class="form-container">
			<h2>Update your information</h2>


			<form action="/shop/edit" method="post" class="form-group flex-wrap">
				<input type="hidden" name="_csrf" value="${_csrf.token}" > <input
					type="hidden" name="_method" value="patch">
				<div class="form-input col-lg-12 my-4">
					<input type="hidden" name="username"  value="${user.username}">
					<input type="hidden" name="shopId" value="${user.shop.id}">
					<input type="email" name="email" class="form-control mb-3 p-4" value="${user.email}" placeholder="Email"
						class="form-control mb-3 p-4"> <input type="password"
						name="password" class="form-control mb-3 p-4" placeholder="Password"> <input
						type="password" name="passwordConfirmation"
						class="form-control  p-4" placeholder="Confirm Password">
					<c:if
						test="${result != null && result.hasFieldErrors('passwordConfirmation')}">
						<c:forEach
							items="${result.getFieldErrors('passwordConfirmation')}"
							var="error">
							<span class="form-errors">${error.defaultMessage}</span>
						</c:forEach>
					</c:if>
				</div>
				<div class="d-grid my-2">
					<input type="submit" value="Submit"
						class="btn btn-dark btn-lg rounded-1" />
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript" src="/js/admin.js" defer></script>
	<!-- ====== ionicons ======= -->
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
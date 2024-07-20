<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Shop</title>
<link rel="stylesheet" type="text/css" href="/css/admin.css">
<link rel="stylesheet" type="text/css" href="/css/adminform.css">
</head>
<body>
	<!-- =============== Navigation ================ -->
	<div class="container1">
		<div class="navigation">
			<ul>
				<li><img src="/images/logo1.png" alt="logo" id="logo"> <span
					class="title" id="soar">S.O.A.R</span></li>
				<li><a href="/admin/dashboard"> <span class="icon">
							<ion-icon name="home-outline"></ion-icon>
					</span> <span class="title">Dashboard</span>
				</a></li>
				<li><a href="/admin/home"> <span class="icon"> <ion-icon
								name="list-outline"></ion-icon>
					</span> <span class="title">Tables</span>
				</a></li>
				<li><a href="/admin/add"> <span class="icon"> <ion-icon
								name="person-add-outline"></ion-icon>
					</span> <span class="title">Add Shop</span>
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
	<!-- ========================= Main ==================== -->
	<div class="main">
		<div class="topbar">
			<div class="toggle">
				<ion-icon name="menu-outline"></ion-icon>
			</div>
			<div>
				<h1 id="page">Add A New Shop</h1>
			</div>
		</div>

		
			<div class="form-container">
				<h2>Add Shop</h2>
				<form:form action="/admin/add" method="post"
					modelAttribute="shopForm">
					<p>
						<form:input path="shopName" required="true"
							placeholder="Shop Name" />
					</p>
					<p class="form-errors">
						<form:errors path="shopName" />
					</p>
					<p>
						<form:input path="city" placeholder="Shop City" required="true" />
					</p>
					<p class="form-errors">
						<form:errors path="city" />
					</p>
					<p>
						<form:input type="number" path="maxCapacity" required="true"
							min="0" placeholder="Maximum Capacity" />
					</p>
					<p class="form-errors">
						<form:errors path="maxCapacity" />
					</p>
					<p>
						<form:input type="number" path="currentSize" required="true"
							min="0" placeholder="Total Pet Count" />
					</p>
					<p class="form-errors">
						<form:errors path="currentSize" />
					</p>
					<p>
						<form:input path="phoneNumber" required="true"
							placeholder="Phone Number" />
					</p>
					<p class="form-errors">
						<form:errors path="phoneNumber" />
					</p>
					<p>
						<form:input path="username" required="true"
							placeholder="User Name" />
					</p>
					<p class="form-errors">
						<form:errors path="username" />
					</p>
					<p>
						<form:input path="email" placeholder="User Email" required="true" />
					</p>
					<p class="form-errors">
						<form:errors path="email" />
					</p>
					<p>
						<form:input type="password" path="password" required="true" placeholder="Password" />
					</p>
					<p class="form-errors">
						<form:errors path="password" />
					</p>
					<input type="submit" value="Add Shop" />
				</form:form>
		</div>
	</div>
	<!-- =========== Scripts =========  -->
	<script type="text/javascript" src="/js/admin.js" defer></script>
	<!-- ====== ionicons ======= -->
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
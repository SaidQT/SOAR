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
<link rel="stylesheet" type="text/css" href="/css/forms.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

</head>
<body>
	<nav class="navbar navbar-expand-xl navbar-light bg-light">
		<div class="container-fluid">
			<img src="<spring:url value='/images/cat.png' />" alt="Cat"> <a
				class="navbar-brand" href="/"> Home </a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarBasic"
				aria-controls="navbarBasic" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse show" id="navbarBasic">
				<ul class="navbar-nav me-auto mb-2 mb-xl-0">
				<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/admin/dashboard">Dashboard</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/admin/home">Shops</a></li>
					<li class="nav-item"><a class="nav-link" href="/admin/add">Add
							a shop</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="form-container">
		<h1>Add a new Shop</h1>
		<form:form action="/admin/shops/new" method="post" modelAttribute="shopForm">
			<p>
				<form:input path="shopName" required="true" placeholder="shop Name" />
			</p>
			<p>
				<form:errors path="shopName" />
			</p>
			<p>

				<form:input path="city" placeholder="Shop City" required="true" />
			</p>
			<p>
				<form:errors path="city" />
			</p>
			<p>

				<form:input type="number" path="maxCapacity" required="true" min="0"
					placeholder="Maximum Capacity" />
			</p>
			<p>
				<form:errors path="maxCapacity" />
			</p>
			<p>
				<form:input type="number" path="currentSize" required="true" min="0"
					placeholder="Total pet count" />
			</p>
			<p>
				<form:errors path="currentSize" />
			</p>
			<p>
				<form:input path="phoneNumber" required="true"
					placeholder="Phone number" />
			</p>
			<p>
				<form:errors path="phoneNumber" />
			</p>
			<p>
				<form:input path="username" required="true" placeholder="User Name" />
			</p>
			<p>
				<form:errors path="username" />
			</p>
			<p>

				<form:input path="email" placeholder="User email" required="true" />
			</p>
			<p>
				<form:errors path="email" />
			</p>
			<p>

				<form:input type="password" path="password" required="true"
					placeholder="password" />
			</p>
			<p>
				<form:errors path="password" />
			</p>
			
			<input type="submit" value="Add Shop" />
		</form:form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Shop</title>
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
						aria-current="page" href="/admin/home">Shops</a></li>
					<li class="nav-item"><a class="nav-link" href="/admin/add">Add
							a shop</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="form-container">
		<h1>Edit Shop Information</h1>
		<form:form action="/admin/${shop.id}" method="post"
			modelAttribute="shop">
			<input type="hidden" name="_method" value="patch">
			<p>
				<form:label path="name">Name</form:label>
				<form:input path="name" required="true" />
			</p>
			<p>
				<form:label path="city">City</form:label>
				<form:input path="city" required="true" />
			</p>
			<p>
				<form:label path="maxCapacity">Maximum capacity</form:label>
				<form:input type="number" path="maxCapacity" required="true" />
			</p>
			<p>
				<form:label path="currentSize">Current size</form:label>
				<form:input type="number" path="currentSize" required="true" />
			</p>
			<p>
				<form:label path="phoneNumber">Phone number</form:label>
				<form:input path="phoneNumber" required="true" />
			</p>
			<p>
				<form:errors path="name" />
			</p>
			<p>
				<form:errors path="city" />
			</p>
			<p>
				<form:errors path="maxCapacity" />
			</p>
			<p>
				<form:errors path="currentSize" />
			</p>
			<p>
				<form:errors path="phoneNumber" />
			</p>
			<input type="submit" value="Edit Shop" />
		</form:form>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Pet</title>
<link rel="stylesheet" type="text/css" href="/css/forms.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

</head>
<body>
	<nav class="navbar navbar-expand-xl navbar-light bg-light">
		<div class="container-fluid">
			<img src="<spring:url value='/images/cat.png' />" alt="Cat"> <a
				class="navbar-brand" href="/">Home</a>
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
						aria-current="page" href="/shop/home">Pets</a></li>
					<li class="nav-item"><a class="nav-link" href="/shop/add">Add
							a pet</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="form-container">
		<h1>Edit Pet Information</h1>
		<form:form action="/shop/${pet.id}" method="post" modelAttribute="pet">
			<input type="hidden" name="_method" value="patch">
			<p>
				<form:label path="name">Name</form:label>
				<form:input path="name" required="true" />
			</p>
			<p>
				<form:label path="type">Type</form:label>
				<form:select path="type">
					<form:option value="dog">Dog</form:option>
					<form:option value="cat">Cat</form:option>
					<form:option value="bird">Bird</form:option>
					<form:option value="other">Other</form:option>
				</form:select>
			</p>
			<p>
				<form:label path="city">City</form:label>
				<form:input path="city" required="true" />
			</p>
			<p>
				<form:label path="imageUrl">Image URL</form:label>
				<form:textarea path="imageUrl" />
			</p>
			<p>
				<form:label path="description">Description</form:label>
				<form:textarea path="description" required="true" />
			</p>
			<p>
				<form:label path="status">Status</form:label>
				<form:select path="status">
					<form:option value="Unadopted">Unadopted</form:option>
					<form:option value="Pending">Pending</form:option>
					<form:option value="Adopted">Adopted</form:option>
				</form:select>
			</p>
			<p>
				<form:errors path="name" />
			</p>
			<p>
				<form:errors path="type" />
			</p>
			<p>
				<form:errors path="city" />
			</p>
			<p>
				<form:errors path="imageUrl" />
			</p>
			<p>
				<form:errors path="description" />
			</p>
			<p>
				<form:errors path="status" />
			</p>

			<input type="submit" value="Edit Pet" />
		</form:form>
	</div>
</body>
</html>
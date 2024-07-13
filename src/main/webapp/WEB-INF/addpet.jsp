<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Pet</title>
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
						aria-current="page" href="/shop/home">Pets</a></li>
					<li class="nav-item"><a class="nav-link" href="/shop/add">Add
							a pet</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="form-container">
		<h1>Add a new Pet</h1>

		<form:form action="/pets/new" method="post" modelAttribute="pet">
			<p>

				<form:input path="name" placeholder="Name" required="true" />

			</p>
			<p>

				<form:select path="type">
					<form:option value="dog">Dog</form:option>
					<form:option value="cat">Cat</form:option>
					<form:option value="bird">Bird</form:option>
					<form:option value="other">Other</form:option>
				</form:select>
			</p>
			<p>
				<form:input path="city" required="true" placeholder="City" />
			</p>
			<p>

				<form:textarea path="imageUrl" placeholder="Image URL"
					required="true" />
			</p>
			<p>

				<form:textarea path="description" required="true"
					placeholder="Description" />
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

			<input type="submit" value="Add Pet" />
		</form:form>
	</div>
</body>
</html>
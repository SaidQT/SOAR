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

<link rel="stylesheet" type="text/css" href="/css/admin.css">

<link rel="stylesheet" type="text/css" href="/css/adminform.css">

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
					</span> <span class="title">Add  Pet</span>
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
			<h1 id="page">Edit Pet</h1>
		</div>


		<div class="form-container">
			<h1>Edit Pet Information</h1>
			<form:form action="/shop/${pet.id}" method="post"
				modelAttribute="pet">
				<input type="hidden" name="_method" value="patch">
				<form:input type="hidden" path="shop" value="${pet.shop.id}" />

				<form:input type="hidden" path="user" value="${pet.user}" />
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
					<form:label path="breed">Breed</form:label>
					<form:input path="breed" required="true" />
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
	</div>
	<script type="text/javascript" src="/js/admin.js" defer></script>
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
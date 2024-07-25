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
			<h1 id="page">Edit Pet</h1>
		</div>


		<div class="form-container">
			<h2>Edit Pet Information</h2>
			<form:form action="/shop/${pet.id}" method="post"
				modelAttribute="pet">
				<input type="hidden" name="_method" value="patch">
				<form:input type="hidden" path="shop" value="${pet.shop.id}" />

				<form:input type="hidden" path="user" value="${pet.user}" />
				<p>
					<form:input path="name" required="true" placeholder="Name" />
				</p>
				<p class="form-errors">
					<form:errors path="name" />
				</p>
				<p>
					<form:select path="type">
						<form:option value="dog">Dog</form:option>
						<form:option value="cat">Cat</form:option>
						<form:option value="bird">Bird</form:option>
						<form:option value="other">Other</form:option>
					</form:select>
				</p>
				<p class="form-errors">
					<form:errors path="type" />
				</p>
				<p>
					<form:input path="age" required="true" placeholder="Age" />
				</p>
				<p class="form-errors">
					<form:errors path="age" />
				</p>
				<p>
					<form:input path="breed" required="true" placeholder="Breed" />
				</p>
				<p class="form-errors">
					<form:errors path="breed" />
				</p>
				<p>
					<form:textarea path="imageUrl" placeholder="Image URL" rows="2" cols="50"/>
				</p>
				<p class="form-errors">
					<form:errors path="imageUrl" />
				</p>
				<p>
					<form:textarea path="description" required="true"
						placeholder="
				Description" rows="12" cols="50" />
				</p>
				<p class="form-errors">
					<form:errors path="description" />
				</p>
				<p>
					<form:select path="status">
						<form:option value="Unadopted">Unadopted</form:option>
						<form:option value="Pending">Pending</form:option>
						<form:option value="Adopted">Adopted</form:option>
					</form:select>
				</p>
				<p class="form-errors">
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
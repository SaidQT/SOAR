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
<title>Pets</title>
<link rel="stylesheet" type="text/css" href="/css/table.css">
<link rel="stylesheet" type="text/css" href="/css/admin.css">

</head>
<body>

	<div class="container1">
		<div class="navigation">
			<ul>
				<li><img src="/images/logo1.png" alt="logo" id="logo"> <span
					class="title" id="soar">S.O.A.R</span></li>
				<li><a href="/shop/home"> <span class="icon">
							<ion-icon name="home-outline"></ion-icon>
					</span> <span class="title">Dashboard</span>
				</a></li>
				
				<li><a href="/shop/add"> <span class="icon"> <ion-icon
								name="person-add-outline"></ion-icon>
					</span> <span class="title">Add Pet</span>
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
			<h1 id="page">Shop dashboard</h1>
		</div>
		<div class="section1">
			<div class="tableTitle">
				<h2 id="page">Pets</h2>
				<a class="btn btn-danger" href="/shop/add" id="add">+ Add a new
					Pet</a>
			</div>




			<table>
				<thead>
					<tr>
						<th>Name</th>
						<th>Type</th>
						<th>Age</th>
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="pet" items="${pets}">
						<tr>
							<td><c:out value="${pet.name}"></c:out></td>
							<td><c:out value="${pet.type}"></c:out></td>
							<td><c:out value="${pet.age}"></c:out></td>
							<td><c:out value="${pet.status}"></c:out></td>
							<td id="buttons"><a href="/shop/${pet.id}/edit">Edit</a> | <a
								href="/shop/${pet.id}/delete" style="color: #dc3545">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br> <br>
		</div>

		<script type="module"
			src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
		<script nomodule
			src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
		<script type="text/javascript" src="/js/admin.js" defer></script>
</body>
</html>
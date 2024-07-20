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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tables</title>
<link rel="stylesheet" type="text/css" href="/css/admin.css">
<link rel="stylesheet" type="text/css" href="/css/table.css">
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
			<h1 id="page">Tables</h1>
		</div>
		<div class="section1">
			<div class="tableTitle">
				<h2 id="page">Shops</h2>
				<a href="/admin/add" id="add">+ Add a new Shop</a>
			</div>

			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>Shop</th>
						<th>City</th>
						<th>Capacity</th>
						<th>Pets</th>
						<th>Phone</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="shop" items="${shops}">
						<tr>
							<td><c:out value="${shop.id}"></c:out></td>
							<td><c:out value="${shop.name}"></c:out></td>
							<td><c:out value="${shop.city}"></c:out></td>
							<td><c:out value="${shop.maxCapacity}"></c:out></td>
							<td><c:out value="${shop.currentSize}"></c:out></td>
							<td><c:out value="${shop.phoneNumber}"></c:out></td>
							<td id="buttons"><a href="/admin/${shop.id}/edit">Edit <span
									style="color: black;">|</span>
							</a> <a href="/admin/${shop.id}/delete" style="color: #dc3545;">Delete</a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<br> <br>
			<hr>
			<br> <br>
			<div class="tableTitle">
				<h2 id="page">Users</h2>
			</div>

			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>Username</th>
						<th>Email</th>
						<th>Roles</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${users}">
						<tr>
							<td><c:out value="${user.id}"></c:out></td>
							<td><c:out value="${user.username}"></c:out></td>
							<td><c:out value="${user.email}"></c:out></td>
							<td><c:forEach var="role" items="${user.roles}">
									<c:out value="${role.name}"></c:out>
								</c:forEach></td>

							<td id="buttons"><a href="/admin/${user.id}/delete/user"
								style="color: #dc3545;">Delete</a></td>

						</tr>
					</c:forEach>

				</tbody>
			</table>
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
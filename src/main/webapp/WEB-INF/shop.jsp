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
<title>All Shops</title>
<link rel="stylesheet" type="text/css" href="/css/table.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />


</head>
<body>
	<nav class="navbar navbar-expand-xl navbar-light bg-light">
		<div class="container-fluid">
			<!-- <img src="images/logo.png" alt="logo" class="img-fluid1" />  -->
			<a class="navbar-brand" href="/"> Home </a> <a class="navbar-brand"
				href="/admin/dashboard"> Dashboard </a> <a class="navbar-brand"
				href="/admin/home">Shops</a>
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
	<h2>Our Partners</h2>
	<br>
	<br>
	<table>
		<thead>
			<tr>
				<th>Name</th>
				<th>City</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="shop" items="${shops}">
				<tr>

					<td><c:out value="${shop.name}"></c:out></td>
					<td><c:out value="${shop.city}"></c:out></td>
					<td id="buttons"><a href="/admin/${shop.id}/edit">Edit | </a>
						<a href="/admin/${shop.id}/delete">Delete</a></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<br>
	<br>
	<a class="btn btn-danger" href="/admin/add" id="add">+ Add a new
		Shop</a>
</body>
</html>
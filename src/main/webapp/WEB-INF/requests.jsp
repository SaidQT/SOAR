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
<title>Pet request</title>
<link rel="stylesheet" type="text/css" href="/css/table.css">
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
	<h2>Our Requests</h2>
	<br>
	<br>
	<table>
		<thead>
			<tr>
				<th>Pet name</th>
				<th>Pet type</th>
				<!-- th>Pet breed</th> -->
				<th>User</th>
				<th>Email</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="pet" items="${pets}">
				<tr>
					<c:if test="${pet.status.equals('Pending')}">
						<td><c:out value="${pet.name}"></c:out></td>
						<td><c:out value="${pet.type}"></c:out></td>
					<%-- 	<td><c:out value="${pet.breed}"></c:out></td> --%>
						<td><c:out value="${pet.user.username}"></c:out></td>
						<td><c:out value="${pet.user.email}"></c:out></td>
						<td id="buttons"><a
							href="/shop/${pet.id}/${pet.shop.id}/accept">Accept</a> | <a
							href="/shop/${pet.id}/${pet.shop.id}/destroy">Refuse</a></td>
					</c:if>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<br>
	<a class="btn btn-danger" href="/shop/add" id="add">+ Add a new Pet</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Pet</title>
<link rel="stylesheet" type="text/css" href="/css/admin.css">
<link rel="stylesheet" type="text/css" href="/css/adminform.css">

<link rel="stylesheet" type="text/css" href="/css/table.css">
</head>
<body>
	<!-- =============== Navigation ================ -->
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
	<!-- ========================= Main ==================== -->
	<div class="main">
		<div class="topbar">
			<div class="toggle">
				<ion-icon name="menu-outline"></ion-icon>
			</div>
			<div>
				<h1 id="page">Adoption Requests</h1>
			</div>
		</div>
		<div class="section1">
			<div class="tableTitle">
				<h2 id="page">Requests</h2>

			</div>
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
								<c:forEach var="user" items="${pet.request}">
									<td><c:out value="${pet.name}"></c:out></td>
									<td><c:out value="${pet.type}"></c:out></td>
									<td><c:out value="${user.username}"></c:out></td>
									<td><c:out value="${user.email}"></c:out></td>
									<td id="buttons"><a
										href="/shop/${pet.shop.id}/${pet.id}/${user.id}/accept">Accept</a>
										| <a style="color: #dc3545;"
										href="/shop/${pet.shop.id}/${pet.id}/${user.id}/destroy">Refuse</a></td>
						</tr>
					</c:forEach>
					</c:if>


					</c:forEach>
				</tbody>
			</table>
		</div>
		<script type="text/javascript" src="/js/admin.js" defer></script>

		<!-- ====== ionicons ======= -->
		<script type="module"
			src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
		<script nomodule
			src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Shop user information</title>
<link rel="stylesheet" type="text/css" href="/css/admin.css">
<link rel="stylesheet" type="text/css" href="/css/adminform.css">
</head>
<body>

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
			<h1 id="page">Edit user information</h1>
		</div>
</body>
</html>
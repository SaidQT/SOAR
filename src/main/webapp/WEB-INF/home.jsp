<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<!-- Bootstrap CSS -->
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" type="text/css" href="/css/contactUs.css">
<script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
<%-- 	<h1>
		Welcome Page
		<c:out value="${currentUser.roles[0].name}"></c:out>
	</h1> --%>
	<h1>Welcome, <c:out value="${currentUser.username}"></c:out></h1>
	<form id="logoutForm" method="POST" action="/logout">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" /> <input type="submit" value="Logout!" />
	</form>
	<h1>Welcome to Animal Adoption</h1>
	<div class="categories">
		<a href="/cats">Cats</a> <a href="/dogs">Dogs</a> <a href="/birds">Birds</a>
	</div>
</body>
</html>

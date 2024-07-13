<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pet Profile</title>
</head>
<body>
	




	<form action="/user/${pet.id}/details" method="post" >
		<input type="hidden" name="_method" value="patch">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="submit" value="Adopt this pet" />
	</form>
</body>
</html>
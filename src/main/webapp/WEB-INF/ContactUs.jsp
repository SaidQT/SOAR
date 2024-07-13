<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
	<div class="wrapper">
		<div class="title">
			<h1>Contact Us Form</h1>
		</div>
		<div class="contact-form">
			<form:form method="post"
				action="${pageContext.request.contextPath}/contact"
				modelAttribute="contact">
				<div class="input-fields">
					<form:input path="name" class="input" placeholder="Name" />
					<form:errors path="name" cssClass="error" />

					<form:input path="email" class="input" placeholder="Email Address" />
					<form:errors path="email" cssClass="error" />

					<form:input path="phone" class="input" placeholder="Phone" />
					<form:errors path="phone" cssClass="error" />

					<form:input path="subject" class="input" placeholder="Subject" />
					<form:errors path="subject" cssClass="error" />
				</div>
				<div class="msg">
					<form:textarea path="message" placeholder="Message" />
					<form:errors path="message" cssClass="error" />
					<div>
						<button type="submit" class="btn">Send</button>
					</div>
				</div>
			</form:form>
		</div>
		<div>
			<c:if test="${not empty successMessage}">
				<p>${successMessage}</p>
			</c:if>
		</div>
	</div>
</body>
</html>

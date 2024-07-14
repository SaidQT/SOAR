<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>My Besties</title>
</head>
<body>
    <h1>Welcome to your besties pets</h1>
    <div class="row">
        <c:if test="${requestPets != null}">
            <c:forEach var="pet" items="${requestPets}">
                <div class="col-md-4">
                    <div class="pet-card">
                        <img src="${pet.imageUrl}" alt="${pet.name}"> </a> <i
                            class="favorite-icon far fa-heart" data-pet-id="1"></i>
                        <div class="dummy-data">
                            <p>
                                <c:out value="${pet.type}"></c:out>
                            </p>
                            <p>
                                <c:out value="${pet.name}"></c:out>
                            </p>
                            <p>
                                <c:out value="${pet.status}"></c:out>
                            </p>
                            <c:if test="${pet.status == 'Pending'}">
                                <form action="/user/cancel" method="post">
                                    <input type="hidden" name="petId" value="${pet.id}"> <input
                                        type="hidden" name="${_csrf.parameterName}"
                                        value="${_csrf.token}" /> <input type="hidden" name="_method"
                                        value="patch">
                                    <button type="submit">Cancel adoption</button>
                                </form>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" type="text/css" href="/css/button.css">
<script type="text/javascript" src="/js/button.js"></script>

<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
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

	<div class="container mt-5">
		<h1>Admin Dashboard</h1>
		<div class="row">
			<div class="col-md-6">
				<div class="card mb-4">
					<div class="card-header" style="background-color: #DEAD6F;">Shops
						Overview</div>
					<div class="card-body">
						<p>
							Total Shops:
							<c:out value="${totalShops}" />
						</p>
					</div>
				</div>
			</div>

			<h2 class="mt-5">Shop Data Chart</h2>
			<canvas id="shopChart" width="400" height="200"></canvas>
		</div>
	</div>






























	<script>
	
	var shopData = {
        names: [
            <c:forEach var="shop" items="${shops}" varStatus="loop">
                "${shop.name}"${!loop.last ? ',' : ''}
            </c:forEach>
        ],
        capacities: [
            <c:forEach var="shop" items="${shops}" varStatus="loop">
                ${shop.maxCapacity}${!loop.last ? ',' : ''}
            </c:forEach>
        ]
    };

    // Initialize Chart.js
    var ctx = document.getElementById('shopChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar', // Use 'bar', 'line', 'pie', etc. based on your preference
        data: {
            labels: shopData.names, // Names of the shops
            datasets: [{
                label: 'Max Capacity', // Label for the dataset
                data: shopData.capacities, // Max capacities for each shop
                backgroundColor: '#dead6f', // Bar color
                borderColor: '#dead6f', // Border color
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true // Start y-axis from zero
                }
            }
        }
    });
    </script>
</body>
</html>
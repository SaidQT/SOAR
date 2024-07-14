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
			<button id="hamburger-btn">☰</button>

	<div class="sidebar" id="sidebar">
 <img src="/images/logo.png" alt="logo"
class="img-fluid">
        <span class="soar">S.O.A.R</span>
		<a href="/admin/dashboard"><i class="fas fa-tachometer-alt"></i>
			Dashboard</a> <a href="/admin/home"><i class="fas fa-store"></i>
			Shops</a> <a href="/admin/add"><i class="fas fa-plus-circle"></i> Add
			a Shop</a> <a href="/logout"><i class="fas fa-sign-out-alt"></i>
			Logout</a>
		</div>
	</div>

	<div class="main-content" id="main-content">
		<h1>Admin Dashboard</h1>
		<div class="row">
			<div class="col-md-6">
				<div class="card mb-4">
					<div class="card-header" style="background-color: #DEAD6F;">Shops Overview</div>
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

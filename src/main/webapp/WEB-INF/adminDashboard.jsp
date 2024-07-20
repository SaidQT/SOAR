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
<link rel="stylesheet" type="text/css" href="/css/admin.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<!-- =============== Navigation ================ -->
	<div class="container1">
		<div class="navigation">
			<ul>
				<li><img src="/images/logo1.png" alt="logo" id="logo"> <span
					class="title" id="soar">S.O.A.R</span></li>
				<li><a href="/admin/dashboard"> <span class="icon">
							<ion-icon name="home-outline"></ion-icon>
					</span> <span class="title">Dashboard</span>
				</a></li>
				<li><a href="/admin/home"> <span class="icon"> <ion-icon
								name="list-outline"></ion-icon>
					</span> <span class="title">Tables</span>
				</a></li>
				<li><a href="/admin/add"> <span class="icon"> <ion-icon
								name="person-add-outline"></ion-icon>
					</span> <span class="title">Add Shop</span>
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
				<h1 id="page">Admin Dashboard</h1>
			</div>
		</div>

		<!-- ======================= Cards ================== -->
		<div class="cardBox">
			<div class="card">
				<div>
					<div class="numbers">${totalShops}</div>
					<div class="cardName">Partners</div>
				</div>
				<div class="iconBx">
					<ion-icon name="people-circle-outline"></ion-icon>
				</div>
			</div>

			<div class="card">
				<div>
					<div class="numbers">${adoptedPetCount}</div>
					<div class="cardName">Adopted Pets</div>
				</div>
				<div class="iconBx">
					<ion-icon name="heart"></ion-icon>
				</div>
			</div>

			<div class="card">
				<div>
					<div class="numbers">${unadoptedPetCount}</div>
					<div class="cardName">Unadopted Pets</div>
				</div>
				<div class="iconBx">
					<ion-icon name="paw"></ion-icon>
				</div>
			</div>

			<div class="card">
				<div>
					<div class="numbers">$0</div>
					<div class="cardName">Donations</div>
				</div>
				<div class="iconBx">
					<ion-icon name="wallet"></ion-icon>
				</div>
			</div>
		</div>

		<!-- ================ Statistical Analysis ================= -->
		<div class="details">
			<div class="recentOrders">
				<div class="cardHeader">
					<h2>Distribution of Shops Across Cities</h2>
				</div>
				<br>
				<!-- Chart for Shops per City -->
				<canvas id="shopsPerCityChart"></canvas>
			</div>

			<!-- ================= New Partners ================ -->
			<div class="recentCustomers">
				<div class="cardHeader">
					<h2>Recent Partners</h2>
					<a href="/admin/home" class="btn">View All</a>
				</div>
				<table>
					<c:forEach var="shop" items="${lastFiveShops}">
						<tr>
							<td>
								<h4>
									${shop.name} <br> <span>${shop.city}</span>
								</h4>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>


			<!-- =========== Scripts =========  -->
			<!-- Chart data as JSON object -->
			<script type="text/javascript">
                    var chartData = {
                        labels: [<c:forEach var="entry" items="${shopsPerCity}">
                            "${entry.key}",</c:forEach>],
                        data: [<c:forEach var="entry" items="${shopsPerCity}">
                            ${entry.value},</c:forEach>]
                    };
                </script>
			<script type="text/javascript" src="/js/admin.js" defer></script>
			<script type="text/javascript" src="/js/chart.js" defer></script>

			<!-- ====== ionicons ======= -->
			<script type="module"
				src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
			<script nomodule
				src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
		</div>
	</div>
</body>
</html>

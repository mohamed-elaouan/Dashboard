<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="Models.Commandes"%>
<%@ page import="Models.MonthStructure"%>
<%@ page import="Models.WeekStructure"%>
<%
ArrayList<Commandes> liste = (ArrayList<Commandes>) request.getAttribute("list");
ArrayList<MonthStructure> MonthData = (ArrayList<MonthStructure>) request.getAttribute("MoisData");
ArrayList<WeekStructure> WeekData = (ArrayList<WeekStructure>) request.getAttribute("SemaineData");
//
int nbrVente = (int) request.getAttribute("nbrVente");
int nbrClient = (int) request.getAttribute("nbrClient");
int nbrMagasin = (int) request.getAttribute("nbrMagasin");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark"
		style="height: 70px">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="/MyEcommerce/homePage"><img
			src="assets/img/Bimo.png" height="60px" style="margin-top: 0px"></a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>

	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading"></div>
						<a class="nav-link" href="/MyEcommerce/homePage">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard
						</a>


						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> Authentication
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="login.html">Login</a> <a
											class="nav-link" href="register.html">Register</a> <a
											class="nav-link" href="password.html">Forgot Password</a>
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="401.html">401 Page</a> <a
											class="nav-link" href="404.html">404 Page</a> <a
											class="nav-link" href="500.html">500 Page</a>
									</nav>
								</div>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">Analyse</div>
						<a class="nav-link" href="/MyEcommerce/Statistique">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> Statistique de Vente
						</a> <a class="nav-link" href="/MyEcommerce/CommandeTable">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Commandes
						</a>
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Dashboard</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">Dashboard</li>
					</ol>
					<div class="row">
						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body">Nombre Total des Ventes</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="#">View
										Details</a>
									<div class="small text-white">
										<strong><%=nbrVente%></strong>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-info text-white mb-4">
								<div class="card-body">Nombre Total des Client Achete</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="#">View
										Details</a>
									<div class="small text-white">
										<strong><%=nbrClient%></strong>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-success text-white mb-4">
								<div class="card-body">Nombre Total des Magasin</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="#">View
										Details</a>
									<div class="small text-white">
										<strong><%=nbrMagasin%></strong>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-area me-1"></i> Ventes Par Semaine
								</div>
								<div class="card-body">
									<canvas id="myAreaChart" width="100%" height="40"></canvas>
								</div>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-bar me-1"></i> Ventes Par Mois
								</div>
								<div class="card-body">
									<canvas id="myBarChart" width="100%" height="40"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="card mb-4">

						<div class="card-header">
							<i class="fas fa-table me-1"></i> DataTable Example
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>Magasin</th>
										<th>Stock</th>
										<th>Client</th>
										<th>Qunatité</th>
										<th>Date de Commmande</th>
										<th>Montant Total</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Name</th>
										<th>Position</th>
										<th>Office</th>
										<th>Age</th>
										<th>Start date</th>
										<th>Salary</th>
									</tr>
								</tfoot>
								<tbody>
									<%
									for (int i = 0; i <= liste.size() - 1; i++) {
									%>

									<tr>
										<td><%=liste.get(i).getMagasin()%></td>
										<td><%=liste.get(i).getStock()%></td>
										<td><%=liste.get(i).getClient()%></td>
										<td><%=liste.get(i).getQuantite()%></td>
										<td><%=liste.get(i).getDate()%></td>
										<td><%=liste.get(i).getMontant()%></td>
									</tr>

									<%
									}
									%>


								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2023</div>

					</div>
				</div>
			</footer>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>

	<script>
		//src="assets/demo/chart-area-demo.js"
		Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#292b2c';

		var titles = [];
		var values = [];
		var Montant_Total = 0.0;
	<%Double Montant = (Double) request.getAttribute("MontantTotal");//ArrayList<WeekStructure> employeeList = (ArrayList<WeekStructure>) request.getAttribute("employeeList");
if (WeekData != null) {
	for (WeekStructure DWeek : WeekData) {%>
		titles.push(
	<%=DWeek.getNumWeek()%>
		);
		values.push(
	<%=DWeek.getMontant()%>
		);
	<%}
}%>
		// Area Chart Example
		var ctx = document.getElementById("myAreaChart");
		var myLineChart = new Chart(ctx, {
			type : 'line',
			data : {

				labels : titles,

				datasets : [ {
					label : "Sessions",

					lineTension : 0.3,
					backgroundColor : "rgba(2,117,216,0.2)",
					borderColor : "rgba(2,117,216,1)",
					pointRadius : 5,
					pointBackgroundColor : "rgba(2,117,216,1)",
					pointBorderColor : "rgba(255,255,255,0.8)",
					pointHoverRadius : 5,
					pointHoverBackgroundColor : "rgba(2,117,216,1)",
					pointHitRadius : 50,
					pointBorderWidth : 2,

					data : values,

				} ],
			},
			options : {
				scales : {
					xAxes : [ {
						time : {
							unit : 'date'
						},
						gridLines : {
							display : false
						},
						ticks : {
							maxTicksLimit : 7
						}
					} ],
					yAxes : [ {
						ticks : {
							min : 0,
							max :
	<%=Montant%>
		,
							maxTicksLimit : 5
						},
						gridLines : {
							color : "rgba(0, 0, 0, .125)",
						}
					} ],
				},
				legend : {
					display : false
				}
			}
		});
	</script>

	<script>
		// Set new default font family and font color to mimic Bootstrap's default styling
		Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#292b2c';

		// Bar Chart Example
		var ctx = document.getElementById("myBarChart");

		var titles = [];
		var values = [];
		var Montant_Total = 0.0;
	<%//Double Montant = (Double) request.getAttribute("MontantTotal");//ArrayList<WeekStructure> employeeList = (ArrayList<WeekStructure>) request.getAttribute("employeeList");
if (MonthData != null) {
	for (MonthStructure DMonth : MonthData) {%>
		titles.push(
	<%=DMonth.getNumMonth()%>
		);
		values.push(
	<%=DMonth.getMontant()%>
		);
	<%}
}%>
		var myLineChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : titles,
				datasets : [ {
					label : "Revenue",
					backgroundColor : "rgba(2,117,216,1)",
					borderColor : "rgba(2,117,216,1)",
					data : values,
				} ],
			},
			options : {
				scales : {
					xAxes : [ {
						time : {
							unit : 'month'
						},
						gridLines : {
							display : false
						},
						ticks : {
							maxTicksLimit : 6
						}
					} ],
					yAxes : [ {
						ticks : {
							min : 0,
							max :
	<%=Montant%>
		,
							maxTicksLimit : 5
						},
						gridLines : {
							display : true
						}
					} ],
				},
				legend : {
					display : false
				}
			}
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>

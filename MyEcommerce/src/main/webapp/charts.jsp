<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="Models.Commandes"%>
<%@ page import="Models.MonthStructure"%>
<%@ page import="Models.WeekStructure"%>
<%@ page import="Models.MagasinStructure"%>
<%
ArrayList<Commandes> liste = (ArrayList<Commandes>) request.getAttribute("list");
ArrayList<MonthStructure> MonthData = (ArrayList<MonthStructure>) request.getAttribute("MoisData");
ArrayList<WeekStructure> WeekData = (ArrayList<WeekStructure>) request.getAttribute("SemaineData");
ArrayList<MagasinStructure> MagasinData = (ArrayList<MagasinStructure>) request.getAttribute("Magasin");
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
<title>Statisque</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
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
					<h1 class="mt-4">Charts</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="/MyEcommerce/homePage">Dashboard</a></li>
						<li class="breadcrumb-item active">Statistique</li>
					</ol>
					<div class="card mb-4">
						<div class="card-body">Les ventes du biscuit Funny ont connu
							une croissance impressionnante au cours de la dernière année. En
							comparant les chiffres de l'année dernière à ceux de cette année,
							nous constatons une augmentation de 50 % des ventes totales.
							Cette croissance est particulièrement notable dans la catégorie
							des biscuits pour enfants, où les ventes ont augmenté de 75 %. De
							plus, les ventes en ligne ont augmenté de manière significative,
							représentant désormais 40 % de toutes les ventes de biscuits
							Funny. Ces statistiques démontrent clairement que le biscuit
							Funny est un produit très populaire qui continue de gagner en
							notoriété et en demande.</div>
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-area me-1"></i> Les Ventes qui Fait par
							semaine
						</div>
						<div class="card-body">
							<canvas id="myAreaChart" width="100%" height="30"></canvas>
						</div>
						<!--  <div class="card-footer small text-muted">Updated yesterday
							at 11:59 PM</div>
							-->
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-bar me-1"></i> Les Ventes qui Fait par
									mois
								</div>
								<div class="card-body">
									<canvas id="myBarChart" width="100%" height="50"></canvas>
								</div>
								<!--  <div class="card-footer small text-muted">Updated
									yesterday at 11:59 PM</div>-->
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-pie me-1"></i> Nombre de Vente Ventes
									par Magasin
								</div>
								<div class="card-body">
									<canvas id="myPieChart" width="100%" height="50"></canvas>
								</div>

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
	<script>
		//src="assets/demo/chart-pie-demo.js"
		// Set new default font family and font color to mimic Bootstrap's default styling
		Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#292b2c';

		// Pie Chart Example
		var ctx = document.getElementById("myPieChart");
		var titles = [];
		var values = [];
		var Colors = [];
		
		function randomColor() {
		    const letters = '0123456789ABCDEF';
		    let color = '#';
		    for (let i = 0; i < 6; i++) {
		        color += letters[Math.floor(Math.random() * 16)];
		    }
		    return color;
		}
		
	<%//Double Montant = (Double) request.getAttribute("MontantTotal");//ArrayList<WeekStructure> employeeList = (ArrayList<WeekStructure>) request.getAttribute("employeeList");
if (MagasinData != null) {
	for (MagasinStructure DMagasin : MagasinData) {%>
	
		//var randomValue = () => Math.floor(Math.random() * 256).toString(16).padStart(2, '0');
		Colors.push(randomColor());
		
		
		
		
		
		titles.push(`<%=DMagasin.getMagasin_Name()%>
		`);
		values.push(
	<%=DMagasin.getNombre_Vente()%>
		);
	<%}
}%>
		var myPieChart = new Chart(ctx, {
			type : 'pie',
			data : {
				labels : titles,
				datasets : [ {
					data : values,
					backgroundColor : Colors,
				} ],
			},
		});
		window.console.write(titles);
		console.log(values);
		console.log(Colors);
	</script>
</body>
</html>

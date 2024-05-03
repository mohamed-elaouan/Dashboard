<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="Models.Commandes"%>
<%
ArrayList<Commandes> liste = (ArrayList<Commandes>) request.getAttribute("list");
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
<title>Commandes</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
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


						
						<div class="sb-sidenav-menu-heading">Gestion</div>
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
					<h1 class="mt-4">Les Commandes</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="/MyEcommerce/homePage">Dashboard</a></li>
						<li class="breadcrumb-item active">Commandes</li>
					</ol>
					<div class="card mb-4"></div>
					<div class="card mb-4">
						<!-- <div class="card-header">
							<i class="fas fa-table me-1"></i> DataTable Example
						</div> -->
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
										<th>Magasin</th>
										<th>Stock</th>
										<th>Client</th>
										<th>Qunatité</th>
										<th>Date de Commmande</th>
										<th>Montant Total</th>
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
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>

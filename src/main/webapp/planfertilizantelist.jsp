<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Planes De Fertilización</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="#" class="navbar-brand"> Gestión de Planes de Fertilización </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Plan Fertilizante</a></li>
			</ul>

		</nav>
	</header>

	<main>
		<div class="row">
			<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

			<div class="container">
				<h3 class="text-center">Listado de Planes de Fertilización</h3>
				<hr>
				<div class="container text-left">

					<a href="<%=request.getContextPath()%>/planfertilizante/new" class="btn btn-success">Agregar
						Nuevo Plan Fertilizante</a>
				</div>
				<br>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>Fertilizante</th>
							<th>Número Bultos</th>
							<th>Gramos Palma</th>
						</tr>
					</thead>
					<tbody>
						<!--   for (Todo todo: todos) {  -->
						<c:forEach var="planfertilizante" items="${planesFertilizantes}">

							<tr>
								<td><c:out value="${planfertilizante.id}" /></td>
								<td><c:out value="${planfertilizante.fertilizante.nombre}" /></td>
								<td><c:out value="${planfertilizante.numeroBultos}" /></td>
								<td><c:out value="${planfertilizante.gramosPalma}" /></td>
								<td><a href="planfertilizante/edit?id=<c:out value='${planfertilizante.id}' />">Editar</a>
									&nbsp;&nbsp;&nbsp;&nbsp; <a
									href="planfertilizante/delete?id=<c:out value='${planfertilizante.id}' />">Eliminar</a></td>
							</tr>
						</c:forEach>
						<!-- } -->
					</tbody>

				</table>
			</div>
		</div>

	</main>
</body>
</html>
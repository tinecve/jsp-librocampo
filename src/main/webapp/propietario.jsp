<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Propietario</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
</head>
<body>

	<nav class="navbar navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img
				src="/docs/5.1/assets/brand/bootstrap-logo.svg" alt="" width="30"
				height="24" class="d-inline-block align-text-top"> Libro del
				Campo
			</a>
		</div>
	</nav>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="#" class="navbar-brand"> Gestión de Propietarios </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/propietario/list"
					class="nav-link">Propietarios</a></li>
			</ul>
		</nav>
	</header>

	<main>

		<div class="container col-md-5">
			<div class="card">
				<div class="card-body">

					<c:if test="${propietario != null}">
						<form action="<%=request.getContextPath()%>/propietario/update"
							method="post">
					</c:if>
					<c:if test="${propietario == null}">
						<form action="<%=request.getContextPath()%>/propietario/insert"
							method="post">
					</c:if>

					<caption>
						<h2>
							<c:if test="${propietario != null}">
                                    Editar Propietario
                            </c:if>
							<c:if test="${propietario == null}">
                                    Agregar Nuevo Propietario
                            </c:if>
						</h2>
					</caption>

					<c:if test="${propietario != null}">
						<input type="hidden" name="id"
							value="<c:out value='${propietario.id}' />" />
					</c:if>

					<fieldset class="form-group">
						<label>Nombre</label> <input type="text"
							value="<c:out value='${propietario.nombre}' />"
							class="form-control" name="nombre" required="required">
					</fieldset>

					<fieldset class="form-group">
						<label>Apellido</label> <input type="text"
							value="<c:out value='${propietario.apellido}' />"
							class="form-control" name="apellido">
					</fieldset>

					<fieldset class="form-group">
						<label>Email</label> <input type="email"
							value="<c:out value='${propietario.email}' />"
							class="form-control" name="email">
					</fieldset>

					<fieldset class="form-group">
						<label>Contraseña</label> <input type="password"
							value="<c:out value='${propietario.contrasenia}' />"
							class="form-control" name="contrasenia">
					</fieldset>

					<fieldset class="form-group">
						<label>Número de Cedula</label> <input type="text"
							value="<c:out value='${propietario.noCedula}' />"
							class="form-control" name="noCedula">
					</fieldset>

					<fieldset class="form-group">
						<label>Telefono</label> <input type="tel"
							value="<c:out value='${propietario.telefono}' />"
							class="form-control" name="telefono">
					</fieldset>

					<fieldset class="form-group">
						<label>Expedicion de Cedula</label> <input type="text"
							value="<c:out value='${propietario.expedicionCedula}' />"
							class="form-control" name="expedicionCedula">
					</fieldset>

					<div class="d-flex justify-content-end">
						<button type="submit" class="btn btn-success m-3">Guardar</button>
					</div>

					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>
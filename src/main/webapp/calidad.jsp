<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calidad</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>


	<header>
		<%@ include file = "partials/menu.jsp" %>
	</header>

	<main>

		<div class="container col-md-5">
			<div class="card">
				<div class="card-body">

					<c:if test="${calidad != null}">
						<form action="<%=request.getContextPath()%>/calidad/update"
							method="post">
					</c:if>
					<c:if test="${calidad == null}">
						<form action="<%=request.getContextPath()%>/calidad/insert"
							method="post">
					</c:if>

					<caption>
						<h2>
							<c:if test="${calidad != null}">
                                    Editar Calidad
                                </c:if>
							<c:if test="${calidad == null}">
                                    Agregar Nuevo Calidad
                                </c:if>
						</h2>
					</caption>

					<c:if test="${calidad != null}">
						<input type="hidden" name="id"
							value="<c:out value='${calidad.id}' />" />
					</c:if>

					<fieldset class="form-group">
						<label>Fecha</label> <input type="date"
							value="<c:out value='${calidad.fecha}' />" class="form-control"
							name="fecha" required="required">
					</fieldset>

					<fieldset class="form-group">
						<label>Cultivo</label> <select class="form-select" name="cultivo"
							aria-label="Default select example">
							<c:forEach var="cultivo" items="${cultivos}">
								<option value="<c:out value='${cultivo.id}' />"
									<c:if test="${cultivo.id == calidad.cultivo.id}">
									selected
								</c:if>><c:out
										value='${cultivo.id}' /></option>
							</c:forEach>
						</select>
					</fieldset>


					<fieldset class="form-group">
						<label>Porcentaje Verdes</label> <input type="number"
							value="<c:out value='${calidad.porcentajeVerdes}' />"
							class="form-control" name="porcentajeVerdes">
					</fieldset>

					<fieldset class="form-group">
						<label>Porcentaje Sobremaduros</label> <input type="number"
							value="<c:out value='${calidad.porcentajesobremaduros}' />"
							class="form-control" name="porcentajeSobremaduros">
					</fieldset>

					<fieldset class="form-group">
						<label>Porcentaje Pedunculo Largo</label> <input type="number"
							value="<c:out value='${calidad.porcentajePedunculoLargo}' />"
							class="form-control" name="porcentajePedunculoLargo">
					</fieldset>

					<fieldset class="form-group">
						<label>Porcentaje Podridos</label> <input type="number"
							value="<c:out value='${calidad.porcentajePodridos}' />"
							class="form-control" name="porcentajePodridos">
					</fieldset>

					<fieldset class="form-group">
						<label>Impurezas</label> <select class="form-select"
							name="impurezas">
							<option value="Si"
								<c:if test="${1 == calidad.impurezas}">
									selected
								</c:if>>Si</option>
							<option value="No"
								<c:if test="${0 == calidad.impurezas}">
									selected
								</c:if>>No</option>
						</select>
					</fieldset>


					<div class="d-flex justify-content-end">
						<button type="submit" class="btn btn-success m-3">Guardar</button>
					</div>

					</form>
				</div>
			</div>
		</div>
	</main>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>
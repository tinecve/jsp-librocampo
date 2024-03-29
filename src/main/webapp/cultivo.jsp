<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cultivo</title>
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

					<c:if test="${cultivo != null}">
						<form action="<%=request.getContextPath()%>/cultivo/update"
							method="post">
					</c:if>
					<c:if test="${cultivo == null}">
						<form action="<%=request.getContextPath()%>/cultivo/insert"
							method="post">
					</c:if>

					<caption>
						<h2>
							<c:if test="${cultivo != null}">
                                    Editar Cultivo
                                </c:if>
							<c:if test="${cultivo == null}">
                                    Agregar Nuevo Cultivo
                                </c:if>
						</h2>
					</caption>

					<c:if test="${cultivo != null}">
						<input type="hidden" name="id"
							value="<c:out value='${cultivo.id}' />" />
					</c:if>

					<fieldset class="form-group">
						<label>Nombre</label> <input type="text"
							value="<c:out value='${cultivo.nombre}' />" class="form-control"
							name="nombre">
					</fieldset>

					<fieldset class="form-group">
						<label>Finca</label>
						<select class="form-select" name="finca">
							<c:forEach var="finca" items="${fincas}">
								<option value="<c:out value='${finca.nombre}' />"
									<c:if test="${finca.id == cultivo.finca.id}">
									selected
								</c:if>><c:out
										value='${finca.id}' /></option>
							</c:forEach>
						</select>
					</fieldset>

					<fieldset class="form-group">
						<label>Número</label> <input type="number"
							value="<c:out value='${cultivo.numero}' />" class="form-control"
							name="numero">
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
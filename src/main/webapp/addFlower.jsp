<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="com.jacaranda.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FC - Añadir artículo</title>
</head>
<body>
<% HttpSession se = request.getSession(); 
	String isSession = (String) se.getAttribute("login");
	User userSession = (User) se.getAttribute("user");
	if(isSession != null && userSession !=null && isSession.equals("True")){ %>
		<form action="addFlower.jsp" method="post">
		<div class="formTitle">
	   		<p>Añadir artículo</p>
	   	</div>
   		<div class="name">
   			<label class="label" for="name">Nombre</label>
   			<input type="text" class="form-input" placeholder="Clavel" name="name" required>
   		</div>
        <div class="description">
        	<label class="label" for="description">Descripción</label>
          	<input type="text" class="form-input" placeholder="Dianthus caryophyllus" name="description">
        </div>
        <div class="price">
        	<label class="label" for="price">Precio</label>
          	<input type="number" class="form-input" name="price" required>
        </div>
        <div class="color">
        	<label class="label" for="color">Código de color</label>
          	<input type="text" class="form-input" placeholder="#680471" name="color" required>
        </div>
        <div class="button">
        	<button type="submit">Enviar</button><br>
        	<p><a href="LoginServlet">Volver a la lista de artículos</a></p>
        </div>
     </form>
	<%}else{%>
		<jsp:forward page="error.jsp?msg='El usuario o la clave no son correctos'"></jsp:forward>
	<%}
%>

</body>
</html>
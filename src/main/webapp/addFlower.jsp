<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="com.jacaranda.model.User" %>
    <%@ page import ="com.jacaranda.model.Flower" %>
    <%@ page import ="com.jacaranda.model.Color" %>
    <%@ page import ="com.jacaranda.ddbb.ColorControl" %>
    <%@ page import ="com.jacaranda.ddbb.FlowerControl" %>
    <%@ page import="java.util.ArrayList" %>
    <%@page import="java.util.Map"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FC - Añadir artículo</title>
</head>
<body>
<% HttpSession se = request.getSession(); 
	User userSession = (User) se.getAttribute("user");
	if(userSession !=null && userSession.isAdmin()){ 
		Map params = request.getParameterMap();
		if(params.size() > 0){
			//Guardo los valores del formulario
			String name = request.getParameter("name");
			String description = request.getParameter("description");
			Float price = Float.parseFloat(request.getParameter("price"));
			Color color = ColorControl.getColor(request.getParameter("color"));
			//Creo el objeto y lo guardo en la base de datos
			Flower newFlower = new Flower(name, description, price, color);
			try{
				FlowerControl.addFlower(newFlower);%>
				<jsp:forward page="flowerList.jsp"></jsp:forward>
			<%}catch(Exception e){
				String message = e.getMessage();%>
				<jsp:forward page="errorBackToList.jsp"><jsp:param name="error" value="<%= message %>"/></jsp:forward>
		  <%}
		}else{%>
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
		          	<input type="text" class="form-input" placeholder="1.20" name="price" required>
		        </div>
		        <div class="color">
		        	<label class="label" for="color">Código de color</label>
		        	<select name="color" required> 
		        	<% ArrayList<Color> colors = ColorControl.getColors();
		        			for(Color c: colors){%>
		        				<option value="<%= c.getCode() %>"><%= c.getName() %> - <%= c.getCode() %></option>
		        			<%}
		        	%>
		        	</select>
		        </div>
		        <div class="button">
		        	<button type="submit">Enviar</button><br>
		        	<p><a href="LoginServlet">Volver a la lista de artículos</a></p>
		        </div>
		     </form>
	  <%}
		%>
		
	<%}else{%>
		<jsp:forward page="error.jsp?msg='No te has autenticado o no estás autorizado'"></jsp:forward>
	<%}
%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="com.jacaranda.model.User" %>
    <%@ page import ="com.jacaranda.model.Flower" %>
    <%@ page import ="com.jacaranda.model.Cart" %>
    <%@ page import ="com.jacaranda.model.CartItem" %>
    <%@ page import ="com.jacaranda.ddbb.FlowerControl" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FC - Carrito</title>
</head>
<body>

	<%HttpSession se = request.getSession(); 
	User userSession = (User) se.getAttribute("user");
	if(userSession !=null){
		Cart cart = (Cart) se.getAttribute("cart");
		ArrayList<CartItem> items = cart.getItems();%>
		<div class="header">
			<a href='index.jsp' class='btn' id='link'>Cerrar sesión</a>"
			Floristería Colás
			<div class='user'>Hola <%=userSession.getFirstName() %>  + </div> 
		</div>
		<div class="grid-container">
			Mi carrito
			<%for(CartItem i: items){%>
				<div class="grid-item">
					<div class="image">
					</div>
					<div class="info">
					</div>
					<div class="buttons">
						<form method="post">
						</form>
					</div>
					<%= i.toString() %>
				</div>
			<%}%>
		</div>
		
	<% }else {
		response.sendRedirect("error.jsp?msg='No te has autenticado o no estás autorizado'");
	} %>

</body>
</html>
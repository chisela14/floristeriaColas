<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FC - Iniciar sesión</title>
<link rel='stylesheet' type='text/css'  href='css/style.css'>
</head>
<body>
<% session.invalidate(); %>
<div class="content">
	<div class="title">
		<h1>Floristería Colás</h1>
	</div>
	<div class="image">
	<img src="media/flores.jpg">
	</div>
	<form action="LoginServlet" method="post">
		<div class="formTitle">
	   		<p>Iniciar sesión</p>
	   	</div>
   		<div class="user">
   			<label class="label" for="username">Username</label>
   			<input type="text" class="form-input" placeholder="Username" name="username" required>
   		</div>
        <div class="password">
        	<label class="label" for="password">Password</label>
          	<input type="password" class="form-input" placeholder="Password" name="password" required>
        </div>
        <div class="button">
        	<button type="submit">Enviar</button><br>
        	<p><a href="signup.html">También puedes crear una cuenta nueva pulsando aquí</a></p>
        </div>
     </form>
</div>

</body>
</html>
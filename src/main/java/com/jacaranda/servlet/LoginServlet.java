package com.jacaranda.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import com.jacaranda.ddbb.ControlException;
import com.jacaranda.ddbb.FlowerControl;
import com.jacaranda.ddbb.UserControl;
import com.jacaranda.model.Flower;
import com.jacaranda.model.User;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String passwordEncript = DigestUtils.md5Hex(password);
		String error = null;
		//Comprobar que se introducen un usuario y una contraseña
		if(username == null || username.isBlank() ||username.isEmpty() ||
				password == null || password.isBlank() ||password.isEmpty()) {
			response.getWriter().append("<!DOCTYPE html>\n"
					+ "<html>\n"
					+ "<head>\n"
					+ "	<title>FC - Error</title>\n"
					+ "	<link type=\"text/css\" rel=\"stylesheet\" href=\"css/error.css\" />\n"
					+ "</head>\n"
					+ "<body>\n"
					+ "    <div>\n"
					+ "        <h1>Error</h1>\n"
					+ "        <h2>Deben introducirse un usuario y una contraseña</h2>\n"
					+ "        <a href='index.jsp'>volver</a>\n"
					+ "    </div>\n"
					+ "</div>\n"
					+ "</body>\n"
					+ "</html>");
		}else {
			try {
				//Comprobar si el usuario es válido
				if(UserControl.checkUser(username, passwordEncript)) {
					//recuperar sesión con tipo User
					User user = UserControl.getUser(username);
					HttpSession session = request.getSession();
					session.setAttribute("usuario", user);
					ArrayList<Flower> flowerList = FlowerControl.getFlowerList();
					response.getWriter().append("<!DOCTYPE html>\n"
							+ "<html>\n"
							+ "<head>\n"
							+ "    <meta charset='utf-8'>\n"
							+ "    <title>Catálogo</title>\n"
							+ "    <link rel='stylesheet' type='text/css' href='css/flowerList.css'>\n"
							+ "</head>\n"
							+ "<body>\n"
							+"<div class=\"header\">"
							+ showButton(user) + "\n"
							+"Florister�a Col�s"
							+ "    <div class='user'>Hola "+ username + "</div>\n" 
							+ "</div>\n"
							+ "<div class=\"grid-container\">"
							+ showFlowers(flowerList)
							+ "</div>\n"
							+ "</body>\n"
							+ "</html>");
				}else {
					error = "El usuario o la contraseña no son correctos";
				}
			}catch(ControlException c) { //Comprobar el acceso a bbdd
				error = c.getMessage();
			}
			if(error != null) {
				response.getWriter().append("<!DOCTYPE html>\n"
						+ "<html>\n"
						+ "<head>\n"
						+ "	<title>FC - Error</title>\n"
						+ "	<link type=\"text/css\" rel=\"stylesheet\" href=\"css/error.css\" />\n"
						+ "</head>\n"
						+ "<body>\n"
						+ "    <div>\n"
						+ "        <h1>Error</h1>\n"
						+ "        <h2>" + error + "</h2>\n"
						+ "        <a href=\"signup.html\">volver</a>\n"
						+ "    </div>\r\n"
						+ "</div>\r\n"
						+ "</body>\r\n"
						+ "</html>");
			}
		}
	}
	
	private String showFlowers(ArrayList<Flower> flowers) {
		StringBuilder result = new StringBuilder();
		for(Flower f: flowers) {
			result.append("<div class=\"grid-item\">\n"
				+ "            <div class=\"image\">\n"
				+ "                <img src=\"media/flores.jpg\"> \n"
				+ "            </div>\n"
				+ "            <div class=\"info\">\n"
				+ f.toString() + "\n"
				+ "            </div>\n"
				+ "        </div>");
		}
		return result.toString();
	}
	private String showButton(User user) {
		String result = "";
		if(user.isAdmin()) {
			result = "<div class='addButton'><a href='addFlower.jsp'> Añadir artículo </a></div>"; 
		}
		return result;
	}

}

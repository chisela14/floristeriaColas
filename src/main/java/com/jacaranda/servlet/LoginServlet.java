package com.jacaranda.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import com.jacaranda.ddbb.FlowerControl;
import com.jacaranda.ddbb.UserControl;
import com.jacaranda.model.Flower;


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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String passwordEncript = DigestUtils.md5Hex(password);
		if(UserControl.checkUser(username, passwordEncript)) {
			ArrayList<Flower> flowerList = FlowerControl.getFlowerList();
			response.getWriter().append("<!DOCTYPE html>\n"
					+ "<html>\n"
					+ "<head>\n"
					+ "    <meta charset='utf-8'>\n"
					+ "    <title>Catálogo</title>\n"
					+ "    <link rel='stylesheet' type='text/css' href='css/style.css'>\n"
					+ "</head>\n"
					+ "<body>\n"
					+ "    Hola "+ username + "\n" + showFlowers(flowerList) 
					+ "    \n"
					+ "</body>\n"
					+ "</html>");
		}else {
			response.getWriter().append("<!DOCTYPE html>\n"
					+ "<html>\n"
					+ "<head>\n"
					+ "	<title>FC - Error</title>\n"
					+ "	<link type=\"text/css\" rel=\"stylesheet\" href=\"css/error.css\" />\n"
					+ "</head>\n"
					+ "<body>\n"
					+ "    <div>\n"
					+ "        <h1>Error</h1>\n"
					+ "        <h2>El usuario o la contraseña no son correctos</h2>\n"
					+ "        <a href='login.html'>volver</a>\n"
					+ "    </div>\n"
					+ "</div>\n"
					+ "</body>\n"
					+ "</html>");
		}
		
	}
	
	private String showFlowers(ArrayList<Flower> flowers) {
		StringBuilder result = new StringBuilder("Artículos: \n");
		for(Flower f: flowers) {
			result.append(f.toString() + "\n");
		}
		return result.toString();
	}

}

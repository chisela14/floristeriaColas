package com.jacaranda.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import com.jacaranda.ddbb.UserControl;


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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String passwordEncript = DigestUtils.md5Hex(password);
		if(UserControl.checkUser(username, passwordEncript)) {
			response.getWriter().append("<!DOCTYPE html>\n"
					+ "<html>\n"
					+ "<head>\n"
					+ "    <meta charset='utf-8'>\n"
					+ "    <title>Page Title</title>\n"
					+ "    <link rel='stylesheet' type='text/css' href='css/style.css'>\n"
					+ "</head>\n"
					+ "<body>\n"
					+ "    Hola "+ username + "\n"
					+ "    \n"
					+ "</body>\n"
					+ "</html>");
		}else {
			response.getWriter().append("<!DOCTYPE html>\n"
					+ "<html>\n"
					+ "<head>\n"
					+ "    <meta charset='utf-8'>\n"
					+ "    <title>Page Title</title>\n"
					+ "    <link rel='stylesheet' type='text/css' href='css/style.css'>\n"
					+ "</head>\n"
					+ "<body>\n"
					+ "    Error\n"
					+ "    \n"
					+ "</body>\n"
					+ "</html>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}

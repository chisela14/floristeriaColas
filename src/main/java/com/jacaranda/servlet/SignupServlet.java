package com.jacaranda.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import com.jacaranda.ddbb.ControlException;
import com.jacaranda.ddbb.UserControl;
import com.jacaranda.model.User;
import com.jacaranda.model.UserException;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String lastName = request.getParameter("last_name");
		LocalDate birthDate = LocalDate.parse(request.getParameter("date_of_birth"));
		String genre = request.getParameter("genre");
		System.out.println(genre);
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String passwordEncript = DigestUtils.md5Hex(password);
		String error = null;
		try {
			User u = new User(username, passwordEncript, name, lastName, birthDate, genre);
			if(UserControl.addUser(u)) {
				response.getWriter().append("<!DOCTYPE html>\n"
						+ "<html>\n"
						+ "<head>\n"
						+ "	<title>FC - Usuario creado</title>\n"
						+ "	<link type=\"text/css\" rel=\"stylesheet\" href=\"css/error.css\" />\n"
						+ "</head>\n"
						+ "<body>\n"
						+ "    <div>\n"
						+ "        <h2>Usuario creado correctamente</h2>\n"
						+ "        <p>Inicie sesión con el nuevo usuario</p>\n"
						+ "        <a href='login.html'>Iniciar sesión</a>\n"
						+ "    </div>\r\n"
						+ "</div>\r\n"
						+ "</body>\r\n"
						+ "</html>");
			}
		} catch (UserException e) {
			error = e.getMessage();
		} catch (ControlException e) {
			error = e.getMessage();
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

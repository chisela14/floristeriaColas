package com.jacaranda.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jacaranda.model.Cart;
import com.jacaranda.model.CartItem;
import com.jacaranda.model.Flower;
import com.jacaranda.model.User;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//comprobar sesión del usuario
		HttpSession se = request.getSession(); 
		User userSession = (User) se.getAttribute("user");
		//si el usuario no es nulo recupero el item 
		if(userSession != null){
			Cart cart = (Cart) se.getAttribute("cart");
			int flowerCode = Integer.parseInt(request.getParameter("flower"));
			Integer codeInt = flowerCode;
			//si el item de flor no es nulo lo añado al carrito(por defecto cantidad 1)
			if(codeInt != null) {
				CartItem item = new CartItem(flowerCode);
				cart.getItems().add(item);
				response.sendRedirect("LoginServlet");
			//si es nulo muestro el carrito
			}else {
				ArrayList<CartItem> items = cart.getItems();
				StringBuilder result = new StringBuilder();
				for(CartItem i: items) {
					result.append("<div class=\"grid-item\">\n"
						+ "            <div class=\"image\">\n"
						+ "                <img src=\"media/flores.jpg\"> \n"
						+ "            </div>\n"
						+ "            <div class=\"info\">\n"
						+ i.toString() + "\n"
						+ "            </div>\n"
						+ "        </div>");
				}
				response.getWriter().append(result.toString());
			}
		}else {
			response.sendRedirect("error.jsp?msg='No te has autenticado o no estás autorizado'");
		}
		
	}


}

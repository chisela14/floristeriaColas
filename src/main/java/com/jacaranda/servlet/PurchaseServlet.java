package com.jacaranda.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;

import com.jacaranda.ddbb.ControlException;
import com.jacaranda.ddbb.FlowerControl;
import com.jacaranda.ddbb.PurchaseControl;
import com.jacaranda.model.Cart;
import com.jacaranda.model.Flower;
import com.jacaranda.model.Purchase;
import com.jacaranda.model.User;

/**
 * Servlet implementation class PurchaseServlet
 */
@WebServlet("/PurchaseServlet")
public class PurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseServlet() {
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
		HttpSession se = request.getSession(); 
		User userSession = (User) se.getAttribute("user");
		if(userSession !=null){
			Map params = request.getParameterMap();
			Cart cart = (Cart) se.getAttribute("cart");
			HashMap<Integer, Integer> items = cart.getItems();
			//el boton de comprar no envía parámetros
			if(params.size() == 0) {
				//lista para guardar los elementos no añadidos
				ArrayList<Integer> notAdded = new ArrayList<>();
				//recorro todos los items para crear un objeto de purchase con cada uno
				for(Integer code: items.keySet()) {
					Flower f = null;
					
					try {
						f = FlowerControl.getFlower(code);
					} catch (HibernateException | ControlException e) {
						// problema con la base de datos || no se ha encontrado la flor
					}
					LocalDate date = LocalDate.now();
					Purchase p = new Purchase(userSession, f, date, items.get(code), f.getPrice());
					try {
						PurchaseControl.addPurchase(p);
					} catch (ControlException e) { 
						notAdded.add(p.getFlower().getCode());
					}
				}
				if(notAdded.size() != 0) {
					ServletContext context = this.getServletContext();
					RequestDispatcher dispatcher = context.getRequestDispatcher("/errorBackToList.jsp?msg='Los elementos " + notAdded.toString() + " no han podido añadirse'");
					dispatcher.forward(request, response);
				}
				//vaciar carrito
				Cart newCart = new Cart();
				se.setAttribute("cart", newCart);
				response.sendRedirect("LoginServlet");
			}
		}
			
	}

}

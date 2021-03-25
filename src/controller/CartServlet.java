package controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import session.CartBean;


/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private CartBean cart;
	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.getSession().setAttribute("cart", cart.getCartItems());
		request.getSession().setAttribute("total", cart.getSubTotal());
		
		RequestDispatcher req = request.getRequestDispatcher("user/cart.jsp");
		req.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = (String) request.getAttribute("action");
		String productCode = "";
		
		switch (action) {
		case "resetCart":
			cart.resetCart();
			break;
		case "increaseQuantity":
			productCode = (String) request.getAttribute("productCode");
			cart.modifyQuantity(productCode, 1);
			break;
		case "decreaseQuantity":
			productCode = (String) request.getAttribute("productCode");
			cart.modifyQuantity(productCode, -1);
			break;
		case "removeProduct":
			productCode = (String) request.getAttribute("productCode");
			cart.removeProduct(productCode);
			break;
		default:
				
		}
		
		request.getSession().setAttribute("cart", cart.getCartItems());
		request.getSession().setAttribute("total", cart.getSubTotal());
		
		RequestDispatcher req = request.getRequestDispatcher("user/cart.jsp");
		req.forward(request, response);
		
	}

	
}

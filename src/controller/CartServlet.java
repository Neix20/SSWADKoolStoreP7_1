package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import domain.Cart;
import domain.Product;
import service.ProductServiceInterface;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/Cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private ProductServiceInterface productbean;

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
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		String action = request.getParameter("action");

		switch (action) {
		case "addToCart":
			this.addItem(request, response);
			break;
		case "viewCart":
			this.displayCart(request, response);
			break;
		case "updateCart":
			this.updateCart(request, response);
			break;
		case "removefromCart":
			this.removeItem(request, response);
			break;
		default:
			break;
		}

//		try {
//			cookie = new Cookie(request.getParameter("productId"), "1");
//			response.addCookie(cookie);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void addItem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String productId = request.getParameter("productId");
		int quantity = Integer.parseInt(request.getParameter("quantity"));

		if (productId != null && quantity > 0) {

			HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");

			if (cart == null) {
				cart = new HashMap<String, Integer>();
			}

			if (cart.containsKey(productId)) {
				int itemquantity = cart.get(productId);
				cart.put(productId, quantity + itemquantity);
			} else {
				cart.put(productId, quantity);
			}

			session.setAttribute("cart", cart);
			displayCart(request, response);
		}
	}

	protected void displayCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");

		try {
			List<Cart> items = new ArrayList<Cart>();

			for (String productId : cart.keySet()) {
				Cart item = new Cart();
				Product product = productbean.findProduct(productId);
				item.setProduct(product);
				item.setQuantity(cart.get(productId));
				items.add(item);
			}

			request.setAttribute("items", items);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath() + "/IndexServlet");
		}
	}

	protected void updateCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String productId = request.getParameter("productId");
		int quantity = Integer.parseInt(request.getParameter("quantity"));

		if (productId != null && quantity > 0) {
			HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");

			cart.put(productId, quantity);
			session.setAttribute("cart", cart);
		}
	}

	protected void removeItem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String productId = request.getParameter("productId");

		if (productId != null) {
			HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");

			cart.remove(productId);
			session.setAttribute("cart", cart);
			displayCart(request, response);
		}
	}
}

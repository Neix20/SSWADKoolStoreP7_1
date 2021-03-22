package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Cart;
import domain.Customer;
import domain.Product;
import domain.User;
import service.OrderDetailServiceInterface;
import service.OrderServiceInterface;
import service.ProductServiceInterface;
import service.UserServiceInterface;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/CheckOut")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Inject
	private OrderServiceInterface orderbean;
	
	@Inject
	private OrderDetailServiceInterface detailbean;
	
	@Inject
	private ProductServiceInterface productbean;

	@Inject
	private UserServiceInterface userbean;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		String username = null;
		Cookie[] cookies = request.getCookies();
		HttpSession session = request.getSession();
		HashMap<String, Integer> cart = (HashMap<String, Integer>)session.getAttribute("cart");
		
		if (cart == null) {
			// error
		} else {
			//String total = request.getParameter("total");
			List<Cart> items = new ArrayList<Cart>();
			
			for (String productId: cart.keySet()) {
				Cart item = new Cart();
				Product product = productbean.findProduct(productId);
				item.setProduct(product);
				item.setQuantity(cart.get(productId));
				items.add(item);
			}
			
			if (cookies != null) {
				for (Cookie c: cookies) {
					if (c.getName().equals("username")) {
						username = c.getValue();
					}
				}

			}

			User user = userbean.getSingleUser(username);
			Customer customer = user.getCustomer();
			
			request.setAttribute("customer", customer);
			request.setAttribute("items", items);
			//request.setAttribute("total", total);
		}
		RequestDispatcher req = request.getRequestDispatcher("checkout.jsp");
		req.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}

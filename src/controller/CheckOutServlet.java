package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.ejb.EJB;
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
import session.CartBean;
import utility.CartItem;
import utility.QuickGet;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/checkout")
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
	
	@EJB
	private CartBean cart;
	
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

		String username = QuickGet.getCurrentUsername(request);
		
		if(username.equals("")) { // Require login before check out
			response.sendRedirect(request.getContextPath() + "/login");
		} else {
			
			request.getSession().setAttribute("cart", cart.getCartItems());
			request.getSession().setAttribute("customer", userbean.getSingleUser(username));
			
			RequestDispatcher req = request.getRequestDispatcher("user/checkout.jsp");
			req.forward(request, response);
			
			
//			if (cart == null) {
//				// error
//			} else {
//				//String total = request.getParameter("total");
//				List<CartOld> items = new ArrayList<CartOld>();
//				
//				for (String productId: cart.keySet()) {
//					CartOld item = new CartOld();
//					Product product = productbean.findProduct(productId);
//					item.setProduct(product);
//					item.setQuantity(cart.get(productId));
//					items.add(item);
//				}
//
//				User user = userbean.getSingleUser(username);
//				Customer customer = user.getCustomer();
//				
//				request.setAttribute("customer", customer);
//				request.setAttribute("items", items);
//				//request.setAttribute("total", total);
//			}
//			RequestDispatcher req = request.getRequestDispatcher("user/checkout.jsp");
//			req.forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}

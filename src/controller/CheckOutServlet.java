package controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.OrderDetailServiceInterface;
import service.OrderServiceInterface;
import service.ProductServiceInterface;
import service.UserServiceInterface;
import session.CartBean;
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
			HttpSession session = request.getSession();
			CartBean cart = (CartBean) session.getAttribute("cart");
			if(cart == null) cart = new CartBean();
			
			request.getSession().setAttribute("cart", cart);
			request.getSession().setAttribute("total", cart.getSubTotal());
			request.getSession().setAttribute("customer", userbean.getSingleUser(username));
			
			RequestDispatcher req = request.getRequestDispatcher("user/checkout.jsp");
			req.forward(request, response);
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Save the information to the database and redirect to the order successful page
		
	}

}

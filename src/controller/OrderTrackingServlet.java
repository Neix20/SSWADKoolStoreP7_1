package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.ejb.EJBException;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import domain.Order;
import domain.User;
import formmodel.LogInModel;
import service.OrderDetailServiceInterface;
import service.OrderServiceInterface;
import service.UserServiceInterface;

/**
 * Servlet implementation class OrderTrackingServlet
 */
@WebServlet("/OrderTracking")
public class OrderTrackingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Inject
	private OrderServiceInterface orderbean;
	
	@Inject
	private UserServiceInterface userbean;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderTrackingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = null;
		
		try {
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie c: cookies) {
					if (c.getName().equals("username")) {
						username = c.getValue();
					}
				}
			}
			
			try {
				User user = userbean.getSingleUser(username);
				List<Order> orders = orderbean.findOrderByCustId(user.getCustomer().getCustomernumber());
				request.setAttribute("orders", orders);
				RequestDispatcher req = request.getRequestDispatcher("order-history.jsp");
				req.forward(request, response);
			} catch (EJBException ex) {
				
			}
		} catch (Exception ex) {
			request.getSession().setAttribute("message", "Please login first!");
			response.sendRedirect(request.getContextPath() + "/login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String orderNumber = request.getParameter("ordernumber");
		
		try {
			Order order = orderbean.findOrder(orderNumber);
			order.setStatus("Cancelled");
			orderbean.updateOrder(order);
			
			response.sendRedirect(request.getContextPath() + "/OrderTracking");
		} catch (EJBException ex) {
			
		}
	}

}

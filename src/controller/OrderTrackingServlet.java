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
import formmodels.LogInModel;
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
	private OrderDetailServiceInterface historybean;
	
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
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String username = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c: cookies) {
				if (c.getName().equals("username")) {
					username = c.getValue();
				}
			}

		}
//		HttpSession session = request.getSession();
//		LogInModel login = (LogInModel) session.getAttribute("login");
//		String username = login.getUsername();
		
		try {
			User user = userbean.getSingleUser(username);
			List<Order> orders = orderbean.findOrderByCustId(user.getCustomer().getCustomernumber());
			request.setAttribute("orders", orders);
			RequestDispatcher req = request.getRequestDispatcher("order-history.jsp");
			req.forward(request, response);
		} catch (EJBException ex) {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String orderNumber = request.getParameter("ordernumber");
		PrintWriter out = response.getWriter();
		
		try {
			List<Order> orders = orderbean.trackOrderAjax(orderNumber);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			String result = null;
			if (orders != null) {
				// result = jsonb.toJson(h);
				// System.out.println(result.toString());
				// out.println(result);
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(out, orders);
			} else {
				out.println(result);
			}
			
//			request.setAttribute("order", orders);
//			RequestDispatcher req = request.getRequestDispatcher("ordertracking.jsp");
//			req.forward(request, response);
		} catch (EJBException ex) {
			
		}
	}

}

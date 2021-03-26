package controller;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJBException;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Orderdetail;
import service.OrderDetailServiceInterface;

/**
 * Servlet implementation class OrderDetailsServlet
 */
@WebServlet("/OrderDetails")
public class OrderDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private OrderDetailServiceInterface orderbean;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderDetailsServlet() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ordernumber = null;
		
		try {
			try {
				ordernumber = request.getParameter("ordernumber");
				
				List<Orderdetail> orders = orderbean.findOrderDetails(ordernumber);
				request.setAttribute("orderdetail", orders);
				RequestDispatcher req = request.getRequestDispatcher("order-details.jsp");
				req.forward(request, response);
			} catch (EJBException e) {}
		} catch (NullPointerException e) {
			response.sendRedirect(request.getContextPath() + "/_404.jsp");
		}
	}
}

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Customer;
import domain.Product;
import service.CustomerService;
import service.ProductServiceInterface;
import session.CartBean;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/Product")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private CustomerService cs;
	
	@EJB
	private CartBean cart;
	
	@Inject
	private ProductServiceInterface productbean;
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String productcode = null;
		
		try {
			 productcode = request.getParameter("productCode");
			 String category;
				try {
					Product product = productbean.findProduct(productcode);
					category = product.getProductlineBean().getProductline();
					List<Product> productlist = productbean.getAllProductByCategoryWithExclusion(category, product.getProductcode());
					request.setAttribute("product", product);
					request.setAttribute("productlist", productlist);
					RequestDispatcher dispatcher = request.getRequestDispatcher("product-detail.jsp");
					dispatcher.forward(request, response);
				}
				catch(EJBException e) {}
		} catch (Exception ex) {
			response.sendRedirect(request.getContextPath() + "/ProductList");
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String productCode = request.getParameter("productCode");
		int quantity = Integer.valueOf(request.getParameter("quantity"));
		
		// TODO check present of the productcode in the table
		
		String index = cart.findIndexByProductCode(productCode);
		
		if(index.equals("Not Found")) {
			cart.addProduct(productbean.findProduct(productCode), quantity);
		} else {
			int i = Integer.valueOf(index);
			cart.getCartItems().get(i).setQuantity(cart.getCartItems().get(i).getQuantity() + quantity);
		}

		request.getSession().setAttribute("message", "Add to cart successfully!");
		response.sendRedirect(request.getContextPath() + "/Product");
		
	}

}

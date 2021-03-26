package controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Customer;
import formmodel.ProfileModel;
import service.CustomerServiceInterface;
import service.UserServiceInterface;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private UserServiceInterface userBean;

	@Inject
	private CustomerServiceInterface customerBean;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfileServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cookie[] cookies = request.getCookies();
		String username = "";

		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("username")) {
				username = cookie.getValue();
				break;
			}
		}

		Customer c = userBean.getSingleUser(username).getCustomer();
		request.getSession().setAttribute("customer", c);

		RequestDispatcher dispatcher = request.getRequestDispatcher("views/user/profile.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String customernumber = request.getParameter("customernumber");
		String addressline1 = request.getParameter("addressline1");
		String addressline2 = request.getParameter("addressline2");
		String city = request.getParameter("city");
		String contactfirstname = request.getParameter("contactfirstname");
		String contactlastname = request.getParameter("contactlastname");
		String country = request.getParameter("country");
		String creditlimit = request.getParameter("creditlimit");
		String customername = request.getParameter("customername");
		String phone = request.getParameter("phone");
		String postalcode = request.getParameter("postalcode");
		String state = request.getParameter("state");

		ProfileModel model = new ProfileModel();
		boolean isValidated = true;

		try {
			ProfileModel m = (ProfileModel) request.getSession().getAttribute("profile");
			model.setCustomernumber(m.getCustomernumber());
			model.setCustomername(m.getCustomername());
			model.setAddressline1(m.getAddressline1());
			model.setAddressline2(m.getAddressline2());
			model.setCity(m.getCity());
			model.setContactfirstname(m.getContactfirstname());
			model.setContactlastname(m.getContactlastname());
			model.setCountry(m.getCountry());
			model.setCreditlimit(Double.valueOf(m.getCreditlimit()));
			model.setCustomername(m.getCustomername());
			model.setPhone(m.getPhone());
			model.setPostalcode(m.getPostalcode());
			model.setState(m.getState());
			model.setErrors(m.getErrors());
		} catch (NullPointerException ex) {
			model.setCustomernumber(Integer.valueOf(customernumber));
			model.setCustomername(customernumber);
			model.setAddressline1(addressline1);
			model.setAddressline2(addressline2);
			model.setCity(city);
			model.setContactfirstname(contactfirstname);
			model.setContactlastname(contactlastname);
			model.setCountry(country);
			model.setCreditlimit(Double.valueOf(creditlimit));
			model.setCustomername(customername);
			model.setPhone(phone);
			model.setPostalcode(postalcode);
			model.setState(state);
		}

		if (addressline1.equals("")) {
			model.setErrors("addressline1", "This field is required!");
			isValidated = false;
		}
		if (addressline2.equals("")) {
			model.setErrors("addressline2", "This field is required!");
			isValidated = false;
		}
		if (city.equals("")) {
			model.setErrors("city", "This field is required!");
			isValidated = false;
		}
		if (contactfirstname.equals("")) {
			model.setErrors("contactfirstname", "This field is required!");
			isValidated = false;
		}
		if (contactlastname.equals("")) {
			model.setErrors("contactlastname", "This field is required!");
			isValidated = false;
		}
		if (country.equals("")) {
			model.setErrors("country", "This field is required!");
			isValidated = false;
		}
		if (creditlimit.equals("")) {
			model.setErrors("creditlimit", "This field is required!");
			isValidated = false;
		}
		if (phone.equals("")) {
			model.setErrors("phone", "This field is required!");
			isValidated = false;
		}
		if (postalcode.equals("")) {
			model.setErrors("postalcode", "This field is required!");
			isValidated = false;
		}
		if (state.equals("")) {
			model.setErrors("state", "This field is required!");
			isValidated = false;
		}
		if (customername.equals("")) {
			model.setErrors("customername", "This field is required!");
			isValidated = false;
		}

		if (isValidated) {
			String[] datas = { customernumber, customername, contactlastname, contactfirstname, phone, addressline1,
					addressline2, city, state, postalcode, country, creditlimit };
			customerBean.updateCustomer(datas);
			request.getSession().setAttribute("message", "Profile Saved!");
			response.sendRedirect(request.getContextPath() + "/profile");
		} else {
			request.getSession().setAttribute("profile", model);
			RequestDispatcher dispatcher = request.getRequestDispatcher("views/user/profile.jsp");
			dispatcher.forward(request, response);
		}

	}

}

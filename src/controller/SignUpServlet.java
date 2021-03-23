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

import formmodels.SignUpModel;
import service.UserServiceInterface;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private UserServiceInterface userBean;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
		try {
			for(Cookie cookie: cookies) {
				if(cookie.getName().equals("username")) {
					response.sendRedirect(request.getContextPath() + "/Profile");
				}
			}
		}catch(NullPointerException ex) {
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
		dispatcher.include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");

		SignUpModel model = new SignUpModel();

		try { // Error checking after key in the username and password
			SignUpModel m = (SignUpModel) request.getSession().getAttribute("signup");
			model.setPassword(m.getPassword());
			model.setUsername(m.getUsername());
			model.setConfirmPassword(m.getConfirmPassword());
			model.setErrors(m.getErrors());
		} catch (NullPointerException ex) { // Initialize for first times login
			model.setUsername(username);
			model.setPassword(password);
			model.setConfirmPassword(confirmPassword);
		}
		
		boolean isPassed = true;

		if(username == "") {
			model.setErrors("username", "This field is required.");
			isPassed = false;
		} else if(username.length() > 6) {
			model.setErrors("username", "Make sure your username is less than or equal to 6 character!");
			isPassed = false;
		} 
		
		if(password == "") {
			model.setErrors("password", "This field is required.");
			isPassed = false;
		} else if(password.length() > 6) {
			model.setErrors("password", "Make sure your password is less than or equal to 6 character!");
			isPassed = false;
		} 
		
		if(confirmPassword == "") {
			model.setErrors("confirmPassword", "This field is required.");
			isPassed = false;
		} else if(!password.equals(confirmPassword)) {
			model.setErrors("confirmPassword", "Confirm password is not matched!");
			isPassed = false;
		}
		
		if(!isPassed) {
			request.getSession().setAttribute("signup", model);
			RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
			dispatcher.include(request, response);
		}else if(userBean.isDuplicated(username)) {
			model.setErrors("username", "Username is not available!");
			request.getSession().setAttribute("signup", model);
			RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
			dispatcher.include(request, response);
		} else {
			request.getSession().invalidate();
			String[] datas = {username, password};
			userBean.addUser(datas);
			response.sendRedirect(request.getContextPath() + "/login");
		}
		
	}

}

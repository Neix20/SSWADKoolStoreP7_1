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

import formmodels.LogInModel;
import service.UserServiceInterface;

/**
 * Servlet implementation class LogInServlet
 */
@WebServlet("/login")
public class LogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private UserServiceInterface userBean;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LogInServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Cookie[] cookies = request.getCookies();
		try {
			for(Cookie cookie: cookies) {
				if(cookie.getName().equals("username")) {
					response.sendRedirect(request.getContextPath() + "/profile");
				}
			}
		} catch(NullPointerException ex) {
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		LogInModel model = new LogInModel();

		try { // Error checking after key in the username and password
			LogInModel m = (LogInModel) request.getSession().getAttribute("login");
			model.setPassword(m.getPassword());
			model.setUsername(m.getUsername());
			model.setErrors(m.getErrors());
		} catch (NullPointerException ex) { // Initialize for first times login
			model.setUsername(username);
			model.setPassword(password);
		}
	
		if (userBean.checkPassword(username, password)) {
			request.getSession().invalidate(); // Delete session storage after login successful
			Cookie cookie = new Cookie("username", username);
			cookie.setMaxAge(60 * 60 * 24); // Hold for 24 hours
			response.addCookie(cookie);
			response.sendRedirect(request.getContextPath() + "/IndexServlet");
		} else if (!userBean.isDuplicated(username)) {
			model.setErrors("username", "Username is not found!");
			request.getSession().setAttribute("login", model);
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.include(request, response);
		} else {
			model.setErrors("password", "Wrong password!");
			request.getSession().setAttribute("login", model);
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.include(request, response);
		}

	}

}

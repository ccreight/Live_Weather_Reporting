package ccreight_CSCI201_Weather1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VerifyRegistration
 */
@WebServlet("/VerifyRegistration")
public class VerifyRegistration extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String pass1 = request.getParameter("password");
		String pass2 = request.getParameter("cpassword");
		
		String targetPage = "/index.jsp";
		
		SQLMethods j = new SQLMethods();
		String error = j.registerUser(username, pass1, pass2);
		
		if(!error.equals("success")) {
			request.setAttribute("perror", error);
			targetPage = "/accountregistration.jsp";
		}
		else {
			request.getSession(false).setAttribute("log", "true");
			request.getSession(false).setAttribute("username", username);
		}
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetPage);
		dispatch.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

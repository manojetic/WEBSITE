package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.connection.ConnectionProvider;
import com.online.User;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("working");
		try {

			String userName = request.getParameter("user_name");
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
			String userPhone = request.getParameter("user_phone");
			String userAddress = request.getParameter("user_address");

			// creating user object to store data
			User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, "normal");

			Session hibernateSession = ConnectionProvider.getFactory().openSession();

			Transaction tx = hibernateSession.beginTransaction();

			int userId = (Integer) hibernateSession.save(user);
			tx.commit();
			hibernateSession.close();

			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Registration Successful !! User id is " + userId);
			response.sendRedirect("register.jsp");

			return;

		} catch (Exception e) {
			e.printStackTrace();

		}

	}
}
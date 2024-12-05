package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try{
			// PrintWriter out = res.getWriter();
			HttpSession session = req.getSession();

			String email = req.getParameter("email");
			String password = req.getParameter("password");
			// out.println(email+password);

			UserDAOImpl udao = new UserDAOImpl(DBConnect.getConn());
			User auth = null;

			if ("admin@gmail.com".equals(email) && "password".equals(password)) {
				auth = new User();
				auth.setName("Admin");
				session.setAttribute("userObj", auth);
				res.sendRedirect("Admin/Home.jsp");
			} else {
				auth = udao.login(email, password);
				if (auth != null) {
					session.setAttribute("userObj", auth);
					res.sendRedirect("index.jsp");
				} else {
					session.setAttribute("failedMsg", "Email or Password Invalid!!!");
					res.sendRedirect("Login.jsp");
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// Ensure DB connection is closed
			DBConnect.destroy();
		}
	}

}

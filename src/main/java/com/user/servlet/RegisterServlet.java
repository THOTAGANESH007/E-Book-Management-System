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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();
		try {
			String uname = req.getParameter("uname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");

			// System.out.println(uname+email+phno+password);
			User user = new User();
			user.setName(uname);
			user.setEmail(email);
			user.setPhno(phno);
			user.setPassword(password);

			UserDAOImpl udao = new UserDAOImpl(DBConnect.getConn());
			boolean checkUser = udao.checkUser(email);
			if (checkUser) {
				boolean auth = udao.userRegister(user);

				if (auth) {
					// out.println("Success!!!");
					session.setAttribute("SuccessMsg", "Registration SuccessFul!!!");
					res.sendRedirect("Register.jsp");
				} else {
					// out.println("Failed!!!");
					session.setAttribute("FailedMsg", "Something Went Wrong!!!");
					res.sendRedirect("Register.jsp");
				}
				

			} else {
				session.setAttribute("FailedMsg", "User Already Exists , Please try with another Email!!!");
				res.sendRedirect("Register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
            // Ensure DB connection is closed
            DBConnect.destroy();
        }
	}

}

package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.DAO.BookOrderDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.BookOrder;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateAddress")
public class UpdateAddressServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();
		try {
			String email = req.getParameter("email");
			String address = req.getParameter("address");
			String landMark = req.getParameter("landMark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String zip = req.getParameter("zip");

			String fullAddress = address + "," + landMark + "," + city + "," + state + "," + zip;

			BookOrder order = new BookOrder();
			order.setFullAddress(fullAddress);
			order.setEmail(email);

			BookOrderDAOImpl udao = new BookOrderDAOImpl(DBConnect.getConn());
			boolean update = udao.updateAddress(fullAddress, email);
			// out.print(update);
			if (update) {
				// out.println("Success!!!");
				
				session.setAttribute("UpdatedMsg", "Updation SuccessFul!!!");
				res.sendRedirect("userAddress.jsp");
			} else {
				// out.println("Failed!!!");

				session.setAttribute("FailedMsg", "You had to order atleast once to update your Address!!!");
				res.sendRedirect("userAddress.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("FailedMsg", "Something Went Wrong!!!");
			res.sendRedirect("userAddress.jsp");
		} finally {
			// Ensure DB connection is closed
			DBConnect.destroy();
		}
	}

}

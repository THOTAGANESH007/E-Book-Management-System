package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.DAO.BookDaoImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteOldBook")
public class DeleteOldBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			PrintWriter out = res.getWriter();
			String email = req.getParameter("email");
			int bid = Integer.parseInt(req.getParameter("bid"));

			BookDaoImpl bdao = new BookDaoImpl(DBConnect.getConn());

			boolean bool = bdao.oldBookDelete(email, "Old", bid);
				//out.println(bool);
			HttpSession session = req.getSession();
			if (bool) {
				session.setAttribute("oldBookDeleted", "Old Book Deleted Successfully!!!");
				res.sendRedirect("oldBook.jsp");
				// out.println("Success!!!");
			} else {
				session.setAttribute("failedToDelete", "Something Went Wrong!!!");
				res.sendRedirect("oldBook.jsp");
				// out.println("Failed!!!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
            // Ensure DB connection is closed
            DBConnect.destroy();
        }
	}
}

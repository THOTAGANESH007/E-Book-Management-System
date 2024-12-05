package com.admin.servlet;

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

@WebServlet("/delete")
public class DeleteBooks extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			PrintWriter out = res.getWriter();
			int id=Integer.parseInt(req.getParameter("id"));
			BookDaoImpl imp = new BookDaoImpl(DBConnect.getConn());
			boolean bool = imp.deleteBooks(id);
			HttpSession session = req.getSession();
			if(bool) {
				session.setAttribute("SuccessMsg", "Book Deleted Successfully!!!");
				res.sendRedirect("Admin/allBooks.jsp");
			} else {
				session.setAttribute("FailedMsg", "Something Went Wrong on the Server!!!");
				res.sendRedirect("Admin/allBooks.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.destroy();
		}
	}
	
}

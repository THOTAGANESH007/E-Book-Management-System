package com.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.DAO.BookDaoImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editBooks")
public class EditBooks extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			PrintWriter out = res.getWriter();
			int id=Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			Double price = Double.parseDouble(req.getParameter("price"));
			String status = req.getParameter("status");
			
			BookDetails det = new BookDetails();
			det.setBookId(id);
			det.setBookname(bookName);
			det.setAuthor(author);
			det.setPrice(id);
			det.setStatus(status);
			
			BookDaoImpl imp = new BookDaoImpl(DBConnect.getConn());
			boolean bool = imp.updateEditBooks(det);
			HttpSession session = req.getSession();
			if(bool) {
				session.setAttribute("SuccessMsg", "Book Updated Successfully!!!");
				res.sendRedirect("Admin/allBooks.jsp");
			} else {
				session.setAttribute("FailedMsg", "Something Went Wrong on the Server!!!");
				res.sendRedirect("Admin/allBooks.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.destroy();
		}
	}

}

package com.user.servlet;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.DB.DBConnect;
import com.entity.BookDetails;
import com.DAO.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/addOldBook")
@MultipartConfig

public class AddOldBookServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			PrintWriter out = res.getWriter();
			String userEmail = req.getParameter("userEmail");
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			Double price = Double.parseDouble(req.getParameter("price"));
			String categories = "Old";
			String status = "Active";
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			String fileType = part.getContentType();

	        // Validate that the uploaded file is an image
	        if (!fileType.startsWith("image/")) {
	            HttpSession session = req.getSession();
	            session.setAttribute("FailedMsg", "Invalid file type! Please upload an image.");
	            res.sendRedirect("sellBook.jsp");
	            return;
	        }
			// Data is set to the respective variables
			BookDetails bDet = new BookDetails(bookName, author, price, categories, status, fileName, userEmail);
			// out.println(bDet.toString());
			BookDaoImpl bdao = new BookDaoImpl(DBConnect.getConn());
			
			
			/*
			// To set the path of the uploaded image
			String path = getServletContext().getRealPath("") + "books";
			out.println(path);
			// Java.io class
			File uploadDir = new File(path);
			if (!uploadDir.exists()) {
				uploadDir.mkdir(); // Creates the directory if it does not exist
			}
			// Store into that folder
			part.write(path + File.separator + fileName);
			*/
			
			boolean det = bdao.addBooks(bDet);
			HttpSession session = req.getSession();
			if (det) {
				String path = getServletContext().getRealPath("") + "books";

				File uploadDir = new File(path);
				if (!uploadDir.exists()) {
					uploadDir.mkdir(); // Creates the directory if it does not exist
				}

				part.write(path + File.separator + fileName);

				session.setAttribute("SuccessMsg", "Book Added Successfully!!!");
				res.sendRedirect("sellBook.jsp");
			} else {
				session.setAttribute("FailedMsg", "Something Wrong on the Server!!!");
				res.sendRedirect("sellBook.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
            // Ensure DB connection is closed
            DBConnect.destroy();
        }
	}

}

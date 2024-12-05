package com.user.servlet;

import java.io.IOException;
//import java.io.PrintWriter;

import com.DAO.BookDaoImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			//PrintWriter out = res.getWriter();
			
			int bid= Integer.parseInt(req.getParameter("bid"));
			int uid= Integer.parseInt(req.getParameter("uid"));
			BookDaoImpl bdao = new BookDaoImpl(DBConnect.getConn());
			BookDetails book=bdao.getBookById(bid);
			Cart cart = new Cart();
			cart.setBid(bid);
			cart.setUid(uid);
			cart.setBookName(book.getBookname());
			cart.setAuthor(book.getAuthor());
			cart.setPrice(book.getPrice());
			cart.setTotalPrice(book.getPrice());
			
			CartDAOImpl cartDao = new CartDAOImpl(DBConnect.getConn());
			boolean bool= cartDao.addToCart(cart);
			HttpSession session = req.getSession();
			if(bool) {
				session.setAttribute("addToCart","Book Added to Cart!!!");
				res.sendRedirect("cart.jsp");
				//out.println("Success!!!");
			}else {
				session.setAttribute("failedToAdd","Something Went Wrong!!!");
				res.sendRedirect("cart.jsp");
				//out.println("Failed!!!");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
            // Ensure DB connection is closed
            DBConnect.destroy();
        }
	}

}

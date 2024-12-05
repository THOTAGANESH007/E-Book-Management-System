package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.DAO.BookOrderDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookOrder;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();
		try {
			int uid = Integer.parseInt(req.getParameter("uid"));
			String uname = req.getParameter("uname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landMark = req.getParameter("landMark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String zip = req.getParameter("zip");
			String paymentType = req.getParameter("paymentType");

			String fullAddress = address + "," + landMark + "," + city + "," + state + "," + zip;

			// out.println(uname+email+phno+fullAddress+paymentType);

			CartDAOImpl cdao = new CartDAOImpl(DBConnect.getConn());
			List<Cart> blist = cdao.getBookByUser(uid);

			if (blist.isEmpty()) {
				session.setAttribute("failedToAdd", "Please Add an Item to the cart!!!"); // FailedMsg
				res.sendRedirect("cart.jsp");
			} else {

				// only for generating the order numbers
				BookOrderDAOImpl bdao = new BookOrderDAOImpl(DBConnect.getConn());
				int orderCount = bdao.getOrderNo();

				BookOrder order = null;
				ArrayList<BookOrder> orderList = new ArrayList<BookOrder>();

				for (Cart c : blist) {
					// out.print(c.getBookName()+c.getAuthor()+c.getPrice());
					order = new BookOrder();
					order.setOid("BOOK-ORD-00" + orderCount);
					order.setUname(uname);
					order.setEmail(email);
					order.setPhno(phno);
					order.setFullAddress(fullAddress);
					order.setBookName(c.getBookName());
					order.setAuthor(c.getAuthor());
					order.setPrice(c.getPrice() + "");
					order.setPaymentType(paymentType);
					orderList.add(order);
					orderCount++;
				}
				//out.print(orderList);
				if ("noselect".equals(paymentType)) {
					session.setAttribute("failedToAdd", "Please Choose Your Payment Gateway!!!"); // FailedMsg
					res.sendRedirect("cart.jsp");
				} else {
					boolean saveOrder = bdao.saveOrder(orderList);
					//out.println(saveOrder);
					if (saveOrder) {
						 res.sendRedirect("orderSuccess.jsp");
						// out.print("OrderSuccess");
					} else {
						session.setAttribute("failedToAdd", "Something Went Wrong!!!"); // FailedMsg
						res.sendRedirect("cart.jsp");
						// out.print("OrderFailed");
					}
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

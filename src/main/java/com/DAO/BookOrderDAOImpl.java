package com.DAO;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.List;

import com.DB.DBConnect;
import com.entity.BookOrder;

public class BookOrderDAOImpl implements BookOrderDAO {
	private Connection conn = null;

	public BookOrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public int getOrderNo() {
		int order = 1;
		try {
			String query = "Select * from bookOrder";
			PreparedStatement pst = conn.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				order++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}
		return order;
	}

	public boolean saveOrder(List<BookOrder> blist) {
		boolean order = false;

		try (Connection conn = DBConnect.getConn();
				PreparedStatement pst = conn.prepareStatement(
						"insert into bookOrder(orderId,userName,email,address,phno,bookName,author,price,payment) values(?,?,?,?,?,?,?,?,?)")) {
			conn.setAutoCommit(false);

			for (BookOrder b : blist) {
				pst.setString(1, b.getOid() != null ? b.getOid() : "");
				pst.setString(2, b.getUname() != null ? b.getUname() : "");
				pst.setString(3, b.getEmail() != null ? b.getEmail() : "");
				pst.setString(4, b.getFullAddress() != null ? b.getFullAddress() : "");
				pst.setString(5, b.getPhno() != null ? b.getPhno() : "");
				pst.setString(6, b.getBookName() != null ? b.getBookName() : "");
				pst.setString(7, b.getAuthor() != null ? b.getAuthor() : "");
				pst.setString(8, b.getPrice() != null ? b.getPrice() : "");
				pst.setString(9, b.getPaymentType() != null ? b.getPaymentType() : "");
				pst.addBatch();
			}

			int[] count = pst.executeBatch();
			conn.commit();
			order = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return order;
	}

	@Override
	public List<BookOrder> getBook(String email) {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder order = null;
		try {
			String query = "select * from bookOrder where email=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				order = new BookOrder();
				order.setBid(rs.getInt("id"));
				order.setOid(rs.getString("orderId"));
				order.setUname(rs.getString("userName"));
				order.setEmail(rs.getString("email"));
				order.setFullAddress(rs.getString("address"));
				order.setPhno(rs.getString("phno"));
				order.setBookName(rs.getString("bookName"));
				order.setAuthor(rs.getString("author"));
				order.setPrice(rs.getString("price"));
				order.setPaymentType(rs.getString("payment"));
				list.add(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}
		return list;
	}

	@Override
	public List<BookOrder> getAllOrders() {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder order = null;
		try {
			String query = "select * from bookOrder";
			PreparedStatement pst = conn.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				order = new BookOrder();
				order.setBid(rs.getInt("id"));
				order.setOid(rs.getString("orderId"));
				order.setUname(rs.getString("userName"));
				order.setEmail(rs.getString("email"));
				order.setFullAddress(rs.getString("address"));
				order.setPhno(rs.getString("phno"));
				order.setBookName(rs.getString("bookName"));
				order.setAuthor(rs.getString("author"));
				order.setPrice(rs.getString("price"));
				order.setPaymentType(rs.getString("payment"));
				list.add(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}
		return list;
	}

	@Override
	public boolean updateAddress(String fullAddress,String email) {
		boolean update = false;

		try {
			String query = "update bookOrder set address=? where email=?";
			PreparedStatement pst = conn.prepareStatement(query);
			//System.out.print(fullAddress+email);
			pst.setString(1, fullAddress);
			pst.setString(2, email);

			int result = pst.executeUpdate();
			if (result == 1)
				update = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}
		return update;
	}

}

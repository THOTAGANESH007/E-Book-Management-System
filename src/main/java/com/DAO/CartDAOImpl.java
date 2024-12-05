package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;
import com.entity.Cart;

public class CartDAOImpl implements CartDAO {
	private Connection conn = null;

	public CartDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addToCart(Cart c) {
		boolean cart = false;
		try {
			String query = "INSERT INTO cart (bid,uid,bookName,author,price,totalPrice) VALUES(?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, c.getBid());
			pst.setInt(2, c.getUid());
			pst.setString(3, c.getBookName());
			pst.setString(4, c.getAuthor());
			pst.setDouble(5, c.getPrice());
			pst.setDouble(6, c.getTotalPrice());
			int result = pst.executeUpdate();
			if (result == 1)
				cart = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cart;
	}

	@Override
	public List<Cart> getBookByUser(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		double totalPrice = 0;
		try {
			String query = "SELECT * FROM cart where uid=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, userId);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				c = new Cart();
				c.setCid(rs.getInt("cid"));
				c.setBid(rs.getInt("bid"));
				c.setUid(rs.getInt("uid"));
				c.setAuthor(rs.getString("author"));
				c.setBookName(rs.getString("bookName"));
				c.setPrice(rs.getDouble("price"));

				totalPrice += rs.getDouble("totalPrice");
				c.setTotalPrice(totalPrice);
				list.add(c);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean deleteBook(int bid,int uid,int cid) {
		boolean del = false;

		try {
			String query = "Delete FROM cart where bid=? and uid=? and cid=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, bid);
			pst.setInt(2, uid);
			pst.setInt(3, cid);
			int result = pst.executeUpdate();
			if (result == 1)
				del = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return del;
	}

}

package com.DAO;

import com.DB.DBConnect;
import com.entity.BookDetails;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDaoImpl implements BookDAO {

	private Connection conn;

	public BookDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBooks(BookDetails det) {
		boolean details = false;
		try {
			String query = "INSERT INTO bookDetails(bookName,author,price,bookCategory,status,photo,email) VALUES(?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, det.getBookname());
			pst.setString(2, det.getAuthor());
			pst.setDouble(3, det.getPrice());
			pst.setString(4, det.getBookCategory());
			pst.setString(5, det.getStatus());
			pst.setString(6, det.getPhoto());
			pst.setString(7, det.getEmail());
			int result = pst.executeUpdate();

			if (result == 1) {
				details = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}
		return details;
	}

	@Override
	public List<BookDetails> getAllBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails det = null;

		try {
			String query = "Select * from bookDetails";
			PreparedStatement pst = conn.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				det = new BookDetails();

				det.setBookId(rs.getInt("bookId"));
				det.setBookname(rs.getString("bookName"));
				det.setAuthor(rs.getString("author"));
				det.setPrice(rs.getDouble("price"));
				det.setBookCategory(rs.getString("bookCategory"));
				det.setStatus(rs.getString("status"));
				det.setPhoto(rs.getString("photo"));
				det.setEmail(rs.getString("email"));

				list.add(det);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}
		return list;
	}

	@Override
	public BookDetails getBookById(int id) {
		BookDetails det = null;
		try {
			String query = "Select * from bookDetails where bookId=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				det = new BookDetails();

				det.setBookId(rs.getInt("bookId"));
				det.setBookname(rs.getString("bookName"));
				det.setAuthor(rs.getString("author"));
				det.setPrice(rs.getDouble("price"));
				det.setBookCategory(rs.getString("bookCategory"));
				det.setStatus(rs.getString("status"));
				det.setPhoto(rs.getString("photo"));
				det.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}

		return det;
	}

	@Override
	public boolean updateEditBooks(BookDetails det) {
		boolean New = false;
		try {
			String query = "UPDATE bookDetails set bookName=?,author=?,price=?,status=? WHERE bookId=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, det.getBookname());
			pst.setString(2, det.getAuthor());
			pst.setDouble(3, det.getPrice());
			pst.setString(4, det.getStatus());
			pst.setInt(5, det.getBookId());
			int result = pst.executeUpdate();

			if (result == 1) {
				New = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}
		return New;
	}

	@Override
	public boolean deleteBooks(int id) {
		boolean del = false;
		try {
			String query = "Delete From bookDetails where bookId=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, id);
			int result = pst.executeUpdate();
			if (result == 1)
				del = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}
		return del;
	}

	@Override
	public List<BookDetails> getNewBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails det = null;

		try {
			String query = "Select * from bookDetails WHERE bookCategory=? and Status=? ORDER BY bookId DESC";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, "New");
			pst.setString(2, "Active");
			ResultSet rs = pst.executeQuery();
			int i = 0;
			while (rs.next() && i < 4) {
				det = new BookDetails();

				det.setBookId(rs.getInt("bookId"));
				det.setBookname(rs.getString("bookName"));
				det.setAuthor(rs.getString("author"));
				det.setPrice(rs.getDouble("price"));
				det.setBookCategory(rs.getString("bookCategory"));
				det.setStatus(rs.getString("status"));
				det.setPhoto(rs.getString("photo"));
				det.setEmail(rs.getString("email"));

				list.add(det);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}
		return list;

	}

	@Override
	public List<BookDetails> getRecentBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails det = null;

		try {
			String query = "Select * from bookDetails WHERE Status=? ORDER BY bookId DESC";
			PreparedStatement pst = conn.prepareStatement(query);

			pst.setString(1, "Active");
			ResultSet rs = pst.executeQuery();
			int i = 0;
			while (rs.next() && i < 4) {
				det = new BookDetails();

				det.setBookId(rs.getInt("bookId"));
				det.setBookname(rs.getString("bookName"));
				det.setAuthor(rs.getString("author"));
				det.setPrice(rs.getDouble("price"));
				det.setBookCategory(rs.getString("bookCategory"));
				det.setStatus(rs.getString("status"));
				det.setPhoto(rs.getString("photo"));
				det.setEmail(rs.getString("email"));

				list.add(det);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}
		return list;

	}

	@Override
	public List<BookDetails> getOldBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails det = null;

		try {
			String query = "Select * from bookDetails WHERE bookCategory=? and Status=? ORDER BY bookId DESC";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, "Old");
			pst.setString(2, "Active");
			ResultSet rs = pst.executeQuery();
			int i = 0;
			while (rs.next() && i < 4) {
				det = new BookDetails();

				det.setBookId(rs.getInt("bookId"));
				det.setBookname(rs.getString("bookName"));
				det.setAuthor(rs.getString("author"));
				det.setPrice(rs.getDouble("price"));
				det.setBookCategory(rs.getString("bookCategory"));
				det.setStatus(rs.getString("status"));
				det.setPhoto(rs.getString("photo"));
				det.setEmail(rs.getString("email"));

				list.add(det);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllRecentBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails det = null;

		try {
			String query = "Select * from bookDetails WHERE Status=? ORDER BY bookId DESC";
			PreparedStatement pst = conn.prepareStatement(query);

			pst.setString(1, "Active");
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				det = new BookDetails();

				det.setBookId(rs.getInt("bookId"));
				det.setBookname(rs.getString("bookName"));
				det.setAuthor(rs.getString("author"));
				det.setPrice(rs.getDouble("price"));
				det.setBookCategory(rs.getString("bookCategory"));
				det.setStatus(rs.getString("status"));
				det.setPhoto(rs.getString("photo"));
				det.setEmail(rs.getString("email"));

				list.add(det);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllNewBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails det = null;

		try {
			String query = "Select * from bookDetails WHERE bookCategory=? and Status=? ORDER BY bookId DESC";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, "New");
			pst.setString(2, "Active");
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				det = new BookDetails();

				det.setBookId(rs.getInt("bookId"));
				det.setBookname(rs.getString("bookName"));
				det.setAuthor(rs.getString("author"));
				det.setPrice(rs.getDouble("price"));
				det.setBookCategory(rs.getString("bookCategory"));
				det.setStatus(rs.getString("status"));
				det.setPhoto(rs.getString("photo"));
				det.setEmail(rs.getString("email"));

				list.add(det);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllOldBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails det = null;

		try {
			String query = "Select * from bookDetails WHERE bookCategory=? and Status=? ORDER BY bookId DESC";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, "Old");
			pst.setString(2, "Active");
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				det = new BookDetails();

				det.setBookId(rs.getInt("bookId"));
				det.setBookname(rs.getString("bookName"));
				det.setAuthor(rs.getString("author"));
				det.setPrice(rs.getDouble("price"));
				det.setBookCategory(rs.getString("bookCategory"));
				det.setStatus(rs.getString("status"));
				det.setPhoto(rs.getString("photo"));
				det.setEmail(rs.getString("email"));

				list.add(det);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}
		return list;
	}

	@Override
	public List<BookDetails> getBookByOld(String email, String category) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails det = null;

		try {
			String query = "Select * from bookDetails WHERE bookCategory=? and email=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, category);
			pst.setString(2, email);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				det = new BookDetails();

				det.setBookId(rs.getInt("bookId"));
				det.setBookname(rs.getString("bookName"));
				det.setAuthor(rs.getString("author"));
				det.setPrice(rs.getDouble("price"));
				det.setBookCategory(rs.getString("bookCategory"));
				det.setStatus(rs.getString("status"));
				det.setPhoto(rs.getString("photo"));
				det.setEmail(rs.getString("email"));

				list.add(det);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}
		return list;
	}

	@Override
	public boolean oldBookDelete(String email, String category, int bid) {
		boolean del = false;
		String query = "Delete From bookDetails where bookCategory=? and email=? and bookId=?";
		try {
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, category);
			pst.setString(2, email);
			pst.setInt(3, bid);
			int result = pst.executeUpdate();
			if (result == 1)
				del = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}
		return del;
	}

	@Override
	public List<BookDetails> getBookBySearch(String ch) {

		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails det = null;

		try {
			String query = "Select * from bookDetails WHERE bookName like ? or author like ? or bookCategory like ? and status=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, "%" + ch + "%");
			pst.setString(2, "%" + ch + "%");
			pst.setString(3, "%" + ch + "%");
			pst.setString(4, "Active");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				det = new BookDetails();

				det.setBookId(rs.getInt("bookId"));
				det.setBookname(rs.getString("bookName"));
				det.setAuthor(rs.getString("author"));
				det.setPrice(rs.getDouble("price"));
				det.setBookCategory(rs.getString("bookCategory"));
				det.setStatus(rs.getString("status"));
				det.setPhoto(rs.getString("photo"));
				det.setEmail(rs.getString("email"));

				list.add(det);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.destroy();
		}
		return list;
	}

}

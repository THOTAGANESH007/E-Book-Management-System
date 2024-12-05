package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOImpl implements UserDAO {
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(User user) {
		boolean auth = false;
		try {
			String query = "insert into user(name,email,phno,password) values(?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPhno());
			pst.setString(4, user.getPassword());

			int result = pst.executeUpdate();

			if (result == 1)
				auth = true;
		
		} catch (Exception e) {
			e.printStackTrace();
		}

		return auth;
	}

	@Override
	public User login(String email, String password) {
		User auth = null;
		try {
			String query = "SELECT * FROM user WHERE email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				auth = new User();
				auth.setId(rs.getInt("id"));
				auth.setName(rs.getString("name"));
				auth.setEmail(rs.getString("email"));
				auth.setPhno(rs.getString("phno"));
				auth.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return auth;
	}

	@Override
	public boolean updateProfile(User user) {
		boolean update = false;

		try {
			String query = "update user set name=?,email=?,phno=?,password=? where id=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPhno());
			pst.setString(4, user.getPassword());
			pst.setInt(5, user.getId());
			int result = pst.executeUpdate();
			if (result == 1)
				update = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return update;
	}

	@Override
	public boolean checkUser(String email) {
		boolean bool = true;
		try {
			String query = "select * from user where email=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				bool = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bool;
	}

}

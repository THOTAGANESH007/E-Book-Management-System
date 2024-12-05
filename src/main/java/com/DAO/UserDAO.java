package com.DAO;

import com.entity.User;

public interface UserDAO {

	public boolean userRegister(User user);

	public User login(String email, String password);

	public boolean updateProfile(User user);

	public boolean checkUser(String email);

}

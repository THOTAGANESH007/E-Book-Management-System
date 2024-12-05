package com.DAO;

import java.util.List;

import com.entity.BookOrder;

public interface BookOrderDAO {

	// USERS

	public int getOrderNo();

	public boolean saveOrder(List<BookOrder> blist);

	public List<BookOrder> getBook(String email);
	
	public boolean updateAddress(String fullAddress,String email);

	// ADMIN

	public List<BookOrder> getAllOrders();
}

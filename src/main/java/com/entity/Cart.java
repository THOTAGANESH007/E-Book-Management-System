package com.entity;

public class Cart {
	private int cid;
	private int bid;
	private int uid;
	private String bookName;
	private String author;
	private double price;
	private double totalPrice;

	public Cart() {
		super();
	}
	public Cart(int cid, int bid, int uid, String bookName, String author, double price, double totalPrice) {
		super();
		this.cid = cid;
		this.bid = bid;
		this.uid = uid;
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.totalPrice = totalPrice;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

}

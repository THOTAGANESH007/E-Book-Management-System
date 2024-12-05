package com.DAO;

import java.util.List;

import com.entity.BookDetails;

public interface BookDAO {

	// ADMIN

	public boolean addBooks(BookDetails details);

	public List<BookDetails> getAllBooks();

	public BookDetails getBookById(int id);

	public boolean updateEditBooks(BookDetails det);

	public boolean deleteBooks(int id);

	// USERS

	public List<BookDetails> getNewBooks();

	public List<BookDetails> getRecentBooks();

	public List<BookDetails> getOldBooks();

	public List<BookDetails> getAllRecentBooks();

	public List<BookDetails> getAllNewBooks();

	public List<BookDetails> getAllOldBooks();

	public List<BookDetails> getBookByOld(String email, String category);

	public boolean oldBookDelete(String email, String category, int bid);

	public List<BookDetails> getBookBySearch(String ch);

}

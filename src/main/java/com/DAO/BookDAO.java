package com.DAO;

import java.util.List;

import com.entity.BookDtls;

public interface BookDAO {
	public boolean addBooks(BookDtls b);
	
	public List<BookDtls> getAllBooks();
	
	public BookDtls getBookById(int id);
	
	public boolean updateEditBooks(BookDtls b);
	
	public boolean deleteBooks(int id);
	
	public boolean checkBookExists(String bookName, String author);
	
	public List<BookDtls> getBooksByCategory(String category);
	
//	public List<BookDtls> getITBook();
//	
//	public List<BookDtls> getKidBook();
//	
//	public List<BookDtls> getVHKDBook();
//	
//	public List<BookDtls> getTTBook();
//	
//	public List<BookDtls> getKNSBook();
	
	public List<BookDtls> getAllKIDBook();
	
	public List<BookDtls> getAllITBook();
	
	public List<BookDtls> getAllVHKDBook();
	
	public List<BookDtls> getAllTTBook();
	
	public List<BookDtls> getAllKNSBook();
	
}

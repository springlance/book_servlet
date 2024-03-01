package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BookDAOImpl implements BookDAO {

	private Connection conn;

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBooks(BookDtls b) {
		boolean f = false;
		try {
			String sql = "INSERT INTO book_dtls(bookName, author, description, releaseDate, pageNumber, category, photo, email, price) "
					+ "VALUES(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getDescription());
			ps.setString(4, b.getReleaseDate());
			ps.setInt(5, b.getPageNumber());
			ps.setString(6, b.getCategory());
			ps.setString(7, b.getPhoto());
			ps.setString(8, b.getEmail());
			ps.setString(9, b.getPrice());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDtls> getAllBooks() {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String sql = "SELECT * FROM book_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setDescription(rs.getString(4));
				b.setReleaseDate(rs.getString(5));
				b.setPageNumber(rs.getInt(6));
				b.setCategory(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setEmail(rs.getString(9));
				b.setPrice(rs.getString(10));
				list.add(b);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public BookDtls getBookById(int id) {
		BookDtls b=null;
		try {
			String sql = "SELECT * FROM book_dtls where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt("bookId"));
				b.setBookName(rs.getString("bookName"));
				b.setAuthor(rs.getString("author"));
				b.setDescription(rs.getString("description"));
				b.setReleaseDate(rs.getString("releaseDate"));
				b.setPageNumber(rs.getInt("pageNumber"));
				b.setCategory(rs.getString("category"));
				b.setPrice(rs.getString("price"));
	            b.setPhoto(rs.getString("photo"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	@Override
	public boolean updateEditBooks(BookDtls b) {
		boolean f = false;
		try {
			String sql = "UPDATE book_dtls SET bookName=?, author=?, description=?, releaseDate=?, pageNumber=?, category=?, price=? WHERE bookId=?" ;
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getDescription());
			ps.setString(4, b.getReleaseDate());
			ps.setInt(5, b.getPageNumber());
			ps.setString(6, b.getCategory());
			ps.setString(7, b.getPrice());
			ps.setInt(8, b.getBookId());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}

	@Override
	public boolean deleteBooks(int id) {
		boolean f = false;
		try {
			String sql = "DELETE FROM book_dtls WHERE bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, id);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}
	
	

	@Override
	public boolean checkBookExists(String bookName, String author) {
		
        try {
        	String sql = "SELECT COUNT(*) FROM book_dtls WHERE bookName = ? AND author = ?";
        	PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, bookName);
            ps.setString(2, author);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
	}

	@Override
	public List<BookDtls> getBooksByCategory(String category) {
	    List<BookDtls> list = new ArrayList<BookDtls>();
	    BookDtls b = null;
	    try {
	        String sql = "SELECT * FROM book_dtls WHERE category = ? ORDER BY bookId DESC";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, category);
	        ResultSet rs = ps.executeQuery();
	        int i = 1;
	        while (rs.next() && i <= 6) {
	            b = new BookDtls();
	            b.setBookId(rs.getInt(1));
	            b.setBookName(rs.getString(2));
	            b.setAuthor(rs.getString(3));
	            b.setDescription(rs.getString(4));
	            b.setReleaseDate(rs.getString(5));
	            b.setPageNumber(rs.getInt(6));
	            b.setCategory(rs.getString(7));
	            b.setPhoto(rs.getString(8));
	            b.setEmail(rs.getString(9));
	            b.setPrice(rs.getString(10));
	            list.add(b);
	            i++;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}


	@Override
	public List<BookDtls> getAllKIDBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from book_dtls where category=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Truyện thiếu nhi");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setDescription(rs.getString(4));
				b.setReleaseDate(rs.getString(5));
				b.setPageNumber(rs.getInt(6));
				b.setCategory(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setEmail(rs.getString(9));
				b.setPrice(rs.getString(10));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllITBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from book_dtls where category=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Công nghệ thông tin");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setDescription(rs.getString(4));
				b.setReleaseDate(rs.getString(5));
				b.setPageNumber(rs.getInt(6));
				b.setCategory(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setEmail(rs.getString(9));
				b.setPrice(rs.getString(10));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllVHKDBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from book_dtls where category=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Văn học kinh điển");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setDescription(rs.getString(4));
				b.setReleaseDate(rs.getString(5));
				b.setPageNumber(rs.getInt(6));
				b.setCategory(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setEmail(rs.getString(9));
				b.setPrice(rs.getString(10));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllTTBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from book_dtls where category=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Tiểu thuyết");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setDescription(rs.getString(4));
				b.setReleaseDate(rs.getString(5));
				b.setPageNumber(rs.getInt(6));
				b.setCategory(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setEmail(rs.getString(9));
				b.setPrice(rs.getString(10));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllKNSBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from book_dtls where category=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Kĩ năng sống");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setDescription(rs.getString(4));
				b.setReleaseDate(rs.getString(5));
				b.setPageNumber(rs.getInt(6));
				b.setCategory(rs.getString(7));
				b.setPhoto(rs.getString(8));
				b.setEmail(rs.getString(9));
				b.setPrice(rs.getString(10));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}

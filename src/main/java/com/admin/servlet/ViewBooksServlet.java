package com.admin.servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/viewbooks")
@MultipartConfig
public class ViewBooksServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String description = req.getParameter("description");
			String releaseDate = req.getParameter("release");
			int pageNumber = Integer.parseInt(req.getParameter("bpage"));
			String category = req.getParameter("category");
			Part photoPart = req.getPart("photo");
            InputStream photo = photoPart.getInputStream();
            String price = req.getParameter("price");
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			
			BookDtls b = dao.getBookById(id);
			
			HttpSession session = req.getSession();
			
			if(b != null) {
				b.setBookName(bookName);
				b.setAuthor(author);
				b.setDescription(description);
				b.setReleaseDate(releaseDate);
				b.setPageNumber(pageNumber);
				b.setCategory(category);
				b.setPrice(price);
				
				session.setAttribute("bookPhoto", b.getPhoto());
				session.setAttribute("succMsg", "Book Update Successfully");
				resp.sendRedirect("admin/all_books.jsp");
			}else {
				session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("admin/all_books.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

package com.admin.servlet;

import java.io.IOException;

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

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if(req.getCharacterEncoding()==null)
			req.setCharacterEncoding("UTF-8");
		try {
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean bookExists = dao.checkBookExists(bookName, author);

			if (bookExists) {
				HttpSession session = req.getSession();
				session.setAttribute("failedMsg", "The book already exists");
				resp.sendRedirect("admin/all_books.jsp");
				return; 
			}
			
			String description = req.getParameter("description");
			String releaseDate = req.getParameter("release");
			int pageNumber = Integer.parseInt(req.getParameter("bpage"));
			String category = req.getParameter("category");
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			String price = req.getParameter("bprice");

			BookDtls b = new BookDtls(bookName, author, description, releaseDate, pageNumber, category, fileName,
					"admin", price);


			boolean f = dao.addBooks(b);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Book Add Successfully");
				resp.sendRedirect("admin/all_books.jsp");
			} else {
				session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("admin/all_books.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getCharacterEncoding()==null)
			req.setCharacterEncoding("UTF-8");
		
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String description = req.getParameter("description");
			String releaseDate = req.getParameter("release");
			int pageNumber = Integer.parseInt(req.getParameter("bpage"));
			String category = req.getParameter("category");
			String price = req.getParameter("bprice");
			
			
			BookDtls b = new BookDtls();
			b.setBookId(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setDescription(description);
			b.setReleaseDate(releaseDate);
			b.setPageNumber(pageNumber);
			b.setCategory(category);
			b.setPrice(price);
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			
			boolean f = dao.updateEditBooks(b);
			
			HttpSession session = req.getSession();
			
			if (f) {
			    session.setAttribute("succMsg", "Book update successfully");
			    resp.sendRedirect("admin/all_books.jsp");
			} else {
			    session.setAttribute("failedMsg", "Something went wrong on the server");
			    resp.sendRedirect("admin/all_books.jsp");
//			    resp.sendRedirect("./admin/edit_books.jsp?id=" + id);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}



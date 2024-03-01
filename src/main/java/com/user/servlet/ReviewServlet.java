package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ReviewDAOImpl;
import com.DB.DBConnect;
import com.entity.Review;

@WebServlet("/add_review")
public class ReviewServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getCharacterEncoding()==null)
			req.setCharacterEncoding("UTF-8");
		try {
			int bookID = Integer.parseInt(req.getParameter("bookID"));
			int userID = Integer.parseInt(req.getParameter("userID"));
		    String comment = req.getParameter("comment");
		    int rating = Integer.parseInt(req.getParameter("rating"));

		    Review r = new Review(bookID, userID, comment, rating);

			ReviewDAOImpl dao = new ReviewDAOImpl(DBConnect.getConn());

			boolean f = dao.addReview(r);

			HttpSession session = req.getSession();

			if (f) {
				resp.sendRedirect("view_books.jsp?bid=" +bookID);
			} else {
				resp.getWriter().println("Lỗi khi thêm bình luận và đánh giá!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

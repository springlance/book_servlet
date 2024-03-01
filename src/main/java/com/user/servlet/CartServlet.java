//package com.user.servlet;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.DAO.BookDAOImpl;
//import com.DAO.CartDAOImpl;
//import com.DB.DBConnect;
//import com.entity.BookDtls;
//import com.entity.Cart;
//
//@WebServlet("/cart")
//public class CartServlet extends HttpServlet{
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		try {
//			int bid=Integer.parseInt(req.getParameter("bid"));
//			int uid=Integer.parseInt(req.getParameter("uid"));
//			
//			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
//			BookDtls b = dao.getBookById(bid);
//			
//			Cart c = new Cart();
//			c.setBid(bid);
//			c.setUserId(uid);
//			c.setBookName(b.getBookName());
//			c.setAuthor(b.getAuthor());
//			c.setPrice(Integer.parseInt(b.getPrice()));
//			
//			c.setTotalPrice(Integer.parseInt(b.getPrice()));
//			
//			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
//			boolean f = dao2.addCart(c);
//			
//			HttpSession session = req.getSession();
//			if(f) {
//				session.setAttribute("addCart", "Book Added to cart");
//				resp.sendRedirect("index.jsp");
//			} else {
//				session.setAttribute("failed", "Something wrong on server");
//				resp.sendRedirect("index.jsp");
//			}
//			
//			if(f) {
//				System.out.println("Add cart success");
//			} else {
//				System.out.println("No added to cart");
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//}

package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			int quantity = Integer.parseInt(req.getParameter("quantity"));

			BookDAOImpl bookDAO = new BookDAOImpl(DBConnect.getConn());
			BookDtls book = bookDAO.getBookById(bid);

			CartDAOImpl cartDAO = new CartDAOImpl(DBConnect.getConn());
			Cart cart = cartDAO.getCartByBookAndUser(bid, uid);

			if (cart == null) {
				cart = new Cart();
				cart.setBid(bid);
				cart.setUserId(uid);
				cart.setBookName(book.getBookName());
				cart.setAuthor(book.getAuthor());
				cart.setPrice(Integer.parseInt(book.getPrice()));
				cart.setQuantity(quantity);
				cart.setTotal(cart.getPrice() * cart.getQuantity());
				cart.setTotalPrice(cart.getTotal());

				boolean added = cartDAO.addCartWithQuantity(cart);
				HttpSession session = req.getSession();
				if (added) {
					session.setAttribute("addCart", "Book Added to cart");
					resp.sendRedirect("index.jsp");
				} else {
					session.setAttribute("failed", "Something wrong on server");
					resp.sendRedirect("index.jsp");
				}
			} else {
				// Cart đã tồn tại, có thể cập nhật số lượng nếu cần
				cart.setQuantity(cart.getQuantity() + quantity);
				cart.setTotal(cart.getPrice() * cart.getQuantity());
				cart.setTotalPrice(cart.getTotalPrice() + cart.getTotal());

				boolean updated = cartDAO.updateCart(cart);
				if (updated) {
					// Cập nhật thành công
				} else {
					// Lỗi khi cập nhật
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int uid = Integer.parseInt(req.getParameter("uid"));
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		boolean success = dao.cancelOrderByUser(uid);
		if(success) {
			resp.sendRedirect("index.jsp");
		} else {
			resp.sendRedirect("index.jsp");
		}
	}

}

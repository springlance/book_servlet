package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name = req.getParameter("fname");
			
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean userExists = dao.checkUserExists(name);

			if (userExists) {
				HttpSession session = req.getSession();
				session.setAttribute("failedMsg", "The user already exists");
				resp.sendRedirect("register.jsp");
				return; 
			}
			
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setPassword(password);
			
			HttpSession session = req.getSession();
			
			if(check!=null) {
				boolean f = dao.userRegister(us);
				if(f) {
					session.setAttribute("succMsg", "Registration Sccessfully");
					resp.sendRedirect("register.jsp");
				}else {
					session.setAttribute("failedMsg", "Something wrong on server");
					resp.sendRedirect("register.jsp");
				}
			}else {
				session.setAttribute("failedMsg", "Please Check Agree Terms & Condition");
				resp.sendRedirect("register.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

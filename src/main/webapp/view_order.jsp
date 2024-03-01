<%@page import="com.entity.Cart"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.DAO.UserDAOImpl"%>
<%@page import="com.entity.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.ReviewDAOImpl"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
<%@include file="components/Css.jsp"%>
<style>
.input-group {
	max-width: 200px;
}

.quantity-input {
	text-align: center;
}
</style>

</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<%
	try {

		User u = (User) session.getAttribute("userobj");

		CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
		List<Cart> cart = dao2.getBookByUser(u.getId());
		for (Cart c : cart) {
	%>
	<%
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	int bookId = c.getBid(); // Lấy bookId từ Cart
	BookDtls b = dao.getBookById(bookId);
	if (b != null) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<img src="book/<%=b.getPhoto()%>" class="img-thumbnail"
					style="max-width: 85%; height: auto;">
			</div>
			<div class="col-md-8">
				<h2><%=b.getBookName()%></h2>
				<p>
					Tác giả:
					<%=b.getAuthor()%></p>
				<p>
					Thể loại:<%=b.getCategory()%></p>
				<p>
					Ngày phát hành:
					<%=b.getReleaseDate()%></p>
				<p>
					Số trang:
					<%=b.getPageNumber()%></p>
				<p>
					Số lượng:
					<%=c.getQuantity()%>
				<p>
					Tổng:
					<%=c.getTotal()%><i class="fa-solid fa-dong-sign"></i>
				</p>
				<p class="text-justify"><%=b.getDescription()%></p>
			</div>
		</div>
		<hr>
	</div>
	<%
	}
	%>
	<%
	}

	} catch (Exception e) {
	e.printStackTrace();
	}
	%>

</body>
</html>

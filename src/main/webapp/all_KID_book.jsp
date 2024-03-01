<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Truyện thiếu nhi</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@include file="components/Css.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/book.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}

</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container">
		<h3 class="ml-3 mt-3">Truyện thiếu nhi</h3>
		<div class="row p-3">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllKIDBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 180px; height: 230px" class="img-thumblin">
						<p class="mt-2"><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-3"><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a> <a
								href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-2"><i
								class="fa-solid fa-eye"></i> View Book</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>
</body>
</html>
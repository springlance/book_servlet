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
<title>Admin: All Books</title>
<%@include file="Css.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	<h3 class="text-center mt-4">Hello, Admin</h3>

	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg }</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg }</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<c:set var="loggedIn" value="${not empty userobj}" />
	<c:if test="${loggedIn}">
		<a href="add_books.jsp" class="btn btn-success float-right">Add Book</a>
	</c:if>


	<table class="table table-striped">
		
			<thead class="bg-dark text-white">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Image</th>
					<th scope="col">Title</th>
					<th scope="col">Author</th>
					<th scope="col">Release Date</th>
					<th scope="col">Number of pages</th>
					<th scope="col">Category</th>
					<c:if test="${loggedIn}">
					<th scope="col">Action</th>
					</c:if>
				</tr>
			</thead>
		
		<tbody>
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllBooks();

			for (BookDtls b : list) {
			%>
			<tr>
				<td><%=b.getBookId()%></td>
				<td><img src="../book/<%=b.getPhoto()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getReleaseDate()%></td>
				<td><%=b.getPageNumber()%></td>
				<td><%=b.getCategory()%></td>
				<c:if test="${loggedIn}">
					<td>
						<a href="view_book.jsp?id=<%=b.getBookId()%>"
							class="btn btn-sm btn-success"> <i class="fa-solid fa-eye"></i>
								View
						</a>
						<a href="../delete?id=<%=b.getBookId()%>"
							class="btn btn-sm btn-danger"
							onclick="return confirm('Bạn có chắc chắn muốn xóa?');"> <i
								class="fa-solid fa-trash-can"></i> Delete
						</a>
					</td>
				</c:if>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>
</body>
</html>

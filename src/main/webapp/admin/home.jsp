<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Home</title>
<%@include file="Css.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"/>
	</c:if>

	<div class="container">

		<div class="row p-5 mt-5 justify-content-center align-items-center">
			<!--  
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-square-plus fa-2xl text-primary"></i><br>
							<h4>Add Books</h4>
							---------------
						</div>
					</div>
				</a>
			</div> -->

			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book fa-2xl text-danger"></i><br>
							<h4 class="mt-3">CRUD Books</h4>
							---------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-box-open fa-2xl text-warning"></i><br>
							<h4 class="mt-3">Order</h4>
							---------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card">
					<div class="card-body text-center">
						<i class="fa-solid fa-right-from-bracket fa-2xl text-primary"></i><br>
						<h4 class="mt-3">Logout</h4>
						---------------
					</div>
				</div>
				</a>
			</div>
		</div>
	</div>

	<!-- Logout modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Logout</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Do you want to logout?</h4>
						<a href="../logout" type="button"
							class="btn btn-primary text-white">Logout</a>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- end modal -->


	<div style="margin-top: 183px;">
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book: Login</title>
<style>
.btn-ho:hover {
    background-color: rgba(0, 0, 0, 0.5); /* Màu chữ mờ */
}

</style>
</head>
<body style="padding-top: 56px;">

	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		style="background-color: #263238; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto ">
				<li class="nav-item active mt-2 "><a
					class="nav-lin active text-white" style="text-decoration:none;" href="index.jsp"> <i
						class="fas fa-house"></i> Trang chủ <span class="sr-only">(current)</span>
				</a></li>
				<div class="dropdown show">
					<a class="btn dropdown-toggle text-white ml-3" href="#" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fa-solid fa-list-ul"></i>
						Danh mục sách
					</a>

					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="all_KID_book.jsp">Truyện thiếu
							nhi</a> <a class="dropdown-item" href="all_IT_book.jsp">Công nghệ
							thông tin</a> <a class="dropdown-item" href="all_VHKD_book.jsp">Văn
							học kinh điển</a> <a class="dropdown-item" href="all_TT_book.jsp">Tiểu
							thuyết</a> <a class="dropdown-item" href="all_KNS_book.jsp">Kĩ
							năng sống</a>
					</div>
				</div>
			</ul>
		</div>


		<c:if test="${not empty userobj }">
			<div class="col-md-5">
				<a href="checkout.jsp" class="btn text-white btn-ho"><i
					class="fa-solid fa-cart-plus"></i> Giỏ hàng</a>
					<a href="order_details.jsp" class="btn text-white btn-ho"><i
					class="fa-solid fa-cart-plus"></i> Đơn hàng</a>
					 <a href="login.jsp"
					class="btn text-white btn-ho"><i class="fa-solid fa-user"></i>
					${userobj.name }</a> <a href="logout" class="btn text-white btn-ho"><i
					class="fa-solid fa-right-from-bracket"></i> Đăng xuất</a>
			</div>
		</c:if>

		<c:if test="${empty userobj }">
			<div class="col-md-3">
				<a href="login.jsp" class="btn text-white btn-ho"><i
					class="fa-solid fa-right-to-bracket"></i> Đăng nhập</a> <a
					href="register.jsp" class="btn text-white btn-ho"><i
					class="fa-solid fa-user-plus"></i> Đăng kí</a>
			</div>
		</c:if>
	</nav>
</body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Book</title>
<%@include file="components/Css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="components/navbar.jsp"%>
	<div class="container text-center"
		style="display: flex; justify-content: center; align-items: center; height: 100vh;">
		<div>
			<i class="fa-solid fa-circle-check fa-5x text-success"></i>
			<h1>Cảm ơn!</h1>
			<h2>Bạn đã đặt hàng thành công</h2>
			<h5>Nếu có vấn đề gì vui lòng liên hệ: 0986588987</h5>
			<a href="index.jsp" class="btn btn-primary mt-3">Trang chủ</a> <a
				href="order_details.jsp" class="btn btn-danger mt-3">Xem đơn hàng</a>
		</div>
	</div>
</body>
</html>
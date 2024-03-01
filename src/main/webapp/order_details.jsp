<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your cart</title>
<%@include file="components/Css.jsp"%>
</head>
<body style="background-color: #f0f1f2; padding-top: 70px;">
	<%@include file="components/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h3 class="text-center text-dark">Đơn đặt hàng của bạn</h3>
				<div class="card bg-white">
					<%
					User u = (User) session.getAttribute("userobj");

					CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
					List<Cart> cart = dao2.getBookByUser(u.getId());
					int totalPrice = 0;
					%>
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">Tên sách</th>
								<th scope="col">Tác giả</th>
								<th scope="col">Số lượng</th>
								<th scope="col">Tổng thanh toán</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (Cart c : cart) {
								totalPrice += c.getTotal();
							%>
							<tr>
								<td><%=c.getBookName()%></td>
								<td><%=c.getAuthor()%></td>
								<td><%=c.getQuantity()%></td>
								<td><%=c.getTotal()%></td>
							</tr>
							<%
							}
							%>
							<tr>
								<th colspan="3">Tổng thanh toán</th>
								<td><%=totalPrice%></td>
							</tr>
						</tbody>
					</table>
					<div class="text-center d-flex justify-content-center">
						<a href="view_order.jsp?uid=<%=u.getId()%>"
							class="btn btn-success" style="margin-right: 5px;"><i
							class="fa-solid fa-eye"></i> Xem chi tiết</a>

					</div>
<!--  
					<div class="text-center">
						<form action="cart" method="post">
							<input type="hidden" name="uid" id="uid">
							<button type="button" class="btn btn-primary"
								onclick="showConfirmation()">Hủy đơn hàng</button>
						</form>
					</div>-->
				</div>
			</div>
		</div>
	</div>
	<script>
	function showConfirmation() {
	    if (confirm('Bạn có chắc chắn muốn hủy đơn hàng?')) {
	      document.querySelector('form').submit();
	    }
	  }
	</script>
</body>
</html>
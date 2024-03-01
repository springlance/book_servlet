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
				<h3 class="text-center text-dark">Giỏ hàng của bạn</h3>
				<div class="card bg-white">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">Tên sách</th>
								<th scope="col">Tác giả</th>
								<th scope="col">Giá bán</th>
								<th scope="col">Số lượng</th>
								<th scope="col">Số tiền</th>
								<th scope="col">Xóa</th>
							</tr>
						</thead>
						<tbody>
							<%
							User u = (User) session.getAttribute("userobj");
							CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
							List<Cart> cart = dao.getBookByUser(u.getId());
							int totalPrice = 0;
							for (Cart c : cart) {
								totalPrice += c.getTotalPrice();
							%>
							<tr>
								<th scope="row"><%=c.getBookName()%></th>
								<td><%=c.getAuthor()%></td>
								<td><%=c.getPrice()%></td>
								<td><%=c.getQuantity()%></td>
								<td class="total" data-cid="<%=c.getCid()%>"><%=c.getTotal()%></td>
								<td><a
									href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>"
									onclick="return confirm('Bạn có chắc chắn muốn xóa?')"
									class="btn btn-sm btn-danger">Xóa</a></td>
							</tr>
							<%
							}
							%>

							<tr>
								<th colspan="4">Tổng thanh toán</th>
								<td id="totalPrice"><%=totalPrice%></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="text-right mt-3">
					<a href="order.jsp" class="btn btn-info" onclick="confirmBuyBook()">Đặt hàng</a>
				</div>
            </div>
			</div>
		</div>
	</div>

	<script>
	function confirmBuyBook() {
        if (confirm("Bạn có chắc chắn muốn đặt hàng không?")) {
            return true;
        } else {
            return false;
        }
    }
	

		function updateTotalPrice(quantity, cid) {
			var price = parseInt($("[data-cid='" + cid + "']").closest("tr")
					.find("td:nth-child(3)").text());
			var totalPrice = price * quantity;
			$("[data-cid='" + cid + "']").text(totalPrice);

			// Recalculate the overall total price
			var totalPriceSum = 0;
			$(".total").each(function() {
				var row = $(this).closest("tr");
				var rowPrice = parseInt(row.find("td:nth-child(3)").text());
				var rowQuantity = parseInt(row.find(".quantityInput").val());
				var rowTotalPrice = rowPrice * rowQuantity;
				$(this).text(rowTotalPrice);
				totalPriceSum += rowTotalPrice;
			});
			$("#totalPrice").text(totalPriceSum);
		}
		
		function showSuccessMessage() {
	        document.getElementById("successMessage").style.display = "block";
	    }
		
	</script>
</body>
</html>
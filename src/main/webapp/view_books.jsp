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
	User u = (User) session.getAttribute("userobj");
	%>
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>

	<div class="container">
		<div class="row p-4">
			<div class="col-md-4">
				<img src="book/<%=b.getPhoto()%>" class="img-thumbnail">
			</div>

			<div class="col-md-8">
				<h2><%=b.getBookName()%></h2>
				<p>
					Tác giả:
					<%=b.getAuthor()%></p>
				<p>
					Thể loại:
					<%=b.getCategory()%></p>
				<p>
					Ngày phát hành:
					<%=b.getReleaseDate()%></p>
				<p>
					Số trang:
					<%=b.getPageNumber()%></p>
				<p>
					Giá bán:
					<%=b.getPrice()%><i class="fa-solid fa-dong-sign"></i>
				</p>
				<p class="text-justify"><%=b.getDescription()%></p>

				<div class="input-group">
					<p>Số lượng:</p>
					<div class="input-group-prepend">
						<button class="btn btn-outline-secondary minusBtn" type="button">
							-</button>
					</div>
					<input type="text" class="form-control quantityInput"
						name="quantity" value="1" id="quantityInput">

					<div class="input-group-append">
						<button class="btn btn-outline-secondary plusBtn" type="button">+</button>
					</div>
				</div>

				<div class="row">
					<%
					if (u == null) {
					%>
					<a href="login.jsp" class="btn btn-danger btn-sm mt-4 ml-3"><i
						class="fa-solid fa-cart-shopping"></i> Thêm vào giỏ hàng</a>
					<%
					} else {
					%>
					<a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>"
						class="btn btn-danger btn-sm mt-4 ml-3 addToCartBtn"> <i
						class="fa-solid fa-cart-shopping"></i> Thêm vào giỏ hàng
					</a>

					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>


	<!-- comment và rating ở đây -->
	<%
	UserDAOImpl userDAO = new UserDAOImpl(DBConnect.getConn());
	ReviewDAOImpl reviewDAO = new ReviewDAOImpl(DBConnect.getConn());
	List<Review> reviews = reviewDAO.getReviewsByBookID(b.getBookId());
	if (!reviews.isEmpty()) {
	%>
	<div class="container">
		<div class="row p-4">
			<div class="col-md-7">
				<%
				for (Review review : reviews) {
					User user = userDAO.getUserByID(review.getUserID());
				%>
				<div class="card">
					<div class="card-body">
						<p>
							<i class="fa-solid fa-user"></i>
							<%=user != null ? user.getName() : "Unknown User"%></p>
						<div class="rating">
							<%-- Hiển thị số sao đã chọn --%>
							<%
							int ratingValue = review.getRating();
							%>
							<%
							for (int i = 1; i <= 5; i++) {
							%>
							<i
								class="fa-<%=i <= ratingValue ? "solid" : "regular"%> fa-star star"
								style="color: #f6d604;"></i>
							<%
							}
							%>
						</div>
						<p class="card-text"><%=review.getComment()%></p>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="col-md-5">
				<%
				if (u != null) {
				%>
				<form action="add_review" method="post">
					<div class="form-group">
						<label for="rating">Đánh giá</label>
						<div class="rating">
							<input type="hidden" name="rating" id="rating" value="0">
							<%-- Hiển thị ngôi sao --%>
							<%
							for (int i = 1; i <= 5; i++) {
							%>
							<i class="fa-regular fa-star star" style="color: #f6d604;"
								data-value="<%=i%>"></i>
							<%
							}
							%>
						</div>
					</div>
					<div class="form-group">
						<label for="comment">Bình luận</label>
						<textarea class="form-control" name="comment" id="comment"
							rows="3" placeholder="Hãy để lại nhận xét cho cuốn sách này nhé"></textarea>
					</div>
					<input type="hidden" name="bookID" value="<%=b.getBookId()%>">
					<input type="hidden" name="userID" value="<%=u.getId()%>">
					<button type="submit" class="btn btn-primary">
						<i class="fa-solid fa-paper-plane"></i>
					</button>
				</form>
				<%
				} else {
				%>
				<h5>Đánh giá sách</h5>
				<a href="login.jsp" style="color: #000; text-decoration: none;">Vui
					lòng đăng nhập</a>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<%
	} else {
	%>
	<div class="container">
		<div class="row p-4">
			<div class="col-md-7">
				<p>Chưa có bình luận và đánh giá nào cho cuốn sách này.</p>
			</div>
			<div class="col-md-5">
				<%
				if (u != null) {
				%>
				<form action="add_review" method="post">
					<div class="form-group">
						<label for="rating">Đánh giá</label>
						<div class="rating">
							<input type="hidden" name="rating" id="rating" value="0">
							<%
							for (int i = 1; i <= 5; i++) {
							%>
							<i class="fa-regular fa-star star" style="color: #f6d604;"
								data-value="<%=i%>"></i>
							<%
							}
							%>
						</div>
					</div>
					<div class="form-group">
						<label for="comment">Bình luận</label>
						<textarea class="form-control" name="comment" id="comment"
							rows="3" placeholder="Hãy để lại nhận xét cho cuốn sách này nhé"></textarea>
					</div>
					<input type="hidden" name="bookID" value="<%=b.getBookId()%>">
					<input type="hidden" name="userID" value="<%=u.getId()%>">
					<button type="submit" class="btn btn-primary">
						<i class="fa-solid fa-paper-plane"></i>
					</button>
				</form>
				<%
				} else {
				%>
				<h5>Đánh giá sách</h5>
				<a href="login.jsp" style="color: #000; text-decoration: none;">Vui
					lòng đăng nhập</a>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<%
	}
	%>

	<script>
    const stars = document.querySelectorAll('.rating .star');
    const ratingInput = document.getElementById('rating');

    stars.forEach(star => {
        star.addEventListener('click', () => {
            const ratingValue = star.getAttribute('data-value');
            ratingInput.value = ratingValue;
            updateStarRating(ratingValue);
        });
    });

    function updateStarRating(rating) {
        stars.forEach(star => {
            const starValue = star.getAttribute('data-value');
            if (starValue <= rating) {
                star.classList.remove('fa-regular');
                star.classList.add('fa-solid');
                star.style.color = '#f6d604';
            } else {
                star.classList.remove('fa-solid');
                star.classList.add('fa-regular');
                star.style.color = '#f6d604';
            }
        });
    }

		$(".plusBtn").click(
				function() {
					var quantityInput = $(this).closest(".input-group").find(
							".quantityInput");
					var quantity = parseInt(quantityInput.val());
					quantityInput.val(quantity + 1);
				});

		$(".minusBtn").click(
				function() {
					var quantityInput = $(this).closest(".input-group").find(
							".quantityInput");
					var quantity = parseInt(quantityInput.val());
					if (quantity > 1) {
						quantityInput.val(quantity - 1);
					}
				});

		$(".addToCartBtn").click(function(e) {
			e.preventDefault();
			var quantity = $("#quantityInput").val(); // Sử dụng id của input số lượng sách
			var url = $(this).attr("href") + "&quantity=" + quantity;
			window.location.href = url;
		});
	</script>

</body>
</html>

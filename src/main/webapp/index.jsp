<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book: Index</title>
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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body style="background-color: #f7f7f7; padding-top: 56px;">

<c:if test="${not empty addedCart && not empty param.bid}">
    <div id="toast">${addedCart}</div>
    <script type="text/javascript">
        $(document).ready(function() {
            showToast();
        });

        function showToast() {
            $('#toast').addClass("display");
            $('#toast').html("${addedCart}");
            setTimeout(() => {
                $("#toast").removeClass("display");
            }, 2000);
        }
    </script>
</c:if>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="components/navbar.jsp"%>
	<div class="container">
		<div id="carouselExampleControls" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="book/thien.png" alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="book/tri_tue_cam_xuc.png"
						alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="book/nao_bo.png" alt="Third slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleControls"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleControls"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<div class="container mt-3">
		<img src="book/hom_nay_doc_gi.jpg" style="width: 100%; height: auto">
	</div>


	<%
	Connection conn = DBConnect.getConn();
	%>


	<div class="container mt-3">
		<div class="row">
			<%
			String[] categories = { "Truyện thiếu nhi", "Công nghệ thông tin", "Văn học kinh điển", "Tiểu thuyết", "Kĩ năng sống" };
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			for (String category : categories) {
				List<BookDtls> list = dao.getBooksByCategory(category);
			%>
			<div class="container">
				<div class="font-weight-bold">
					<a href="all_<%=category%>_book.jsp" class="text-dark"
						style="font-size: 28px;"><%=category%></a>
				</div>
				<div class="row">
					<%
					for (BookDtls b : list) {
					%>
					<div class="col-md-2">
						<div class="card crd-ho" style="height: 100%;">
							<img alt="" src="book/<%=b.getPhoto()%>"
								style="width: 158px; height: 218px" class="img-thumblin">
							<div class="card-body" style="text-align: center;">
								<a href="view_books.jsp?bid=<%=b.getBookId()%>"
									style="font-size: 14px; color: #333; font-weight: bold; text-decoration: none;"><%=b.getBookName()%></a>
								<p class="card-text mt-2" style="font-size: 12px;"><%=b.getAuthor()%></p>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
			<hr>
			<%
			}
			%>
		</div>
	</div>



	<%@include file="components/footer.jsp"%>
</body>
</html>
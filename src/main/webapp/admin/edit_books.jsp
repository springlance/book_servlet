<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Update Book</title>
<%@include file="Css.jsp"%>
<style>
body {
	font-family: Helvetica, Arial, sans-serif;
}
</style>
</head>
<body style="background: #f0f1f2;">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row mt-4">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-danger">Update Books</h3>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDtls b = dao.getBookById(id);
						%>

						<form action="../editbooks" method="post">

							<input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="row">
								<div class="col-md-8">
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="inputBook">Title</label> <input type="text"
												class="form-control" id="inputBook" name="bname"
												value="<%=b.getBookName()%>">
										</div>
										<div class="form-group col-md-6">
											<label for="inputAuthor">Author</label> <input type="text"
												class="form-control" id="inputAuthor" name="author"
												value="<%=b.getAuthor()%>">
										</div>
									</div>
									<div class="form-group">
										<label for="inputDescription">Description</label>
										<textarea class="form-control" id="inputDescription"
											name="description" style="height: 180px; text-align: left;"><%=b.getDescription()%>
										</textarea>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="inputRelease">Release Date</label> <input
												type="date" class="form-control" id="inputRelease"
												name="release" value="<%=b.getReleaseDate()%>">
										</div>
										<div class="form-group col-md-6">
											<label for="inputPage">Number of Pages</label> <input
												type="number" class="form-control" id="inputPage"
												name="bpage" value="<%=b.getPageNumber()%>">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="inputCategory">Categories</label> <select
												id="inputCategory" name="category" class="form-control">
												<%
												if ("Công nghệ thông tin".equals(b.getCategory())) {
												%>
												<option value="Công nghệ thông tin">Công nghệ thông
													tin</option>
												<option value="Truyện thiếu nhi">Truyện thiếu nhi</option>
												<option value="Tiểu thuyết">Tiểu thuyết</option>
												<option value="Kĩ năng sống">Kĩ năng sống</option>
												<option value="Văn học kinh điển">Văn học kinh điển</option>
												<%
												} else if ("Truyện thiếu nhi".equals(b.getCategory())) {
												%>
												<option value="Truyện thiếu nhi">Truyện thiếu nhi</option>
												<option value="Tiểu thuyết">Tiểu thuyết</option>
												<option value="Kĩ năng sống">Kĩ năng sống</option>
												<option value="Công nghệ thông tin">Công nghệ thông
													tin</option>
												<option value="Văn học kinh điển">Văn học kinh điển</option>
												<%
												} else if ("Tiểu thuyết".equals(b.getCategory())) {
												%>
												<option value="Tiểu thuyết">Tiểu thuyết</option>
												<option value="Truyện thiếu nhi">Truyện thiếu nhi</option>
												<option value="Kĩ năng sống">Kĩ năng sống</option>
												<option value="Công nghệ thông tin">Công nghệ thông
													tin</option>
												<option value="Văn học kinh điển">Văn học kinh điển</option>
												<%
												} else if ("Kĩ năng sống".equals(b.getCategory())) {
												%>
												<option value="Kĩ năng sống">Kĩ năng sống</option>
												<option value="Truyện thiếu nhi">Truyện thiếu nhi</option>
												<option value="Công nghệ thông tin">Công nghệ thông
													tin</option>
												<option value="Văn học kinh điển">Văn học kinh điển</option>
												<option value="Tiểu thuyết">Tiểu thuyết</option>
												<%
												} else {
												%>
												<option value="Văn học kinh điển">Văn học kinh điển</option>
												<option value="Truyện thiếu nhi">Truyện thiếu nhi</option>
												<option value="Kĩ năng sống">Kĩ năng sống</option>
												<option value="Tiểu thuyết">Tiểu thuyết</option>
												<option value="Công nghệ thông tin">Công nghệ thông
													tin</option>
												<%
												}
												%>
											</select>
										</div>
										<div class="form-group col-md-6">
											<label for="inputPrice">Price</label> <input type="text"
												class="form-control" id="inputPrice" name="bprice"
												value="<%=b.getPrice()%>">
										</div>
									</div>
								</div>
							<div class="col-md-4">
									<div class="form-group">
										<h5 class="text-center">Book Cover</h5>
										<div id="imageContainer">
											<img src="../book/<%=b.getPhoto() %>" style="max-width: 100%">
										</div>
									</div>
								</div>
							<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>


						<script>
							function displayImage(event) {
								var imageContainer = document
										.getElementById("imageContainer");
								imageContainer.innerHTML = ""; // Xóa nội dung hiện tại của imageContainer (nếu có)

								var file = event.target.files[0];
								var reader = new FileReader();

								reader.onload = function(event) {
									var img = document.createElement("img");
									img.src = event.target.result;
									img.style.maxWidth = "80%";

									imageContainer.appendChild(img);
								};

								reader.readAsDataURL(file);
							}
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


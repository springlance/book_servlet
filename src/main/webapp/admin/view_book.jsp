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
<title>Admin: View Book</title>
<%@include file="Css.jsp"%>
</head>
<body style="background: #f0f1f2;">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row mt-4">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Book Detail</h4>

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
											<label for="inputEmail4">Title</label> <input type="text"
												class="form-control" id="inputEmail4" name="bname"
												value="<%=b.getBookName()%>" disabled>
										</div>
										<div class="form-group col-md-6">
											<label for="inputPassword4">Author</label> <input type="text"
												class="form-control" id="inputPassword4" name="author"
												value="<%=b.getAuthor()%>" disabled>
										</div>
									</div>
									<div class="form-group">
										<label for="inputAddress">Description</label>
										<textarea class="form-control" id="inputAddress"
											name="description" style="height: 180px; text-align: left;"
											disabled><%=b.getDescription()%></textarea>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="inputRelease">Release Date</label> <input
												type="date" class="form-control" id="inputRelease"
												name="release" value="<%=b.getReleaseDate()%>" disabled>
										</div>
										<div class="form-group col-md-6">
											<label for="inputPage">Number of Pages</label> <input
												type="number" class="form-control" id="inputPage"
												name="bpage" value="<%=b.getPageNumber()%>" disabled>
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="inputState">Categories</label> <select
												id="inputState" name="category" class="form-control"
												disabled>
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
												value=<%=b.getPrice()%> disabled>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleFormControlFile1">Upload Photo</label> <input
											type="file" class="form-control-file" name="bimg"
											id="exampleFormControlFile1" onchange="displayImage(event)"
											style="margin-bottom: 10px" disabled>

										<div id="imageContainer">
											<img src="../book/<%=b.getPhoto()%>" style="max-width: 86%">
										</div>
									</div>
								</div>
							</div>
								<button type="button" class="btn btn-primary btn-edit float-right mt-3 mr-5"
									onclick="enableEdit()">Edit</button>
								<button type="submit" class="btn btn-primary btn-save float-right mt-3 mr-5"
									style="display: none;">Save</button>
							</div>
					</div>
					</form>

					<script>
						
						function enableEdit() {
					        var inputs = document.getElementsByTagName("input");
					        for (var i = 0; i < inputs.length; i++) {
					            inputs[i].disabled = false;
					        }

					        var selects = document.getElementsByTagName("select");
					        for (var i = 0; i < selects.length; i++) {
					            selects[i].disabled = false;
					        }

					        document.getElementsByTagName("textarea")[0].disabled = false;

					        document.getElementsByClassName("btn-edit")[0].style.display = "none";
					        document.getElementsByClassName("btn-save")[0].style.display = "block";
					        document.getElementById("imageContainer").style.display = "block";
					        document.getElementById("exampleFormControlFile1").style.display = "block";
					    }
					</script>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>

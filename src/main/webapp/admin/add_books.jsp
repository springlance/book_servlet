<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin: Add Book</title>
    <%@include file="Css.jsp" %>
    <style>
        body {
            font-family: Helvetica, Arial, sans-serif;
        }
    </style>
</head>
<body style="background: #f0f1f2;">
<%@include file="navbar.jsp" %>
<div class="container">
    <div class="row mt-4">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Add Books</h4>
                    <form action="../add_books" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Title</label>
                                        <input type="text" class="form-control" id="inputEmail4" name="bname">
                                        <small id="titleError" class="text-danger"></small>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Author</label>
                                        <input type="text" class="form-control" id="inputPassword4" name="author">
                                        <small id="authorError" class="text-danger"></small>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputDescription">Description</label>
                                    <textarea class="form-control" id="inputDescription" name="description"
                                              style="height: 180px; text-align: left;"></textarea>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputRelease">Release Date</label>
                                        <input type="date" class="form-control" id="inputRelease" name="release">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPage">Number of Pages</label>
                                        <input type="number" class="form-control" id="inputPage" name="bpage">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputCategory">Categories</label>
                                        <select id="inputCategory" name="category" class="form-control">
                                            <option selected>--Select--</option>
                                            <option value="Công nghệ thông tin">Công nghệ thông tin</option>
                                            <option value="Tiểu thuyết">Tiểu thuyết</option>
                                            <option value="Kĩ năng sống">Kĩ năng sống</option>
                                            <option value="Văn học kinh điển">Văn học kinh điển</option>
                                            <option value="Truyện thiếu nhi">Truyện thiếu nhi</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPrice">Price</label>
                                        <input type="text" class="form-control" id="inputPrice" name="bprice">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Upload Photo</label>
                                    <input type="file" class="form-control-file" name="bimg" id="exampleFormControlFile1"
                                           onchange="displayImage(event)" style="margin-bottom: 10px">
                                    <div id="imageContainer"></div>
                                </div>
                            </div>
                            </div>
								<button type="submit" class="btn btn-primary float-right mt-3 mr-5" onclick="confirmAddBook()">Add</button>
							</div>
                        </div>
                    </form>

                    <script>
                        function validateForm() {
                            var titleInput = document.getElementById("inputEmail4");
                            var authorInput = document.getElementById("inputPassword4");
                            var titleError = document.getElementById("titleError");
                            var authorError = document.getElementById("authorError");
                            var isFormValid = true;

                            // Clear previous error messages
                            titleError.innerHTML = "";
                            authorError.innerHTML = "";

                            // Check if title and author are empty
                            if (titleInput.value.trim() === "") {
                                titleError.innerHTML = "Title is required";
                                isFormValid = false;
                            }

                            if (authorInput.value.trim() === "") {
                                authorError.innerHTML = "Author is required";
                                isFormValid = false;
                            }
                            return isFormValid;
                        }
                        
                        function displayImage(event) {
							var imageContainer = document
									.getElementById("imageContainer");
							imageContainer.innerHTML = ""; // Xóa nội dung hiện tại của imageContainer (nếu có)

							var file = event.target.files[0];
							var reader = new FileReader();

							reader.onload = function(event) {
								var img = document.createElement("img");
								img.src = event.target.result;
								img.style.maxWidth = "86%";

								imageContainer.appendChild(img);
							};

							reader.readAsDataURL(file);
						}
                        
                        function confirmAddBook() {
                            if (confirm("Bạn có chắc chắn muốn thêm sách?")) {
                                return true;
                            } else {
                                return false;
                            }
                        }
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

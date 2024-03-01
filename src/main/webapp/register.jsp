<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book: Register</title>
<%@include file="components/Css.jsp"%>
</head>
<body
	style="background-color: #f0f1f2; display: flex; justify-content: center; align-items: center; height: 100vh;">
	<%@include file="components/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration Form</h4>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="register" method="post">
							<div class="form-group">
								<label for="inputName">Name</label> <input type="text"
									class="form-control" id="inputName"
									aria-describedby="emailHelp" required="required" name="fname">
							</div>
							<div class="form-group">
								<label for="inputEmail">Email address</label> <input
									type="email" class="form-control" id=""inputEmail""
									aria-describedby="emailHelp" required="required" name="email">
							</div>
							<div class="form-group">
								<label for="inputPhone">Phone</label> <input
									type="number" class="form-control" id="inputPhone"
									aria-describedby="emailHelp" required="required" name="phone">
							</div>
							<div class="form-group">
								<label for="inputPassword">Password</label> <input
									type="password" class="form-control" id="inputPassword"
									required="required" name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree Terms & Condition</label>
							</div>
							<button type="submit" class="btn btn-primary mt-2">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
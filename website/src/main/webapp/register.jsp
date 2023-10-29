<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<link rel="stylesheet" href="css/mystyle.css">
</head>
<body>
	<%@include file="component/common_css_js.jsp"%>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fluid register_color ">
		<div class="row mt-2 ">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<%@include file="component/message.jsp"%>
					<h3 class="text-center my-3">
						<img src="images/signup.jpg" width="100" height="auto"><br>
						Sign up here !!
					</h3>
					<form action="RegisterServlet" method="post">

						<div class="form-group">
							<label for="name">User Name</label> <input name="user_name"
								type="text" class="form-control" id="name"
								placeholder="Enter here" aria-describedby="emailHelp">
						</div>

						<div class="form-group">
							<label for="email">User Email</label> <input name="user_email"
								type="email" class="form-control" id="email"
								placeholder="Enter here" aria-describedby="emailHelp">
						</div>
						<div class="form-group">
							<label for="password">User password</label> <input
								name="user_password" type="password" class="form-control"
								id="password" placeholder="Enter here"
								aria-describedby="emailHelp">
						</div>
						<div class="form-group">
							<label for="phone">User phone</label> <input name="user_phone"
								type="number" class="form-control" id="phone"
								placeholder="Enter here" aria-describedby="emailHelp">
						</div>
						<div class="form-group">
							<label for="phone">User Address</label>
							<textarea name="user_address" style="height: 200px;"
								class="form-control" placeholder="Enter your address"></textarea>
						</div>
						<div class="container text-center">
							<button class="btn btn-outline-success">Register</button>
							<button type="reset" class="btn btn-outline-warning">Reset</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
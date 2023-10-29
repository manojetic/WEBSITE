<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Login - Online</title>
<%@include file="component/common_css_js.jsp"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<link rel="stylesheet" href="css/mystyle.css">
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container ">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">

					<div class="text-center card-header">
						<img src="images/login.jpg" width="100" height="auto" />
						<h3>Login Here</h3>
					</div>

					<div class="card-body">
						<%@include file="component/message.jsp"%>
						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>
							<a href="register.jsp" class="text-center d-block mb-2"> if
								not registered click here </a>
							<div class="container text-center">

								<button type="submit"
									class="btn btn-primary border-0 custom-bg ">Submit</button>
								<button type="reset" class="btn btn-primary custom-bg border-0 ">Reset</button>
							</div>

						</form>

					</div>

				</div>

			</div>
		</div>
	</div>

</body>
</html>
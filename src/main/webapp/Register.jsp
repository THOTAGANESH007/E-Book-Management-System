<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook: Register</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration Page</h4>

						<%
						// Get SuccessMsg and FailedMsg from session
						String successMsg = (String) session.getAttribute("SuccessMsg");
						String failedMsg = (String) session.getAttribute("FailedMsg");

						// Check if success message is present
						if (successMsg != null && !successMsg.isEmpty()) {
						%>
						<p class="text-center text-success"><%=successMsg%></p>
						<%
						// Remove the message from session after displaying
						session.removeAttribute("SuccessMsg");
						}
						%>

						<%
						// Check if failure message is present
						if (failedMsg != null && !failedMsg.isEmpty()) {
						%>
						<p class="text-center text-danger"><%=failedMsg%></p>
						<%
						// Remove the message from session after displaying
						session.removeAttribute("FailedMsg");
						}
						%>

						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleUserName">User Name</label> <input
									type="text" class="form-control" id="exampleUserName"
									aria-describedby="userHelp" placeholder="Enter Your Full Name"
									required="required" name="uname">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									required="required" name="email">
							</div>

							<div class="form-group">
								<label for="examplePhoneNo">Phone Number</label> <input
									type="number" class="form-control" id="examplePhoneNumber"
									aria-describedby="phoneHelp" placeholder="Enter Phone Number"
									required="required" name="phno">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="password">
							</div>

							<button type="submit" class="btn btn-primary">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 130px;">
		<%@include file="all_component/footer.jsp"%></div>
</body>
</html>

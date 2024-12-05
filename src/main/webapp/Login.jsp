<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook: Login</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-2">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Login Page</h4>

						<%
						// Get failedMsg from session

						String failedMsg = (String) session.getAttribute("failedMsg");
						if (failedMsg != null && !failedMsg.isEmpty()) {
						%>
						<p class="text-center text-danger"><%=failedMsg%></p>
						<%
						// Remove the message from session after displaying
						session.removeAttribute("failedMsg");
						}
						%>


						<%
						// Get failedMsg from session

						String SuccessMsg = (String) session.getAttribute("SuccessMsg");
						if (SuccessMsg != null && !SuccessMsg.isEmpty()) {
						%>
						<p class="text-center text-success"><%=SuccessMsg%></p>
						<%
						// Remove the message from session after displaying
						session.removeAttribute("SuccessMsg");
						}
						%>
						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="password">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<br> <a href="Register.jsp">Create Account</a>
							</div>
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
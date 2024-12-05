<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Edit Profile</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.anchor-ho {
	text-decoration: none;
	color: black;
}

.anchor-ho :hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userObj");
	if (u != null) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary">Edit Profile</h4>

						<%
						// Get SuccessMsg and FailedMsg from session
						String successMsg = (String) session.getAttribute("UpdatedMsg");
						String failedMsg = (String) session.getAttribute("FailedMsg");

						// Check if success message is present
						if (successMsg != null && !successMsg.isEmpty()) {
						%>
						<div class="alert alert-success text-center">
							<%=successMsg%>
						</div>
						<%
						// Remove the message from session after displaying
						session.removeAttribute("UpdatedMsg");
						}
						%>

						<%
						// Check if failure message is present
						if (failedMsg != null && !failedMsg.isEmpty()) {
						%>
						<div class="alert alert-danger text-center">
							<%=failedMsg%>
						</div>
						<%
						// Remove the message from session after displaying
						session.removeAttribute("FailedMsg");
						}
						%>
						<form action="updateProfile" method="post">
							<input type="hidden" value="<%=u.getId()%>" name="uid">
							<div class="form-group">
								<label for="exampleUserName">User Name</label> <input
									type="text" class="form-control" id="exampleUserName"
									aria-describedby="userHelp" value="<%=u.getName()%>"
									required="required" name="uname">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=u.getEmail()%>"
									required="required" name="email">
							</div>

							<div class="form-group">
								<label for="examplePhoneNo">Phone Number</label> <input
									type="number" class="form-control" id="examplePhoneNumber"
									aria-describedby="phoneHelp" value="<%=u.getPhno()%>"
									required="required" name="phno">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									value="<%=u.getPassword()%>" required="required"
									name="password">
							</div>

							<button type="submit" class="btn btn-primary">Update</button>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	} else {
	response.sendRedirect("Login.jsp");
	}
	%>
	<div style="margin-top: 130px;">
		<%@include file="all_component/footer.jsp"%></div>
</body>
</html>
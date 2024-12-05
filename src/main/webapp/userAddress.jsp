<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Edit Address</title>
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
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Update Address</h4>
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
						<form action="updateAddress" method="post">
							<input type="hidden" value="<%=u.getEmail()%>" name="email">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4"
										placeholder="Password" name="address">
								</div>



								<div class="form-group col-md-6">
									<label for="inputEmail4">LandMark</label> <input type="text"
										class="form-control" id="inputEmail4" name="landmark">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4" name="city">
								</div>





								<div class="form-group col-md-4">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" name="city">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">Zip</label> <input type="text"
										class="form-control" id="inputPassword4"
										placeholder="Password" name="city">
								</div>
							</div>




							<div class="text-center">
								<button type="submit" class="btn btn-warning">Update
									Address</button>

							</div>
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
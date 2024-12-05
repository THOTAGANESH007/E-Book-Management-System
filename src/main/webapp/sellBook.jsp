<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
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

	<%
	User u = (User) session.getAttribute("userObj");
	if (u != null){	
	%>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">


		<h3 class="text-center">
			Hello&nbsp;<%=u.getName()%></h3>


		<div class="row p-3">
			<div class="col-md-3 offset-md-4">
				<div class="card crd-ho" style="width: 18rem;">
					<div class="card-body">
						<h4 class="text-center">Sell Old Books</h4>


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


						<form action="addOldBook" method="post"
							enctype="multipart/form-data">
							<input type="hidden" value="<%=u.getEmail()%>" name="userEmail">
							<div class="form-group">
								<label for="exampleFormControlInput1">Book Name*</label> <input
									type="text" class="form-control" id="exampleFormControlInput1"
									placeholder="Name of the Book" name="bname" required="required">
							</div>

							<div class="form-group">
								<label for="exampleFormControlInput1">Author Name*</label> <input
									type="text" class="form-control" id="exampleFormControlInput1"
									placeholder="Name of the Author" name="author"
									required="required">
							</div>

							<div class="form-group">
								<label for="exampleFormControlInput1">Price*</label> <input
									type="number" class="form-control"
									id="exampleFormControlInput1" placeholder="Price of the Book"
									name="price" required="required">
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									type="file" class="form-control-file"
									id="exampleFormControlFile1" name="bimg">
							</div>
							<button type="submit" class="btn btn-primary">Sell</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 130px;">
		<%@include file="all_component/footer.jsp"%></div>
	<%}else{
		response.sendRedirect("Login.jsp");
	} %>
</body>
</html>
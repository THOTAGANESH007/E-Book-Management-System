<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="navbar.jsp"%>
	<%
	if (userObj != null) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Books</h4>
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

						<form action="../addBooks" method="post"
							enctype="multipart/form-data">
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
								<label for="exampleFormControlSelect1">Book Categories</label> <select
									class="form-control" id="exampleFormControlSelect1"
									name="categories">
									<option selected>--select--</option>
									<option value="New">New Book</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlSelect2">Book Status</label> <select
									class="form-control" id="exampleFormControlSelect2"
									name="status">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="InActive">InActive</option>

								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									type="file" class="form-control-file"
									id="exampleFormControlFile1" name="bimg">
							</div>
							<button type="submit" class="btn btn-primary">Add</button>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 40px;">
		<%@include file="footer.jsp"%></div>
	<%
	} else {
	response.sendRedirect("../Login.jsp");
	}
	%>
</body>
</html>
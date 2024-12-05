<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Settings</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.anchor-ho {
	text-decoration: none;
	color: black;
}

.anchor-ho:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userObj");
	if (u != null){
		
	%>
	<div class="container">

		<h3 class="text-center">
			Hello&nbsp;
			<%=u.getName()%></h3>

		<div class="row p-5">
			<div class="col-md-4">
				<a href="sellBook.jsp" class="anchor-ho">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"></i>
							</div>

							<h3>Sell Old Book</h3>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-4">
				<a href="oldBook.jsp" class="anchor-ho">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"></i>
							</div>

							<h3>Old Book</h3>
						</div>
					</div>
				</a>
			</div>



			<div class="col-md-4">
				<a href="editProfile.jsp" class="anchor-ho">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-edit fa-3x"></i>
							</div>

							<h4>Edit Profile</h4>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-4 mt-3">
				<a href="userAddress.jsp" class="anchor-ho">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fas fa-map-marker-alt fa-3x"></i>
							</div>

							<h4>Your Address</h4>
							<p>Edit Address</p>
						</div>
					</div>
				</a>
			</div>



			<div class="col-md-4 mt-3">
				<a href="order.jsp" class="anchor-ho">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fas fa-box-open fa-3x"></i>
							</div>

							<h4>My Order</h4>
							<p>Track Your Order</p>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-4 mt-3">
				<a href="helpCenter.jsp" class="anchor-ho">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-user-circle fa-3x"></i>
							</div>

							<h4>Help Center</h4>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
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
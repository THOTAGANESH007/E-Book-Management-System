<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container text-center mt-3">
		<div class="card">
			<div class="card-body">
				<i class="fas fa-check-circle fa-5x text-success"></i>
				<h1>Thank You</h1>
				<h2>Your Order Successful!!!</h2>
				<h5>With in 7 Days Your Product will be Delivered In your
					Address</h5>
				<a href="index.jsp" class="btn btn-primary mt-3">Home</a> <a
					href="order.jsp" class="btn btn-danger mt-3">View Order</a>

			</div>
		</div>

	</div>
	<div style="margin-top: 130px;">
		<%@include file="all_component/footer.jsp"%></div>
</body>
</html>
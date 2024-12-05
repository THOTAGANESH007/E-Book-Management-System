<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.container a {
    text-decoration: none;
    color: black;
}

.container a:hover {
    text-decoration: none;
    
}

.card {
    border: 1px solid #ddd;
    transition: background-color 0.3s ease, border 0.3s ease;
}

.card:hover {
    background-color: white;
    border-color: white;
}

.card-body:hover {
    background-color: #f7f7f7;
}

</style>
<%@include file="allCss.jsp"%>
<title>EBook: Admin</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
	if (userObj == null) {
		response.sendRedirect("../Login.jsp");
	}
	%>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-4">
				<a href="addBooks.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-plus-square fa-3x text-primary"></i><br>
							<h4>Add Books</h4>
							&nbsp;
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="allBooks.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-book-open fa-3x text-danger"></i><br>
							<h4>All Books</h4>
							&nbsp;
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-box-open fa-3x text-warning"></i><br>
							<h4>Orders</h4>
							&nbsp;
						</div>
					</div>
				</a>
			</div>

		</div>
	</div>


	<div style="margin-top: 230px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>

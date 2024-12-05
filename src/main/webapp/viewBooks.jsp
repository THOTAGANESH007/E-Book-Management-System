<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Book Details</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<%
	User u = (User) session.getAttribute("userObj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDaoImpl bdao2 = new BookDaoImpl(DBConnect.getConn());
	BookDetails b = bdao2.getBookById(bid);
	%>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="books/<%=b.getPhoto()%>"
					style="width: 170px; height: 200px;"><br>
				<h4 class="mt-3">
					BookName:<span class="text-success"><%=b.getBookname()%></span>
				</h4>
				<h4>
					Author Name:<span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category:<span class="text-success"><%=b.getBookCategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookname()%></h2>


				<%
				if (b.getBookCategory().equals("Old")) {
				%>
				<h5 class="text-primary">Contact to Seller</h5>
				<h5 class="text-primary">
					<i class="fas fa-envelope"></i> Email:<%=b.getEmail()%></h5>
				<%
				}
				%>
				<div class="row">
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fas fa-money-bill-wave fa-3x"></i>
						<p>Cash on Delivery</p>
					</div>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fas fa-undo-alt fa-3x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fas fa-truck fa-3x"></i>
						<p>Free Shipping</p>
					</div>
				</div>


				<%
				if (b.getBookCategory().equals("Old")) {
				%>

				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i
						class="fas fa-shopping-cart"></i> Continue Shopping</a> <a href=""
						class="btn btn-danger"><i class="fas fa-rupee-sign"></i> 700</a>
				</div>
				<%
				} else {
				%>
				<div class="text-center p-3">
					<%
					if (u != null) {
					%>
					<a href="cartServlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
						class="btn btn-primary"><i class="fas fa-cart-plus"></i> Add
						to cart</a> <a href="" class="btn btn-danger"><i
						class="fas fa-rupee-sign"></i> 700</a>
					<%
					} else {
					%>

					<a href="Login.jsp" class="btn btn-primary"><i
						class="fas fa-cart-plus"></i> Add to cart</a> <a href=""
						class="btn btn-danger"><i class="fas fa-rupee-sign"></i> 700</a>
					<%
					}
					%>
				</div>

				<%
				}
				%>

			</div>
		</div>
	</div>

	<div style="margin-top: 130px;">
		<%@include file="all_component/footer.jsp"%></div>
</body>
</html>
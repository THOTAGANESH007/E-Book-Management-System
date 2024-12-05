<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.DAO.*"%>
<%@page import="com.DB.*"%>
<%@page import="com.entity.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.crd-ho:hover {
        background-color: #f0f7f7;
    }
    .card {
        width: 100%; /* Ensure cards take full width */
        min-height: 300px; /* Set a minimum height */
        margin: 15px; /* Adjust margin to create uniform spacing */
    }
    .card-body {
        padding: 20px; /* Adjust padding for consistent inner spacing */
    }
    .card-title, .card-text {
        overflow: hidden;
        white-space: nowrap; /* Prevent text wrapping */
        text-overflow: ellipsis; /* Add ellipsis for overflow text */
    }
    .card-img-top {
        width: 100%; /* Make images responsive */
        height: 400px; /* Set a fixed height */
        object-fit: cover; /* Ensure the image covers the area without stretching */
    }
</style>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>
	<%@include file="all_component/carousel.jsp"%>
	<%
	User u = (User) session.getAttribute("userObj");
	%>
	<!-- Start Recent Book -->
	<div class="container-fluid">
		<h3 align="center">Recent Books</h3>
		<div class="row">

			<%
			BookDaoImpl bdao2 = new BookDaoImpl(DBConnect.getConn());
			List<BookDetails> book2 = bdao2.getRecentBooks();
			for (BookDetails b : book2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho" style="width: 18rem;">
					<img class="card-img-top" src="books/<%=b.getPhoto()%>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title text-center"><%=b.getBookname()%></h5>
						<p class="card-text text-center">
							Author:<%=b.getAuthor()%></p>
						<p class="card-text text-center">
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Category:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="viewBooks.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href="#"
								class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						Category:<%=b.getBookCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="Login.jsp" class="btn btn-danger btn-sm ml-2">Add to
								Cart</a>

							<%
							} else {
							%>
							<a href="cartServlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2">Add to Cart</a>
							<%
							}
							%>
							<a href="viewBooks.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href="#"
								class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>



		</div>
	</div>
	
	
	<div class="text-center mt-1">
		<a href="allRecentBooks.jsp" class="btn btn-danger btn-sm text-white">View
			All</a>
	</div>

	<!-- End Recent Book -->
	<hr>




	<!-- Start New Book -->
	<div class="container-fluid">
		<h3 align="center">New Books</h3>
		<div class="row">
			<%
			BookDaoImpl bdao = new BookDaoImpl(DBConnect.getConn());
			List<BookDetails> book = bdao.getNewBooks();
			for (BookDetails b : book) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho" style="width: 18rem;">
					<img class="card-img-top" src="books/<%=b.getPhoto()%>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title text-center"><%=b.getBookname()%></h5>
						<p class="card-text text-center">
							Author:<%=b.getAuthor()%></p>
						<p class="card-text text-center">
							Category:<%=b.getBookCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="Login.jsp" class="btn btn-danger btn-sm ml-2">Add to
								Cart</a>

							<%
							} else {
							%>
							<a href="cartServlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2">Add to Cart</a>

							<%
							}
							%>
							<a href="viewBooks.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href="#"
								class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>



		</div>
	</div>


	<div class="text-center mt-1">
		<a href="allNewBooks.jsp" class="btn btn-danger btn-sm text-white">View
			All</a>
	</div>

	<!-- End New Book -->

	<hr>





	<!-- Start Old Book -->
	<div class="container-fluid">
		<h3 align="center">Old Books</h3>
		<div class="row">

			<%
			BookDaoImpl bdao3 = new BookDaoImpl(DBConnect.getConn());
			List<BookDetails> book3 = bdao3.getOldBooks();
			for (BookDetails b : book3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho" style="width: 18rem;">
					<img class="card-img-top" src="books/<%=b.getPhoto()%>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title text-center"><%=b.getBookname()%></h5>
						<p class="card-text text-center">
							Author:<%=b.getAuthor()%></p>
						<p class="card-text text-center">
							Category:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="viewBooks.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href="#"
								class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>
	</div>

	<div class="text-center mt-1">
		<a href="allOldBooks.jsp" class="btn btn-danger btn-sm text-white">View
			All</a>
	</div>

	<!-- End Old Book -->
	<hr>
	<div style="margin-top: 130px;">
		<%@include file="all_component/footer.jsp"%></div>
</body>
</html>
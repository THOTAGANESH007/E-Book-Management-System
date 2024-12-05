<%@page import="java.util.*"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaoImpl"%>
<%@page import="com.entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.crd-ho:hover {
	background-color: #f0f7f7;
}
</style>
<meta charset="UTF-8">
<title>Search</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>

	<%
	User u = (User) session.getAttribute("userObj");
	%>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">

			<%
			String search = request.getParameter("search");
			BookDaoImpl bdao2 = new BookDaoImpl(DBConnect.getConn());
			List<BookDetails> book2 = bdao2.getBookBySearch(search);
			for (BookDetails b : book2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2" style="width: 18rem;">
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
	<div style="margin-top: 130px;">
		<%@include file="all_component/footer.jsp"%></div>
</body>
</html>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%
	User u = (User) session.getAttribute("userObj");
	if (u != null) {
	%>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-1">
		<h5 class="text-center text-primary">Your Orders</h5>
		<table class="table table-hover mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				String email = u.getEmail();
				BookOrderDAOImpl bdao = new BookOrderDAOImpl(DBConnect.getConn());
				List<BookOrder> blist = bdao.getBook(email);
				for (BookOrder b : blist) {
				%>
				<tr>
					<td><%=b.getOid()%></td>
					<td><%=b.getUname()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>


	</div>

	<div style="margin-top: 130px;">
		<%@include file="all_component/footer.jsp"%></div>

	<%
	} else {
	response.sendRedirect("Login.jsp");
	}
	%>
</body>
</html>
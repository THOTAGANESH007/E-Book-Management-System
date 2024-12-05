<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="navbar.jsp"%>
	<%
	if (userObj != null) {
	%>
	<h3 class="text-center">
		Hello
		<%=userObj.getName()%></h3>
	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Ph No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment</th>
			</tr>
		</thead>
		<tbody>
			<%
			BookOrderDAOImpl bdao = new BookOrderDAOImpl(DBConnect.getConn());
			List<BookOrder> blist = bdao.getAllOrders();
			for (BookOrder b : blist) {
			%>
			<tr>
				<td><%=b.getOid()%></td>
				<td><%=b.getUname()%></td>
				<td><%=b.getEmail()%></td>
				<td><%=b.getFullAddress()%></td>
				<td><%=b.getPhno()%></td>
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
	<div style="margin-top: 130px;">
		<%@include file="footer.jsp"%></div>
	<%
	} else {
	response.sendRedirect("../Login.jsp");
	}
	%>
</body>
</html>
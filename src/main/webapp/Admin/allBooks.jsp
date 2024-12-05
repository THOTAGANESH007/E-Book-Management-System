<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.DAO.*"%>
<%@page import="com.DB.*"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="navbar.jsp"%>
	<%
	if (userObj != null) {
	%>
	<h3 class="text-center">Hello <%=userObj.getName()%></h3>

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
	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			BookDaoImpl bdao = new BookDaoImpl(DBConnect.getConn());
			List<BookDetails> list = bdao.getAllBooks();
			for (BookDetails det : list) {
			%>


			<tr>
				<td><%=det.getBookId()%></td>
				<td><img src="../books/<%=det.getPhoto()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=det.getBookname()%></td>
				<td><%=det.getAuthor()%></td>
				<td><%=det.getPrice()%></td>
				<td><%=det.getBookCategory()%></td>
				<td><%=det.getStatus()%></td>
				<td><a href="editBooks.jsp?id=<%=det.getBookId()%>"
					class="btn btn-sm btn-primary"><i class="fas fa-edit"></i> Edit</a>
					<a href="../delete?id=<%=det.getBookId()%>"
					class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i>
						Delete</a></td>
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
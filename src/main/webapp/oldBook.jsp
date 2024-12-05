<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Old Book :Setting</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<%
	// Get SuccessMsg and FailedMsg from session
	String successMsg = (String) session.getAttribute("oldBookDeleted");
	String failedMsg = (String) session.getAttribute("failedToDelete");

	// Check if success message is present
	if (successMsg != null && !successMsg.isEmpty()) {
	%>
	<div class="alert alert-success text-center">
		<%=successMsg%>
	</div>
	<%
	// Remove the message from session after displaying
	session.removeAttribute("oldBookDeleted");
	}
	%>

	<%
	// Check if failure message is present
	if (failedMsg != null && !failedMsg.isEmpty()) {
	%>
	<div class="alert alert-danger text-center">
		<%=failedMsg%>
	</div>
	<%
	// Remove the message from session after displaying
	session.removeAttribute("failedToDelete");
	}
	%>
	<div class="container p-5">
		<table class="table table-hover">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userObj");
				String email = u.getEmail();

				BookDaoImpl bdao = new BookDaoImpl(DBConnect.getConn());
				List<BookDetails> list = bdao.getBookByOld(email, "Old");
				for (BookDetails b : list) {
				%>
				<tr>
					<td><%=b.getBookname()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><a
						href="deleteOldBook?email=<%=email%>&&bid=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				<%
				}
				%>


			</tbody>
		</table>
	</div>
	<div style="margin-top: 130px;">
		<%@include file="all_component/footer.jsp"%></div>
</body>
</html>
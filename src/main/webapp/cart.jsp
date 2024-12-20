<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
.crd-ho:hover {
	background-color: #f0f7f7;
}

/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

}
#toast.toast-success {
	background-color: #28a745; /* Green for success */
}

#toast.toast-failure {
	background-color: #dc3545; /* Red for failure */
}

/* toast */
</style>


<meta charset="UTF-8">
<title>Cart Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userObj");
	%>
	<%
	if (u != null) {
		// Get SuccessMsg and FailedMsg from session
		String successMsg = (String) session.getAttribute("addToCart");
		String failedMsg = (String) session.getAttribute("failedToAdd");

		// Check if success message is present
		if (successMsg != null && !successMsg.isEmpty()) {
	%>
	<div id="toast" class="toast-success"><%=successMsg%></div>

	<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
	<%
	// Remove the message from session after displaying
	session.removeAttribute("addToCart");
	}
	%>

	<%
	// Check if failure message is present
	if (failedMsg != null && !failedMsg.isEmpty()) {
	%>
	<div id="toast" class="toast-failure"><%=failedMsg%></div>

	<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
	<%
	// Remove the message from session after displaying
	session.removeAttribute("failedToAdd");
	}
	%>


	<div class="container">
		<div class="row p-4">
			<div class="col-md-6">

				<div class="card bg-white">
					<div class="card-body">
						<h2 class="text-center text-success">Your Selected Items:</h2>
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								CartDAOImpl imp = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = imp.getBookByUser(u.getId());
								double totalPrice = 0;

								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>

								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="removeBook?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
								}
								%>

								<tr>
									<td colspan="2"><h3 class="text-center">Total Price:</h3></td>
									<td><h3 class="text-center"><%=totalPrice%></h3></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>


			<div class="col-md-6">

				<div class="card bg-white">
					<div class="card-body">
						<h2 class="text-center text-success">Fill The Order Details:</h2>


						<form action="order" method="post">
							<input type="hidden" value="<%=u.getId()%>" name="uid">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										name="uname" class="form-control" id="inputEmail4"
										value="<%=u.getName()%>" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" id="inputPassword4"
										value="<%=u.getEmail()%>" name="email" required="required">
								</div>
							</div>



							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input
										type="Number" class="form-control" id="inputEmail4"
										value="<%=u.getPhno()%>" name="phno" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4"
										placeholder="Password" name="address" required="required">
								</div>
							</div>



							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">LandMark</label> <input type="text"
										class="form-control" id="inputEmail4" name="landMark"
										required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4" name="city"
										required="required">
								</div>
							</div>



							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" name="state"
										required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Zip</label> <input type="text"
										class="form-control" id="inputPassword4"
										placeholder="Password" name="zip" required="required">
								</div>
							</div>


							<div class="form-group">
								<label for="inputState">Payment Mode</label> <select
									id="paymentType" class="form-control" name="paymentType"
									required>
									<option value="noselect">--select--</option>
									<option value="COD">Cash On Delivery</option>
								</select>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-warning" id="orderNowBtn">Order
									Now</button>
								<a href="index.jsp" class="btn btn-primary">Continue
									Shopping</a>
							</div>
						</form>

						

					</div>
				</div>

			</div>


		</div>
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
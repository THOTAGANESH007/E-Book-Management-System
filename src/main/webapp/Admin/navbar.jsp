<%@page import="com.entity.*"%>
<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<!-- Empty column for balance -->
		<div class="col-md-3"></div>

		<!-- Center the Ebooks heading -->
		<div class="col-md-6 text-center text-success">
			<h3>
				<i class="fas fa-book"></i> Ebooks
			</h3>
		</div>

		<!-- Username and logout button on the right -->
		<div class="col-md-3 text-right">
			<%
			User userObj = (User) session.getAttribute("userObj");
			if (userObj != null) {
			%>
			<a class="btn btn-success text-white"> <i class="fas fa-user-tie"></i>
				<%=userObj.getName()%>
			</a> <a data-toggle="modal" data-target="#logoutModal"
				class="btn btn-primary text-white"> <i
				class="fas fa-sign-in-alt"></i> Logout
			</a>
			<%
			} else {
			%>
			<a href="../Login.jsp" class="btn btn-success"> <i
				class="fas fa-sign-in-alt"></i> Login
			</a> <a href="../Register.jsp" class="btn btn-primary text-white"> <i
				class="fas fa-user-plus"></i> Register
			</a>
			<%
			}
			%>
		</div>
	</div>
</div>

<!-- Start Logout Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
	aria-labelledby="logoutModalTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h2 class="modal-title" id="logoutModalTitle">
					Hey
					<%
				if (userObj != null) {
					out.print(userObj.getName());
				}
				%>
				</h2>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<h4>Do you want to logout?</h4>
				<div class="text-center">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<form action="../logout" method="get" style="display: inline;">
						<button type="submit" class="btn btn-danger text-white">Logout</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Logout Modal -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="../index.jsp"><i class="fas fa-home"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="Home.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
		</ul>
	</div>
</nav>

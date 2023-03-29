<%@ page
	import="java.util.List, java.util.ArrayList,com.rama.pms.bo.Property"%>
<!DOCTYPE html>
<html>
<head>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>
<meta charset="ISO-8859-1">
<title></title>
<link href="webjars/bootstrap/5.2.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="webjars/bootstrap/5.2.3/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
	integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
	crossorigin="anonymous"></script>
</head>
<body>

	<%
	//String message = (String) request.getAttribute("message");
	String userType = (String) session.getAttribute("usertype");
	String user = (String) session.getAttribute("user");

	if (userType.equals("Admin")) {
	%>
	<br />
	<br />
	<br />
	<div class="successMsg">
		<b><%=userType%></b>
	</div>
	<br />
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">PMS</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
				aria-controls="navbarCollapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
					<!-- <li class="nav-item">
		        	<a class="nav-link" href="sticky-footer/sticky-footer.html">Sticky Footer</a>
		        </li>-->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Owner </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="createowner.jsp">Add
									Owner</a></li>
							<li><a class="dropdown-item" href="List">View All Owners</a></li>
							<li><a class="dropdown-item" href="searchownerbyoid.jsp">View
									Owner</a></li>
							<li><a class="dropdown-item" href="searchtenantbyoid.jsp">View
									Tenants of an Owner</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Tenant </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="createtenant.jsp">Add
									Tenant</a></li>
							<li><a class="dropdown-item" href="TenantList">View All
									Tenants</a></li>
							<li><a class="dropdown-item" href="searchtenantbytid.jsp">View
									Tenant</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Properties </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="createproperty.jsp">Add
									Property</a></li>
							<li><a class="dropdown-item" href="PropertyList">View
									All Properties</a></li>
							<li><a class="dropdown-item" href="searchpropertybypid.jsp">View
									Property</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link"
						href="OwnerSuggestions">View Owner Suggestions/Complaints</a></li>
					<li class="nav-item"><a class="nav-link"
						href="TenantSuggestions">View Tenant Suggestions/Complaints</a></li>
					<li class="nav-item"><a class="nav-link" href="Logout">Logout</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<%
	}
	%>

	<%
	if (userType.equals("Owner")) {
	%>
	<br />
	<br />
	<br />
	<div class="successMsg">
		<b><%=user%></b>
	</div>
	<br />
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">PMS</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
				aria-controls="navbarCollapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="ownerindex.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="ViewMyDetails">View My Details</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="ViewMyProperties">View My Properties</a>
					</li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="ViewMyAgreements">View My Tenancy
							Agreements</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="createagreement.jsp">Add Tenancy
							Agreement</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="ViewMyTenants">View My Tenants</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="deletemyownerprofile.jsp">Delete My
							Account</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="Logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	}
	%>

	<%
	if (userType.equals("Tenant")) {
	%>
	<br />
	<br />
	<br />
	<div class="successMsg">
		<b><%=user%></b>
	</div>
	<br />
	<br />
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">PMS</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
				aria-controls="navbarCollapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="tenantindex.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="ViewMyInfo">View My Details</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="ViewMyRentalDetails">View My Rental
							Property Details</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="ViewMyTenancyAgreement">View My
							Tenancy Agreement</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="ViewMyOwnerDetails">View My Owner
							Details </a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="deletemytenantprofile.jsp">Delete My
							Account</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="Logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	}
	%>
</body>
</html>
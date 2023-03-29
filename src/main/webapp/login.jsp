<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PMS | Login Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="webjars/bootstrap/5.2.3/css/bootstrap.min.css"
	rel="stylesheet">
<!--  custom CSS should come later  -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/inc/style.css" />
<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/inc/sticky-footer-navbar.css" />
<script>
	function changeUserType() {
		var usertype = document.getElementsByName('usertype');
		var usertypeValue;
		for (var i = 0; i < usertype.length; i++) {
			if (usertype[i].checked) {
				usertypeValue = usertype[i].value;
			}
		}
		console.log("(generic) selected usertype : " + usertypeValue);
	}
</script>
</head>
<body class="d-flex flex-column h-100">
	<!-- Begin page content -->
	<main class="flex-shrink-0">
		<div class="container">
			<!--  Container Div Start -->
			<%
			String errorMessage = (String) request.getAttribute("errorMessage");
			String message = (String) request.getAttribute("message");

			if (null != errorMessage) {
			%>
			<div class="row">
				<div class="col-12" align="center">
					<div class="alert alert-danger" role="alert">
						<%=errorMessage%>
					</div>
				</div>
			</div>
			<%
			} else {
			if (null != message) {
			%>
			<div class="row">
				<div class="col-12" align="center">
					<div class="alert alert-success" role="alert">
						<%=message%>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>
			<div class="d-flex justify-content-center">
				<div class="row">
					<!--  <div class="col-12">				
								<h1>Welcome to Team Management System (TMS)</h1>
							</div>-->
					<div class="col-12">
						<h2>Login</h2>
					</div>
					<!-- <div class="col-12">				
								<p>
									Please login with your credentials.
								</p>
							</div> -->
					<div class="col-12">
						<form id="loginForm" name="LoginForm" method="post"
							action="<%=request.getContextPath()%>/Login">
							<table
								class="table table-striped table-hover table-bordered 
											table-responsive caption-top">
								<tbody>
								<thead>
									<tr>
										<td><b>Field</b></td>
										<td><b>Value</b></td>
									</tr>
								</thead>
								<tr>
									<td><b>Email : </b></td>
									<td><input type="email" id="email" name="email" value=""
										size="30" required placeholder="Email id" /></td>
								</tr>
								<tr>
									<td><b>Password : </b></td>
									<td><input type="password" id="password" name="password"
										value="" size="30" required placeholder="Password" /></td>
								</tr>
								<tr>

									<td><label for="usertype"><b>User Type :</b> </label></td>
									<td>Admin<input type="radio" id="usertype" name="usertype"
										value="Admin" required onclick="changeUserType();"></input>
										Owner<input type="radio" id="usertype" name="usertype"
										value="Owner" onclick="changeUserType();"></input> Tenant<input
										type="radio" id="usertype" name="usertype" value="Tenant"
										onclick="changeUserType();"></input>

									</td>
								</tr>
								<tr>
									<td colspan="2" align="center"><input
										class="btn btn-primary" type="submit" value="Login" /> <input
										class="btn btn-outline-danger" type="reset" value="Reset" />
									</td>
								</tr>
								</tbody>
							</table>
						</form>
					</div>
					<div class="register">
						<table
							class="table table-striped table-hover table-bordered 
											table-responsive caption-top">
							<tr>
								<td><b>Not an existing user?</b></td>
								<td><a href="/PMSMaven/registerowner.jsp"><button>Click
											here to Register as an Owner</button></a> <a
									href="/PMSMaven/registertenant.jsp"><button>Click
											here to Register as a Tenant</button></a></td>
							</tr>
						</table>
					</div>
					<%@include file="footer.jsp"%>
				</div>

			</div>
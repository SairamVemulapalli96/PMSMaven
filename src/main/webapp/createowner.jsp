<%@page import="com.rama.pms.bo.Owner"%>
<%@include file="dynamicmenu.jsp"%>
<link
	href="<%=request.getContextPath()%>/lib/bootstrap-5.2.3-dist/css/bootstrap.min.css"
	rel="stylesheet">

<%
String exceptionMsg = (String) request.getAttribute("exceptionMsg");
Owner owner = (Owner) request.getAttribute("ownerForm");

boolean isError = (null != owner);

if (null != exceptionMsg) {
%>
<div class="errorMsg">${exceptionMsg}</div>
<%
}
%>
<h1>Add Owner</h1>
<form id="createOwnerForm" name="createOwnerForm" action="CreateOwner"
	method="post">
	<table
		class="table table-striped table-hover table-bordered 
				table-responsive caption-top">
		<thead>
			<tr>
				<th>Field</th>
				<th>Value</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Name</td>
				<td><input type="text" id="name" name="name" size=20
					placeholder="Your Name"
					value="<%if (isError) {
	out.println(owner.getName());
} else {
	out.println("");
}%>"
					required /></td>
			</tr>
			<tr>
				<td>Age</td>
				<td>
					<%
					int age = isError ? owner.getAge() : 18;
					%> <input type="number" id="age" name="age" min="1" max="100"
					step="1" size="5" placeholder="Your Age" value="<%=age%>" required />
				</td>
			</tr>
			<tr>
				<td>Gender</td>
				<td><input type="radio" name="gender" id="genderM" value="M"
					<%if (isError && owner.getGender() == 'M') {
	out.println(" checked");
}

if (!isError) {

}%>>M
					<input type="radio" name="gender" id="genderF" value="F"
					<%if (isError && owner.getGender() == 'F') {
	out.println(" checked");
}%>>F
				</td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="email" id="email" name="email" size=20
					placeholder="Your Email" required
					value="<%if (isError) {
	out.println(owner.getEmail());
} else {
	out.println("");
}%>"
					required /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" id="password" name="password"
					size=20 placeholder="Enter your Password"
					value="<%if (isError) {
	out.println(owner.getPassword());
} else {
	out.println("");
}%>"
					required /></td>
			</tr>
			<tr>
				<td>Phoneno</td>
				<td><input type="text" id="phoneno" name="phoneno" size=15
					placeholder="Your Phone no"
					value="<%if (isError) {
	out.println(owner.getPhoneno());
} else {
	out.println("");
}%>"
					required /></td>
			</tr>

			<tr>
				<td>Address</td>
				<td><textarea id="address" name="address" rows="5" cols="50"
						maxlength="30" placeholder="Your address" required>
						<%
						if (isError) {
							out.println(owner.getAddress());
						} else {
							out.println("");
						}
						%>
					</textarea></td>

			</tr>
			<tr>
				<td colspan="2"><input class="btn btn-primary" type="submit"
					value="Register" /> <input class="btn btn-danger" type="reset"
					value="Reset" /></td>
			</tr>
		</tbody>
	</table>
</form>
<%@include file="footer.jsp"%>

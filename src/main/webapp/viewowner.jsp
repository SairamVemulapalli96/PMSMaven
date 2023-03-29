<%@ page
	import="java.util.List, java.util.ArrayList,com.rama.pms.bo.Owner"%>
<%@include file="dynamicmenu.jsp"%>

<%
String message = (String) request.getAttribute("message");
String flag = (String) request.getAttribute("flag");

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
%>
<h1>View Owner</h1>
<%
Owner owner = (Owner) request.getAttribute("owner");

if (null != owner) {
	session.setAttribute("owner", owner);
%>
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
			<td>Owner Id</td>
			<td><%=owner.getOId()%></td>
		</tr>
		<tr>
			<td>Name</td>
			<td>${owner.name}</td>
		</tr>
		<tr>
			<td>Age</td>
			<td>${owner.age}</td>
		</tr>
		<tr>
			<td>Gender</td>
			<td>${owner.gender}</td>
		</tr>
		<tr>
			<td>Email</td>
			<td>${owner.email}</td>
		</tr>
		<tr>
			<td>Phoneno</td>
			<td>${owner.phoneno}</td>
		</tr>
		<tr>
			<td>Address</td>
			<td>${owner.address}</td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- <form id="editForm" name="EditForm" action="Edit" action="post">
							<input type="submit" name="Edit" Value="Edit"/>
						</form>--> <!--  <a href="editowner.jsp">Edit</a> &nbsp;&nbsp; <a
				href="DeleteOwner?oid=${owner.getOId()}">Delete</a>&nbsp;&nbsp;-->
				
				<a href="editowner.jsp" class="btn btn-info"
			role="button">Edit</a> <a href="DeleteOwner?oid=${owner.getOId()}"
			class="btn btn-danger" role="button">Delete</a>

			</td>
		</tr>
	</tbody>
</table>
<%
} else {
%>
<div class="row">
	<div class="col-12" align="center">
		<div class="alert alert-danger" role="alert">No matching records
			for the given Id - ${param.oid}.</div>
	</div>
</div>
<%
}
%>
<%@include file="footer.jsp"%>

<%@ page
	import="java.util.List, java.util.ArrayList,com.rama.pms.bo.Owner"%>
<%@include file="dynamicmenu.jsp"%>
<h1>List of Owners</h1>
<%
List<Owner> ownerList = new ArrayList();
Object obj = request.getAttribute("ownerList");
if (null != obj) {
	ownerList = (List<Owner>) obj;
}
%>
<%
String message = (String) request.getAttribute("message");
String flag = (String) request.getAttribute("flag");

String exceptionMsg = (String) request.getAttribute("exceptionMsg");

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
if (null != exceptionMsg) {
%>
<div class="row">
	<div class="col-12" align="center">
		<div class="alert alert-danger" role="alert">
			<%=exceptionMsg%>
		</div>
	</div>
</div>
<%
}
%>
Total list of owners is :
<%=ownerList.size()%>
<pre>
		</pre>
<%
if (ownerList.size() <= 0) {
%>
<div class=errorMsg>No records are available to display.</div>
<%
} else {
%>
<table
	class="table table-striped table-hover table-bordered 
						table-responsive caption-top">
	<caption style="color: #43302e">
		<b>Owners List</b>
	</caption>
	<thead>
		<tr>
			<td><b>Owner Id</b></td>
			<td><b>Name</b></td>
			<td><b>Age</b></td>
			<td><b>Gender</b></td>
			<td><b>Email</b></td>
			<td><b>Phone no</b></td>
			<td><b>Address</b></td>
		</tr>
	</thead>
	<tbody>
		<%
		for (Owner owner : ownerList) {
			out.println("<tr>");
			out.println("<td class='center'><b>" + owner.getOId() + " </b>" + "<a href='ViewOwner?oid=" + owner.getOId()
			+ "'>View " + "</a> | " + "<a href='EditOwner?oid=" + owner.getOId() + "'>Edit</a>  " + "</td>");
			out.println("<td>" + owner.getName() + "</td>");
			out.println("<td class='center'>" + owner.getAge() + "</td>");
			out.println("<td class='center'>" + owner.getGender() + "</td>");
			out.println("<td>" + owner.getEmail() + "</td>");
			out.println("<td>" + owner.getPhoneno() + "</td>");
			out.println("<td>" + owner.getAddress() + "</td>");
			out.println("</tr>");
		}
		%>
	</tbody>
</table>
<%
}
%>
<%@include file="footer.jsp"%>

<%@ page import="java.util.List, java.util.ArrayList,com.rama.pms.bo.OwnerSuggestion" %>
<%@include file="dynamicmenu.jsp" %>
		<h1>List of Owner suggestions/Complaints</h1>
		<%
			List<OwnerSuggestion> ownerSuggestionsList = new ArrayList();
			Object obj = request.getAttribute("ownerSuggestionsList");
			if(null!=obj) {
				ownerSuggestionsList = (List<OwnerSuggestion>) obj;
			}
		%>
		<%
			String message = (String) request.getAttribute("message");
			String flag = (String) request.getAttribute("flag");
			
			String exceptionMsg = (String) request.getAttribute("exceptionMsg");
			
			if(null!=message) {
		%>
				<div class="message <%= flag%>">${message}</div>
		<% 
			}
			if(null!=exceptionMsg) {
		%>
				<div class="errorMsg">${exceptionMsg}</div>
		<%
			}
		%>
		<h2>Owner Suggestions/ Complaints List </h2>
		Total list of owner suggestions/complaints is : <%= ownerSuggestionsList.size() %>
		<pre>
		</pre>
		<%
			if(ownerSuggestionsList.size()<=0) {
		%>
				<div class=errorMsg>No records are available to display.</div>
		<%
			} else {
		%>
		<table border="1">
			<thead>
				<tr>
					<td><b>Id</b></td>
					<td><b>Owner name</b></td>
					<td><b>Owner Email</b></td>
					<td><b>Suggestion/Complaint</b></td>
				</tr>				
			</thead>
			<tbody>	
		<%				
			for(OwnerSuggestion ownersuggestion : ownerSuggestionsList)
			{
				out.println("<tr>");
				out.println("<td class='center'><b>" + ownersuggestion.getOSId() + " </b>" + "</td>");
				out.println("<td>" + ownersuggestion.getOwnerName() + "</td>");
				out.println("<td>" + ownersuggestion.getEmail() + "</td>");
				out.println("<td>" + ownersuggestion.getSuggestions() + "</td>");
				out.println("</tr>");
			}			
		%>		
			</tbody>
		</table>
		<%
			}
		%>
		<%@include file="footer.jsp" %>

<%@ page import="java.util.List, java.util.ArrayList,com.rama.pms.bo.TenantSuggestion" %>
<%@include file="dynamicmenu.jsp" %>
		<h1>List of Tenant Suggestions/Complaints</h1>
		<%
			List<TenantSuggestion> tenantSuggestionsList = new ArrayList();
			Object obj = request.getAttribute("tenantSuggestionsList");
			if(null!=obj) {
				tenantSuggestionsList = (List<TenantSuggestion>) obj;
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
		<h2>Tenant Suggestions/Complaints List </h2>
		Total list of tenant suggestions/ complaints is : <%= tenantSuggestionsList.size() %>
		<pre>
		</pre>
		<%
			if(tenantSuggestionsList.size()<=0) {
		%>
				<div class=errorMsg>No records are available to display.</div>
		<%
			} else {
		%>
		<table border="1">
			<thead>
				<tr>
					<td><b>Id</b></td>
					<td><b>Tenant name</b></td>
					<td><b>Tenant Email</b></td>
					<td><b>Suggestion/Complaint</b></td>
				</tr>				
			</thead>
			<tbody>	
		<%				
			for(TenantSuggestion tenantsuggestion : tenantSuggestionsList)
			{
				out.println("<tr>");
				out.println("<td class='center'><b>" + tenantsuggestion.getTSId() + " </b>" + "</td>");
				out.println("<td>" + tenantsuggestion.getTenantName() + "</td>");
				out.println("<td>" + tenantsuggestion.getEmail() + "</td>");
				out.println("<td>" + tenantsuggestion.getSuggestions() + "</td>");
				out.println("</tr>");
			}			
		%>		
			</tbody>
		</table>
		<%
			}
		%>
		<%@include file="footer.jsp" %>

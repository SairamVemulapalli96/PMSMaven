<%@ page import="java.util.List, java.util.ArrayList,com.rama.pms.bo.Owner" %>
<%@include file="dynamicmenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Owner Home Page</title>
</head>
<body>
<h1>Home Page of Owner</h1>
		<%
			//String message = (String) request.getAttribute("message");
			String userInSession = (String) session.getAttribute("user");
		
			if(null!=userInSession) {
		%>			
				<div class="successMsg"><b>Hello <%= userInSession%></b></div><br/>
		<%		
			}
		%>
		<%
			String message = (String) request.getAttribute("message");
			String flag = (String) request.getAttribute("flag");
		
			if(null!=message) {
		%>
				<div class="message <%= flag%>">${message}</div>
		<% 
			}
		%>
		<%@include file="footer.jsp" %>
	
</body>
</html>
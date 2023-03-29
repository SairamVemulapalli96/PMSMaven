<%@page import="com.rama.pms.bo.Owner"%>
<%@include file="dynamicmenu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<h2>View Owner by Owner Id</h2>
	<form id="searchOwnerForm" name="searchOwnerForm" action="ViewOwner"
		method="get">
		<table
			class="table table-striped table-hover table-bordered 
						table-responsive caption-top">
			<tr>
				<td>Enter the Owner Id</td>
				<td><input type="number" id="oid" name="oid"
					placeholder="Owner Id" value="" required /></td>
			</tr>
			<tr>
				<td colspan="2" align = "center"><input type="submit" name="View Owner"
					Value="View Owner" /></td>
			</tr>
		</table>
	</form>
	<%@include file="footer.jsp"%>
</body>
</html>
<%@page import="com.rama.pms.bo.Tenant"%>
<%@include file="dynamicmenu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<h2>View Tenants of an Owner</h2>
	<form id="searchTenantByOIdForm" name="searchTenantByOIdForm"
		action="ViewTenantsByOId" method="get">
		<table
			class="table table-striped table-hover table-bordered 
						table-responsive caption-top">
			<tr>
				<td>Enter the Owner Id</td>
				<td><input type="number" id="oid" name="oid"
					placeholder="Owner Id" value="" required /></td>
			</tr>
			<tr>
				<td colspan="2" align = "center"><input type="submit" name="View Tenants"
					Value="View Tenants" /></td>
			</tr>
		</table>
	</form>
	<%@include file="footer.jsp"%>
</body>
</html>
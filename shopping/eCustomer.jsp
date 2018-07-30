<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Online Shopping</title>
</head>
<body>
<script language="javascript">
function validate()
{
if(document.search.user.value.length<1)
{
	alert("Empty Customer Login");
	document.search.user.focus();
	return false;
}
return true;
}
</script>
<%@ include file="connection.jsp" %>
<%@ include file="validUser.jsp" %>
<% String query=request.getParameter("query");
%>
<form action="index.jsp" name="search" method="get">
<input type="hidden" name="type" value="customer"  />
<%
if(query!=null && query.equals("edit"))
{
%>
<h1>Edit Customer Detail</h1>
<input type="hidden" name="url" value="editCustomer.jsp" />
<%
}
else
if(query!=null && query.equals("delete"))
{
%>
<h1>Delete Customer </h1>
<input type="hidden" name="url" value="deleteCustomer.jsp" />
<%
}
else
if(query!=null && query.equals("role"))
{
%>
<h1>Edit Customer Role</h1>
<input type="hidden" name="url" value="addRole.jsp" />
<%
}
else
if(query!=null && query.equals("detail"))
{
%>
<h1>Customer Details</h1>
<input type="hidden" name="url" value="dispCustomer.jsp" />
<%
}
%>
<table>
<tr><td>Enter Customer Login</td><td><input type="text" name="user" /></td></tr>
<tr><td></td><td><input type="submit" name="submit" value="Edit" onclick="return validate();" /><input type="submit" name="submit" value="Cancel" /></td></tr>
</table>
</form>
</body>
</html>

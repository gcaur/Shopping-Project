<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Online Shopping</title>
</head>
<body>
<%@ include file="connection.jsp" %>
<%@ include file="validUser.jsp" %>
<script language="javascript">
function validate()
{
if(document.search.pid.value.length<1)
{
	alert("Empty Product ID");
	document.search.pid.focus();
	return false;
}
return true;
}
</script>

<% String query=request.getParameter("query");
%>
<form action="index.jsp" name="search" method="get">
<input type="hidden" name="type" value="product"  />
<%
if(query!=null && query.equals("edit"))
{
%>
<h1>Edit Product Detail</h1>
<input type="hidden" name="url" value="editProduct.jsp" />
<%
}
else
if(query!=null && query.equals("delete"))
{
%>
<h1>Delete Product </h1>
<input type="hidden" name="url" value="deleteProduct.jsp" />
<%
}
else
if(query!=null && query.equals("price"))
{
%>
<h1>Change Price</h1>
<input type="hidden" name="url" value="changePrice.jsp" />
<%
}
else
if(query!=null && query.equals("detail"))
{
%>
<h1>Product Details</h1>
<input type="hidden" name="url" value="dispItem.jsp" />
<%
}
%>

<table>
<tr><td>Enter Product Id</td><td><input type="text" name="pid" /></td></tr>
<tr><td></td><td><input type="submit" name="submit" value="Edit" onclick="return validate();"/></td></tr>
</table>
</form>
</body>
</html>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Online Shopping</title>
</head>
<%@ include file="connection.jsp" %>
<script language="javascript">
function validate()
{
if(document.add.ppid.value.length<1)
{
	alert("Empty Product ID");
	document.add.ppid.focus();
	return false;
}
if(document.add.name.value.length<1)
{
	alert("Empty Product Name");
	document.add.name.focus();
	return false;
}
if(document.add.company.value.length<1)
{
	alert("Empty Company Name");
	document.add.company.focus();
	return false;
}
if(document.add.price.value.length<1)
{
	alert("Empty Product Price");
	document.add.price.focus();
	return false;
}
if(document.add.stock.value.length<1)
{
	alert("Empty Stock");
	document.add.stock.focus();
	return false;
}
if(document.add.reorder.value.length<1)
{
	alert("Empty Re-Order Value");
	document.add.reorder.focus();
	return false;
}
return true;
}
</script>
<% 
String role=(String)session.getAttribute("role");
String submit=request.getParameter("submit");
if(submit!=null && submit.equals("Cancel"))
{
%>
	<jsp:forward page="index.jsp?url=dispItem.jsp&type=product" />
<%
}
else
if(role!=null && role.equals("manager"))
{
    submit=request.getParameter("submit");
	if(submit!=null && submit.equals("Add"))
	{
		int pid=Integer.parseInt(request.getParameter("ppid"));
		st=con.createStatement();
		try {
		rst=st.executeQuery("select pid from product where pid="+pid);
		}
		catch(Exception e)
		{
			out.print("Error"+e);
		}
		if(rst.next())
		{
		%>
		<h1>Product ID is already exist. Please input other id</h1>
		<h1><a href="index.jsp?url=dispItem.jsp&type=product">product list</a> <a href="index.jsp?url=addProduct.jsp&type=product">Add New Record</a> <a href="index.jsp?url=editProduct.jsp&type=product&pid=<%=pid%>">Edit Product</a></h1>
		<%
		}
		else
		{
			String name=request.getParameter("name");
			String company=request.getParameter("company");
			float price=Float.valueOf(request.getParameter("price"));
			String category=request.getParameter("category");
			int stock=Integer.parseInt(request.getParameter("stock"));
			int reorder=Integer.parseInt(request.getParameter("reorder"));
 			st=con.createStatement();
			st.executeUpdate("insert into product values("+pid+", '"+name+"', '"+company+"',"+price+",'"+category+"', "+stock+", "+reorder+" )");
			out.println("<h1>Added successfully, want to add <a href=index.jsp?url=addProduct.jsp&type=product>next</a></h1>");
		}
	}
	else
	{
	%>
	<body>
	<form action="index.jsp" method="post" name="add">
	<input type="hidden" name="url" value="addProduct.jsp"  />
	<input type="hidden" name="type" value="product" />
	<table>
	<tr><td colspan="2"><h1>Add New Product</h1></td></tr>
	<tr><td>Product ID</td><td><input type="text" name="ppid" /></td></tr>
	<tr><td>Product Name</td><td><input type="text" name="name" /></td></tr>
	<tr><td>Product Company</td><td><input type="text" name="company" /></td></tr>
	<tr><td>Product Price</td><td><input type="text" name="price" /></td></tr>
	<tr><td>Product Category</td><td><select name="category">
	<option value="Hardware">Hardware</option>
	<option value="Software">Software</option>
	</select>
	</td></tr>
	<tr><td>Stock in Hand</td><td><input type="text" name="stock" value="0"/></td></tr>
	<tr><td>Reorder Level</td><td><input type="text" name="reorder" value="5"/></td></tr>
	<tr><td></td><td><input type="submit" name="submit" value="Add" onclick="return validate();" /><input type="submit" name="submit" value="Cancel" /></td></tr>
	</table>
	</form>
	</body>
	<%
	}
}
else
{
%>
<jsp:forward page="index.jsp" >
	<jsp:param name="action" value="addProduct" ></jsp:param>
</jsp:forward>
<%
}
%>
</html>

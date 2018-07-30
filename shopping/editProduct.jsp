<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@ include file="connection.jsp" %> 
<%@ include file="validUser.jsp" %>
<script language="javascript">
function validate()
{
if(document.edit.name.value.length<1)
{
	alert("Empty Product Name");
	document.edit.name.focus();
	return false;
}
if(document.edit.company.value.length<1)
{
	alert("Empty Company Name");
	document.edit.password.focus();
	return false;
}
if(document.edit.price.value.length<1)
{
	alert("Empty Product Price");
	document.edit.price.focus();
	return false;
}
return true;
}
</script>
<%
String name;
String company;
double price;
String pid;
String role=session.getAttribute("role").toString();
String submit=request.getParameter("submit");
if(submit!=null && submit.equals("Cancel"))
{
	out.println("<h2>Action canceld by the User</h2>");
}
else
if(validUser(session,true) && role.equals("manager"))
{
	st=con.createStatement();
	submit=request.getParameter("submit");
	if(submit!=null && submit.equals("Update"))
	{
		pid=request.getParameter("pid");
		name=request.getParameter("name");
		company=request.getParameter("company");
		price=Double.valueOf(request.getParameter("price"));
		st.executeUpdate("update product set name='"+name+"', company='"+company+"', price="+price+" where pid="+pid);
		out.println("UPDATED, back to <a href=index.jsp?url=dispItem.jsp&type=product >List of Item</a>");
	}
	else
	{
		pid=request.getParameter("pid");
		rst=st.executeQuery("select * from product where pid="+pid);
		if(rst.next())
		{
			name=rst.getString("name");
			company=rst.getString("company");
			price=rst.getDouble("price");
			%>
			<form action="index.jsp?type=product" name="edit" method="post">
			<input type="hidden" name="url" value="editProduct.jsp"  />
			<input type="hidden" name="pid" value="<%=pid%>"/>
			<table>
			<tr><td colspan="2"><h1>Edit New Product</h1></td></tr>
			<tr><td>Product ID</td><td><input type="text" value="<%=pid%>" readonly="true"/></td></tr>
			<tr><td>Product Name</td><td><input type="text" name="name" value="<%=name%>" /></td></tr>
			<tr><td>Product Company</td><td><input type="text" name="company" value="<%=company%>"/></td></tr>
			<tr><td>Product Price</td><td><input type="text" name="price" value="<%=price%>"/></td></tr>
			<tr><td></td><td><input type="submit" name="submit" value="Update" onclick="return validate();"/>
			<input type="submit" name="submit" value="Cancel" /></td></tr>
			</table>
			</form>
			<%@ include file="closeConnection.jsp" %>
			<%
		}
		else
			out.println("<h2>Product not found</h2>");
	}
}
%>

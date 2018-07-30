<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@ include file="connection.jsp" %> 
<%@ include file="validUser.jsp" %>
<script language="javascript">
function validate()
{
if(document.change.price.value.length<1)
{
	alert("Empty Product Price");
	document.change.price.focus();
	return false;
}
if(document.change.price.value=="0")
{
	alert("Price could not be zero!");
	document.change.price.focus();
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
%>
	<jsp:forward page="index.jsp?url=dispItem.jsp&type=product" />
<%
}
if(validUser(session,true) && role.equals("manager"))
{
	st=con.createStatement();
	submit=request.getParameter("submit");
	if(submit!=null && submit.equals("Update"))
	{
		pid=request.getParameter("pid");
		price=Double.valueOf(request.getParameter("price"));
		st.executeUpdate("update product set price="+price+" where pid="+pid);
		out.println("Price UPDATED, back to <a href=index.jsp?url=dispItem.jsp&type=product >List of Item</a>");
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
			<form action="index.jsp?type=product" name="change">
			<input type="hidden" name="url" value="changePrice.jsp"  />
			<input type="hidden" name="pid" value="<%=pid%>"/>
			<table>
			<tr><td colspan="2"><h1>Edit New Product</h1></td></tr>
			<tr><td>Product ID</td><td><%=pid%></td></tr>
			<tr><td>Product Name</td><td><%=name%></td></tr>
			<tr><td>Product Company</td><td><%=company%></td></tr>
			<tr><td>Product Price</td><td><input type="text" name="price" value="<%=price%>"/></td></tr>
			<tr><td></td><td><input type="submit" name="submit" value="Update" onclick="return validate();" />
			<input type="submit" name="submit" value="Cancel" /></td></tr>
			</table>
			</form>
			<%@ include file="closeConnection.jsp" %>
			<%
		}
		else
			out.println("<h2>Product not found!!!</h2>");
	}
}
%>

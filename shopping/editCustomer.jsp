<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@ include file="connection.jsp" %> 
<%@ include file="validUser.jsp" %>
<script language="javascript">
function validate()
{
if(document.edit.name.value.length<1)
{
	alert("Empty Customer Name");
	document.edit.name.focus();
	return false;
}
if(document.edit.password.value.length<1)
{
	alert("Empty Password");
	document.edit.password.focus();
	return false;
}
return true;
}
</script>

<%
String user;
String name;
String password;
String urole;
String role=session.getAttribute("role").toString();
String submit=request.getParameter("submit");
if(submit!=null && submit.equals("Cancel"))
{
	out.println("<h2>Action canceld by the user</h2>");
}
else
if((validUser(session,true) && role.equals("manager")) || validUser(session,false) && role.equals("user"))
{
	st=con.createStatement();
	if(submit!=null && submit.equals("Update"))
	{
		user=request.getParameter("user");
		name=request.getParameter("name");
		password=request.getParameter("password");
		urole=request.getParameter("role");
		st.executeUpdate("update login set user='"+user+"', name='"+name+"', passwd='"+password+"' where user='"+user+"'");
		out.println("UPDATED, back to <a href=index.jsp?url=dispItem.jsp&type=product>List of Item</a>");
	}
	else
	{
		user=request.getParameter("user");
		rst=st.executeQuery("select * from login where user='"+user+"'");
		if(rst.next())
		{
			name=rst.getString("name");
			password=rst.getString("passwd");
			urole=rst.getString("role");
			%>
			<form action="index.jsp?type=customer" name="edit" method="post">
			<input type="hidden" name="url" value="editCustomer.jsp" />
			<input type="hidden" name="action" value="action" />
			<input type="hidden" name="user" value="<%=user%>"/>
			<table>
			<tr><td colspan="2"><h1>Edit New Product</h1></td></tr>
			<tr><td>Customer ID</td><td><input type="text" value="<%=user%>" readonly="true"/></td></tr>
			<tr><td>Customer Name</td><td><input type="text" name="name" value="<%=name%>" /></td></tr>
			<tr><td>Password</td><td><input type="password" name="password" value="<%=password%>"/></td></tr>
			<tr><td>User Role</td><td><input type="text" name="role" value="<%=urole%>" disabled="disabled"/> </td></tr>
			<tr><td></td><td><input type="submit" name="submit" value="Update" onclick="return validate();" /><input type="submit" name="submit" value="Cancel" /></td></tr>
			</table>
			</form>
			<%@ include file="closeConnection.jsp" %>
			<%
		}
		else
			out.println("<h2>User not found</h2>");
	}
}
%>
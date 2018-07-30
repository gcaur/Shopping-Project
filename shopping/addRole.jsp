<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Online Shopping</title>
</head>
<body>
<%@ include file="connection.jsp" %>
<% 
String submit=request.getParameter("submit");
String user=request.getParameter("user");
if(submit!=null && submit.equals("Cancel"))
{
	out.println("<h2>Action canceled by the User</h2>");
}

if(session!=null)
{
	String roli=(String)session.getAttribute("role");
	if(roli!=null && roli.equals("manager"))
	{
		if(submit!=null && submit.equals("Cancel"))
		{
		response.sendRedirect("dispCustomer.jsp");
		}
		if(submit!=null && submit.equals("Add"))
		{
			user=request.getParameter("user");
			String role=request.getParameter("role");
			st=con.createStatement();
			st.executeUpdate("update login set role='"+role+"' where user='"+user+"'");
		}
		else
		{
			st=con.createStatement();
			rst=st.executeQuery("select user,role from login where user='"+user+"'");
			if(rst.next())
			{
			%>
			<form action="index.jsp?type=customer" method="post">
			<input type="hidden" name="user" value="<%=rst.getString("user") %>" />
			<input type="hidden" name="url" value="addRole.jsp" />
			<table>
			<tr><td>User Name</td><td><%=rst.getString("user") %></td></tr>
			<tr><td>Old Role</td><td><%=rst.getString("role") %></td></tr>
			<tr><td>Select New Role</td><td>
			<select name="role">
			<option selected="selected">user</option>
			<option>manager</option>
			</select>
			</td></tr>
			<tr><td></td><td><input type="submit"  name="submit" value="Add" /> 
			<input type="submit" name="submit" value="Cancel" /></td></tr>
			</table>
			</form>
		<%	}
		}
	}
	else
	{
	%>
<jsp:forward page="index.jsp" >
	<jsp:param name="action" value="addRole" ></jsp:param>
</jsp:forward>
	<%
	}
} %>
</body>
</html>

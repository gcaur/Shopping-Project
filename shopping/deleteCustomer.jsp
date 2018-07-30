<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@ include file="connection.jsp" %>
<%@ include file="validUser.jsp" %>
<% 
String submit=request.getParameter("submit");
if(submit!=null && submit.equals("Cancel"))
{
	out.println("<h2>Action canceled by the User</h2>");
}
else
{
String user=request.getParameter("user");
if(user!=null && validUser(session, true))
{
	String role=session.getAttribute("role").toString();
	if(role!=null && role.equals("manager"))
	{
		st=con.createStatement();
		submit=request.getParameter("submit");
		if(submit==null || !submit.equals("del"))
		{
				
			rst=st.executeQuery("select * from login where user='"+user+"'");
			if(rst.next())
			{
			%>
				<form action="index.jsp?type=customer" method="get">
				<input type="hidden" name="url" value="deleteCustomer.jsp" />
				<input type="hidden" name="user" value="<%=rst.getString("user") %>" />
				<table><tr><td colspan="2">delete the record</td></tr>
				<tr><td>Customer ID</td><td><%=rst.getString("user") %></td></tr>
				<tr><td>Customer Name</td><td><%=rst.getString("name") %></td></tr>
				<tr><td>Customer Role</td><td><%=rst.getString("role") %></td></tr>
				<tr><td></td><td><input type="submit" name="submit" value="del"/>
				<input type="submit" name="submit" value="Cancel" /></td></tr>
				</table>
				</form>
			<%
			}
			else
			{
				out.println("<h2>User not found</h2>");
			}
		}
		else
		{
			if(submit!=null && submit.equals("del"))
			{
				st.executeUpdate("delete from login where user='"+user+"'");
			%>	
				<jsp:forward page="index.jsp?url=dispCustomer.jsp&type=customer" />
			<%	
			}
		}
	}
	else
	{
		out.println("Not a valid user");
	}	
}	
else
{
out.print("not a valid User");
}
}
%>	
<%@ include file="closeConnection.jsp" %>
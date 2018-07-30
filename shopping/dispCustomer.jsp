<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@ include file="connection.jsp" %>
<%@ include file="validUser.jsp" %>
<% 
if(validUser(session,false) )
{
	String link,edit,delete;
	String role=session.getAttribute("role").toString();
	if(role!=null)
	{
		String user=request.getParameter("user");
		st=con.createStatement();
		if(user==null)
			rst=st.executeQuery("Select * from login");
		else
			rst=st.executeQuery("Select * from login where user='"+user+"'");
		if(rst.next())
		{
			rst.previous();
			%>
			<table border="1">
			<tr><th>User Id</th><th>Name</th><th>Password</th><th>Role</th><th>Action</th></tr>
			<% while(rst.next())
			{
				%>
				<tr><td><%=rst.getString("user") %></td>
				<td><%=rst.getString("name") %></td>
				<td><%=rst.getString("passwd") %></td>
				<td><%=rst.getString("role") %></td>
				<% 
				edit="index.jsp";
				edit+="?url=";
				delete=edit;
				user=rst.getString("user");
				edit+="editCustomer.jsp?user=";
				edit+=user;
				edit+="&type=customer";
				delete+="deleteCustomer.jsp?user=";
				delete+=user;
				delete+="&type=customer";
				%>
				<td><a href=<%=edit%>>Edit</a> 
				<% if(validUser(session,true))
				{
				%>
					| <a href=<%=delete%>>Delete</a></td>
				<% 
				}
				%>
				</tr>
				<% 
			}
		}
		else
			out.println("<h2>Customer not found</h2>");
		%>
		</table>
		<%
	}
	else
	{
		%>
		<h1> You are not authorize to access this page</h1>
	    <a href="index.jsp?url=login.jsp?action=dispCustomer&type=customer">Login</a>
		<%
	}
	%>
<%
}
else
{
%>
<h1> You are not authorize to access this page</h1>
<a href="index.jsp?url=login.jsp?action=dispCustomer&type=customer">Login</a>
<%
}
%>
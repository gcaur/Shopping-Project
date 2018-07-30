<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@ include file="connection.jsp" %>
<%@ include file="validUser.jsp" %>
<% 
String submit=request.getParameter("submit");
if(submit!=null && submit.equals("cancel"))
{
	out.println("<h2>Action canceled by the User</h2>");
}
else
{
String pid=request.getParameter("pid");
if(pid!=null && validUser(session,true))
{
String role=session.getAttribute("role").toString();
	if(role!=null && role.equals("manager"))
	{
		st=con.createStatement();
		submit=request.getParameter("submit");
		if(submit==null || !submit.equals("del"))
		{
				
			rst=st.executeQuery("select * from product where pid="+pid);
			if(rst.next())
			{
			%>
				<form action="index.jsp?type=product" method="post">
				<input type="hidden" name="url" value="deleteProduct.jsp" />
				<input type="hidden" name="pid" value="<%=rst.getInt("pid") %>" />
				<table><tr><td colspan="2">delete the record</td></tr>
				<tr><td>Product ID</td><td><%=rst.getInt("pid") %></td></tr>
				<tr><td>Product Name</td><td><%=rst.getString("name") %></td></tr>
				<tr><td>Company Name</td><td><%=rst.getString("company") %></td></tr>
				<tr><td>Category</td><td><%=rst.getString("category") %></td></tr>
				<tr><td>Price</td><td><%=rst.getInt("price") %></td></tr>
				<tr><td>Stock in Hand</td><td><%=rst.getInt("stock") %></td></tr>
				<tr><td></td><td><input type="submit" name="submit" value="del"/>
				<input type="submit" name="submit" value="cancel" /></td></tr>
				</table>
			    <% if(rst.getInt("stock")>0)
					out.println("<font color=red><h1>you have stock in hand, really want to delete</h1></font>");
				%>
				</form>
			<%
			}
			else
			{
				out.println("<h2>Product ID not found</h2>");
			}
		}
		else
		{
			if(submit!=null && submit.equals("del"))
			{
				st.executeUpdate("delete from product where pid="+pid);
				%>
				<jsp:forward page="index.jsp?url=dispItem.jsp&type=product" />
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
out.print("not a valid PID");
}
}
%>	
<body>
</body>
</html>

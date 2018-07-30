<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@ include file="connection.jsp" %>
<%@ include file="validUser.jsp" %>
<% 
String type="stock";
int pid;
if(validUser(session,true))
{
String submit=request.getParameter("submit");
if(submit!=null && submit.equals("Cancel"))
{
	out.println("Action Canceled");	
}
else
{
	st=con.createStatement();
	if(request.getParameter("pid")!=null)
	{
		pid=Integer.parseInt(request.getParameter("pid"));
		rst=st.executeQuery("select * from product where pid="+pid);
	}
	else
	{
		rst=st.executeQuery("Select * from product");
	}
	%>
	<table border="1">
	<tr><th>Name</th><th>Stock</th><th>Action</th></tr>
	<% int flag=1;
	while(rst.next())
	{
		int stock=rst.getInt("stock");
		if(stock<=5)
		{
		%>
		<tr><td><a href=index.jsp?url=dispItem.jsp?pid=<%=rst.getInt("pid")%>&type=stock><%=rst.getString("name") %></a></td>
		<td><%=rst.getInt("stock") %></td>
		<% 	 pid=rst.getInt("pid");
		String role=session.getAttribute("role").toString();
		%>
		<td><a href=index.jsp?type=stock&url=addStock.jsp?pid=<%=rst.getInt("pid") %>>Add Stock</a></td></tr>
		<%
		flag=0;
		}
	}
	if(flag==1)
		out.println("<tr><td colspan=3>No need to order any stock</td></tr>");
	}
}
else
	out.println("Not a valid user,<a href=index.jsp?url=login.jsp?action=dispStock&type=stock>");

%>
</table>
<%@ include file="closeConnection.jsp" %>

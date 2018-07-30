<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@ include file="connection.jsp" %>
<%@ include file="validUser.jsp" %>
<% 
String type="product";
int pid=0;
String uri="index.jsp";
st=con.createStatement();
if(request.getParameter("pid")!=null)
{
	pid=Integer.parseInt(request.getParameter("pid"));
	rst=st.executeQuery("Select * from product where pid="+pid);
}
else
	rst=st.executeQuery("Select * from product");
if(pid==0)
	rst=st.executeQuery("Select * from product");
if(rst.next())
{
	rst.previous();
	%>
	<table border="1">
	<tr><th>Id</th><th>Name</th><th>Company</th><th>Price</th><th>Action</th></tr>
	<% while(rst.next())
	{
		%>
		<tr><td><%=rst.getInt("pid") %></td>
		<td><%=rst.getString("name") %></td>
		<td><%=rst.getString("company") %></td>
		<td><%=rst.getDouble("price") %></td>
		<% if(validUser(session,false))
		{
			String link,edit,delete;
			pid=rst.getInt("pid");
			int stock=rst.getInt("stock");
			String role=session.getAttribute("role").toString();
			if(role.equals("manager"))
			{
				edit="index.jsp?url=";
				edit+="editProduct.jsp?pid=";
				edit+=pid+"&type="+type;
			 	delete="index.jsp?url=";
				delete+="deleteProduct.jsp?pid=";
				delete+=pid+"&type="+type;
			%>
				<td><a href=<%=edit%>>Edit</a> | <a href=<%=delete%>>Delete</a></td>
			<%}
			else
			{
				link=uri;
				link+="?url=purchase.jsp?pid=";
				link+=pid;
				link+="&stock="+stock+"&type="+type;
				%>
				<td><a href=<%=link%>>Purchase</a></td>
				<% 
			}
		}
		else
		{
		%>
		<td><a href="<%=uri %>?url=login.jsp?action=dispItem&type=<%=type%>">Login to purchase</a></td>
		<%
		}
		%>
		</tr>
	<%
	}
}
else
	out.println("<h2>Product not found</h2>");
%>
</table>
<%@ include file="closeConnection.jsp" %>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@ include file="connection.jsp" %> 
<%@ include file="validUser.jsp" %>
<%
int pid;
String role=session.getAttribute("role").toString();
if(validUser(session,true) && role.equals("manager"))
{
	st=con.createStatement();
	String submit=request.getParameter("submit");
	if(submit!=null && submit.equals("Cancel"))
	{
		out.println("Action Canceled");	
	}
	%>
	<form action="index.jsp">
	<input type="hidden" name="url" value="dispStock.jsp"  />
	<input type="hidden" name="type" value="stock"  />
	<table>
	<tr><td colspan="2"><h1>Add Stock</h1></td></tr>
	<%
		rst=st.executeQuery("select * from product");
	%>
	<tr><td>Select Product</td>
	<td>
	<select name="pid">
	<%
	String name;
	while(rst.next())
	{
		pid=rst.getInt("pid");
		name=rst.getString("name");
		out.println("<option value="+pid+">"+name+"</option>");
	}
	%>
	</select></td></tr>
	<tr><td></td><td><input type="submit" name="submit" value="OK" />
	<input type="submit" name="submit" value="Cancel" /></td></tr>
	</table>
	</form>
	<%@ include file="closeConnection.jsp" %>
<%
}
%>

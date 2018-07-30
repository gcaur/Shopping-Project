<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@ include file="connection.jsp" %> 
<%@ include file="validUser.jsp" %>
<script language="javascript">
function validate()
{
if(document.add.stock.value.length<1)
{
	alert("Empty Stock");
	document.add.stock.focus();
	return false;
}
if(document.add.stock.value=='0')
{
	alert("Error in Stock");
	document.add.stock.focus();
	return false;
}
return true;
}
</script>
<%
int pid;
String role=session.getAttribute("role").toString();
String submit=request.getParameter("submit");
if(submit!=null && submit.equals("Cancel"))
{
	out.println("Action Canceled");
}
else
if(validUser(session,true) && role.equals("manager"))
{
	st=con.createStatement();
	submit=request.getParameter("submit");
	if(submit!=null && submit.equals("Update"))
	{
		pid=Integer.parseInt(request.getParameter("pid"));
		int stock=Integer.parseInt(request.getParameter("stock"));
		st.executeUpdate("update product set stock=stock+"+stock+" where pid="+pid);
		out.println("UPDATED, back to <a href=index.jsp?url=dispStock.jsp&type=stock >List of Item</a>");
	}
	else
	{
	%>
		<form action="index.jsp?type=stock" method="post" name="add">
		<input type="hidden" name="url" value="addStock.jsp"  />
		<table>
		<tr><td colspan="2"><h1>Add Stock</h1></td></tr>
		<%
		if(request.getParameter("pid")==null)
		{
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
		<%
		}
		else
		{
			pid=Integer.parseInt(request.getParameter("pid"));
			rst=st.executeQuery("select * from product where pid="+pid);
			rst.next();
			%>
			<input type="hidden" name="pid" value="<%=pid%>"  />
			<tr><td>Product Name</td><td><a href=index.jsp?type=stock&url=dispItem.jsp?pid=<%=pid %>><%=rst.getString("name") %></a></td></tr><br />
		<%
		}
		%>
			<tr><td>New Stock</td><td><input type="text" name="stock" value="0" /></td></tr>
			<tr><td></td><td><input type="submit" name="submit" value="Update" onclick="return validate();" />
			<input type="submit" name="submit" value="Cancel" /></td></tr>
			</table>
			</form>
			<%@ include file="closeConnection.jsp" %>
			<%
	}
}
%>

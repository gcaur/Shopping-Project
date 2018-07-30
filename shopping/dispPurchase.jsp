<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@ include file="connection.jsp" %>
<%@ include file="validUser.jsp" %>
<% 
String type="product";
int purchaseid=0;
st=con.createStatement();
String ptype=request.getParameter("ptype");
String user=session.getAttribute("user").toString();
String role=session.getAttribute("role").toString();
if(role.equals("user"))
{
	if(ptype==null || ptype.equals("a"))
		rst=st.executeQuery("select * from purchase where user='"+user+"'");
	else
		rst=st.executeQuery("select * from purchase where user='"+user+"' and ptype='"+ptype+"'");
}
else
{
	if(ptype==null || ptype.equals("a"))
		rst=st.executeQuery("select * from purchase");
	else
		rst=st.executeQuery("select * from purchase where ptype='"+ptype+"'");
}
%>
<table border="1">
<tr><th>Product ID</th><th>Customer Name</th><th>Date of Purchase</th><th>Payment Type</th><th>Payment No</th><th>Action</th></tr>
<% while(rst.next())
{
	purchaseid=rst.getInt("purchaseid");
	int pid=rst.getInt("pid");
	String customer=rst.getString("user");
%>
	<tr>
	<td><a href=index.jsp?url=dispItem.jsp?pid=<%=pid%>&type=product><%=pid %></a></td>
	<td><a href=index.jsp?url=dispCustomer.jsp?user=<%=customer%>&type=customer><%=customer %></a></td>
	<td><%=rst.getString("dop") %>
	<td>
	<%
	String pt=rst.getString("paytype");
	if(pt.equals("cc"))
		out.println("Credit Card");
	else
	if(pt.equals("db"))
		out.println("Debit Card");
	else
	if(pt.equals("bank"))
		out.println("Bank Trasfer");
	%>
	</td>
	<td><%=rst.getString("pno") %></td>
<% if(validUser(session,false))
{
	out.println("<td>");
	pt=rst.getString("ptype");

	if(pt.equals("c"))
	{	
		out.println("<a href=index.jsp?url=verifyPurchase.jsp&purchaseid="+purchaseid+"&type="+type+">Verify</a>");
		out.println(" | <a href=index.jsp?url=deletePurchase.jsp?purchaseid="+purchaseid+"&type="+type+">Delete</a>");	
	}
	else
	if(pt.equals("n"))
	{
		out.println(rst.getString("reason")+" | <a href=index.jsp?url=deletePurchase.jsp?purchaseid="+purchaseid+"&type="+type+">Delete</a>");
	}
	else
	{
		out.println("VALID");
	}
}
else
if(validUser(session,true))
{
	out.println("<td>");
	pt=rst.getString("ptype");

	if(pt.equals("c"))
	{	
		out.println("<a href=index.jsp?url=verifyPurchase.jsp?purchaseid="+purchaseid+"&type="+type+">Verify</a> | <a href=index.jsp?url=deletePurchase.jsp?purchaseid="+purchaseid+"&type="+type+">Delete</a>");	
	}
	else
	if(pt.equals("n"))
	{
		out.println(rst.getString("reason")+" <a href=index.jsp?url=deletePurchase.jsp?purchaseid="+purchaseid+"&type="+type+">Delete</a>");
	}
	else
	{
		out.println("VALID");
	}
	out.println("</td>");
}
%>
</tr>
<%
}
%>
</table>
<%@ include file="closeConnection.jsp" %>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Online Shopping</title>
</head>
<%@ include file="connection.jsp" %>
<%@ include file="validUser.jsp" %>
<body>
<%
int purchaseid=Integer.parseInt(request.getParameter("purchaseid"));

st=con.createStatement();
String submit=request.getParameter("submit");
if(submit!=null && submit.equals("YES"))
{
st.executeUpdate("delete from purchase where purchaseid="+purchaseid);
%>
<jsp:forward page="index.jsp?url=dispPurchase.jsp&type=purchase&ptype=a" />
<%
}
else
if(submit!=null && submit.equals("NO"))
{
%>
<jsp:forward page="index.jsp?url=dispPurchase.jsp&type=purchase&ptype=a" />
<%
}
if(validUser(session,false))
{
String user=session.getAttribute("user").toString();
rst=st.executeQuery("select * from purchase where user='"+user+"' and purchaseid="+purchaseid);
}
if(validUser(session,true))
{
rst=st.executeQuery("select * from purchase where purchaseid="+purchaseid);
}
%>
<form action="index.jsp" method="post" name="dp" >
<table border="1">
<tr><th>Product ID</th><th>Customer Name</th><th>Date of Purchase</th><th>Payment Type</th><th>Payment No</th></tr>
<%
if(rst.next())
{
	purchaseid=rst.getInt("purchaseid");
	int pid=rst.getInt("pid");
	String customer=rst.getString("user");
%>
<tr>
	<td><a href=index.jsp?url=dispItem.jsp?pid=<%=pid%>&type=product><%=pid %></a></td>
	<td><a href=index.jsp?url=dispCustomer.jsp?user=<%=customer%>&type=customer><%=customer %></a></td>
	<td><%=rst.getString("dop") %></td>
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
	<td><%=rst.getString("pno") %></td></tr>
	<tr><td colspan="3">Do you want to delete???</td><td colspan="2">
	<input name="purchaseid" value="<%=purchaseid %>" type="hidden">
	<input name="url" value="deletePurchase.jsp" type="hidden">
	<input type="submit" name="submit" value="YES" /><input type="submit" name="submit" value="NO" /></td></tr>
</table>
</form>
<%
}
else
	out.println("value not found");
%>
</body>
</html>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Verify Purchase</title>
</head>
<%@ include file="connection.jsp" %>
<%@ include file="validUser.jsp" %>
<body>
<% 
int purchaseid=Integer.parseInt(request.getParameter("purchaseid"));	
if(validUser(session,true))
{
	String submit=request.getParameter("submit");
	if(submit!=null && submit.equals("Delete"))
	{
		String link="index.jsp?url=deletePurchase.jsp?purchaseid="+purchaseid+"&type=product";
		%>
		<jsp:forward page="<%=link %>" />
		<%
	}
	else
	if(submit!=null && submit.equals("Cancel"))
	{
		String link="index.jsp?url=dispPurchase.jsp&type=product&purchaseid=0";
		%>
		<jsp:forward page="<%=link %>" />
		<%
	}
	else
	if(submit!=null && submit.equals("Valid"))
	{
		st=con.createStatement();
		st.executeUpdate("update purchase set ptype='v' where purchaseid="+purchaseid);
		String link="index.jsp?url=dispPurchase.jsp&type=product&purchaseid=0";
		%>
		<jsp:forward page="<%=link %>" />
		<%
	}
	else
	if(submit!=null && submit.equals("Invalid"))
	{
		%>
		<form name="vp" action="index.jsp" method="post">
		<input type="hidden" name="url" value="verifyPurchase.jsp" />
		<table>
		<tr><td colspan="2"><h2>Verification failed reason</h2></td></tr>
		<tr><td>Reason</td><td><textarea name="reason"></textarea></td></tr>
		<input type="hidden" name="purchaseid" value="<%=purchaseid %>" />
		<tr><td></td><td><input type=submit name="submit" value="OK" />
		<input type="submit" name="submit" value="Cancel" /></td></tr>
		</table>
		</form>
	<%	
	}
	else
	if(submit!=null && submit.equals("OK"))
	{
		String reason=request.getParameter("reason");
		st=con.createStatement();
		st.executeUpdate("update purchase set reason='"+reason+"', ptype='n' where purchaseid="+purchaseid);
		String link="index.jsp?url=dispPurchase.jsp&type=product&purchaseid=0";
		%>
		<jsp:forward page="<%=link %>" />
		<%
	}	
	else
	{
		String type="product";
		purchaseid=Integer.parseInt(request.getParameter("purchaseid"));
		st=con.createStatement();
		rst=st.executeQuery("select * from purchase where purchaseid="+purchaseid);
		if(rst.next())
		{
		%>
			<table border="1">
			<tr><td>Purchase ID</td><td><%=rst.getInt("purchaseid")%></td></tr>
			<tr><td>Product ID</td><td><a href=index.jsp?url=dispItem.jsp&pid=<%=rst.getInt("pid")%>&type=product><%=rst.getInt("pid")%></a></td></tr>
			<tr><td>Customer</td><td><a href=index.jsp?url=dispCustomer.jsp&user=<%=rst.getString("user")%>&type=product><%=rst.getString("user")%></a></td></tr>
			<tr><td>Payment Type</td><td>
			<%	String pt=rst.getString("paytype");
			if(pt.equals("cc"))
				out.println("Credit Card");
			else
			if(pt.equals("db"))
				out.println("Debit Card");
			else
			if(pt.equals("bank"))
				out.println("Bank Trasfer");
			%>
			</td></tr>
			<tr><td>Payment No</td><td><%=rst.getString("pno") %></td></tr>
			<form name="vp" action="index.jsp" method="post">
			<input type="hidden" name="url" value="verifyPurchase.jsp" />
			<input type="hidden" name="type" value="product" />
			<input type="hidden" name="purchaseid" value="<%=purchaseid %>" />
			<tr><td colspan="2"><input type="submit" name="submit" value="Valid" />
			<input type=submit name="submit" value="Invalid" />
			<input type=submit name="submit" value="Delete" />			
			<input type=submit name="submit" value="Cancel" /></td></tr>
			</form>
			</table>
			<%
		}
		else
			out.println("Not Found");
	}	
}
else
	out.println("Not a valid login");
%>	
</body>
</html>

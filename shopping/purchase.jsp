<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* , java.util.*, java.text.*" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Online Shopping</title>
</head>
<%@ include file="validUser.jsp" %>
<%@ include file="connection.jsp" %>
<body>
<script language="javascript">
function validate()
{
if(document.purchase.pno.value.length<1)
{
	alert("Empty No.");
	document.purchase.pno.focus();
	return false;
}
return true;
}
</script>
<%
String uri="index.jsp";
if(validUser(session,false))
{
	int pid=Integer.parseInt(request.getParameter("pid"));
	String user=(String) session.getAttribute("user");
	String submit=(String) request.getParameter("submit");
	if(submit!=null && submit.equals("Cancel"))
		{
		String link=uri;
		link+="?url=dispItem.jsp?pid=0";%>
		<%@ include file="closeConnection.jsp" %>
		<jsp:forward page="<%=uri %>" />
		<%
		}
	if(submit!=null && submit.equals("Purchase"))
	{
		String paytype= request.getParameter("paytype");
		String pno= request.getParameter("pno");	
		String ptype="c";
		Calendar currentDate = Calendar.getInstance();
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
		String dop = formatter.format(currentDate.getTime());
		String reason=null;
		st=con.createStatement();
		try{
		st.executeUpdate("insert into purchase values(0,"+pid+",'"+user+"','"+dop+"','"+paytype+"','"+pno+"','"+ptype+"','"+reason+"')");
		st.executeUpdate("update product set stock=stock-1 where pid="+pid);
		out.println("\nUPDATED ");
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}
	else
	{
		if( pid!=0 && user!=null)
		{
		int stock=Integer.parseInt(request.getParameter("stock"));
		if(stock<5)
			out.println("<h1>Stock of this product is not available currently, please try in two days</h1>");
		else
		{
		%>
			<form action="<%=uri %>" name="purchase" method="post">
			<input type="hidden" name="url" value="purchase.jsp" />
			<input type="hidden" name="pid" value="<%=pid %>" />
			<table><tr><td colspan="2"><h1>Purchase</h1></td></tr>
			<tr><td>Payment Type</td><td><select name="paytype">
			<option selected="selected" value="cc">Credit Card</option>
			<option value="db">Debit Card</option>
			<option value="bank">Bank Tranfer</option>
			</select>
			</td></tr>
			<tr><td>NO.</td><td><input type="text" name="pno" /></td></tr>
			<tr><td></td><td><input type="submit" value="Purchase" name="submit" /><input type="submit" value="Cancel" name="submit" />				
			</td></tr>
			</table>
			</form>
		<%
		}
		}
		else
		{
			out.println("<h1>NOT VALID</h1>");
		}
	}
}
else
{
out.println("<h1>You not authorized<h1>");
}
%>
</body>
</html>

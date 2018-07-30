<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@ include file="connection.jsp" %>
<%! String user;
String passwd; 
String action; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Online Shopping</title>
</head>
<%
user=request.getParameter("name");
passwd=request.getParameter("passwd");

if (user != null) {
try {
st=con.createStatement();
rst=st.executeQuery("select * from login where user='"+user+"' and passwd='"+passwd+"'"); 
}
catch(Exception e)
{
	out.println(e.getMessage());
}
if(rst.next())
{
session.putValue("user",user);
String role=rst.getString("role");
session.putValue("role",role);
}

String action=request.getParameter("action");
if(action!=null)
{
String link=action;
link+=".jsp";
response.sendRedirect(link);
}
}
else
{
action=request.getParameter("action");
if(action==null)
	action="next";
%>
<form action="index.jsp" method="get">
<input type="hidden" name="url" value="login.jsp" />
<input type="hidden" name="action" value="<%=action%>"/>
<table>
<tr><td>User Name</td><td><input type="text" name="name" /></td></tr>
<tr><td>Password</td><td><input type="password" name="passwd" /></td></tr>
<tr><td></td><td><input type="submit" name="submit" value="OK"/> <input type="reset" value="Clear"/>
</td></tr>
<tr><td></td><td><b><a href="submitUser.jsp" > Register for New Account</a></b></td></tr>
</table>
</form>
<%}%>
<body>
</body>
</html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Online Shopping</title>
</head>
<body>
<%
String user=(String)session.getValue("role");
if(user==null) {
%>
<h1>You are not a valid user.</h1>
<p> If you are already user please <a href="index.jsp?url=login.jsp">Login</a><br /></p>
<p> For new user, <a href="index.jsp?url=submitUser.jsp">Create a new user account</a>
<% }
else
{

} %>
</body>
</html>

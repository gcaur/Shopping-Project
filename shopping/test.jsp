<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Online Shopping</title>
</head>
<%
String submit=request.getParameter("submit");
out.println(submit);
%>
<form action="index.jsp?url=dispCustomer.jsp">
<input type="submit" name="submit" value="add"/>
<input type="submit" name="submit"	value="cancel" />
</form>
<body>
</body>
</html>

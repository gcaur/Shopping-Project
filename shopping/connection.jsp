<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp"%> 
<%  
String driver="com.mysql.jdbc.Driver"; 
Connection con=null;
ResultSet rst=null;
Statement st=null;

Class.forName(driver).newInstance();

try {
con=DriverManager.getConnection("jdbc:mysql://localhost/shopping","root","");
}
catch(Exception e)
{
out.println(e.getMessage());
}
%>

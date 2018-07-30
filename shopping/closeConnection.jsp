<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<%
if(rst!=null)
rst.close();
if(st!=null)
st.close();
con.close();
%>
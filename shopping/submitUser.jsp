<%@ page language="java" import="java.sql.*" errorPage="error.jsp"%>
<%@ include file="connection.jsp" %>
<script language="javascript">
function validate()
{
if(document.register.login.value.length<1)
{
	alert("Empty Login ID");
	document.register.login.focus();
	return false;
}
if(document.register.name.value.length<1)
{
	alert("Empty User Name");
	document.register.name.focus();
	return false;
}
if(document.register.pass.value.length<1)
{
	alert("Empty Password");
	document.register.pass.focus();
	return false;
}
return true;
}
</script>
<%
String submit=request.getParameter("submit");
if(submit!=null && submit.equals("Cancel"))
{
%>	
			<jsp:forward page="index.jsp?url=login.jsp" />
<%	
}
else
if(submit!=null && submit.equals("Register")) {
try {
String login=request.getParameter("login");
String pass=request.getParameter("pass");
String role="user";
String name=request.getParameter("name");
st=con.createStatement();
st.executeUpdate("insert into login values('"+login+"','"+name+"','"+pass+"','"+role+"')");
}
catch( Exception e)
{
out.println("error:"+e.toString());
}
%>	
			<jsp:forward page="index.jsp?url=login.jsp" />
<%	
}
else 
{
%>
<form action="index.jsp" name="register" method="post">
<input type="hidden" name="url" value="submitUser.jsp" />
<table>
<tr><td><b>Login Name: </b></td><td><input type="text" name="login" /></td></tr>
<tr><td><b>Complete Name: </b></td><td><input type="text" name="name" /></td></tr>
<tr><td><b>Password: </b></td><td><input type="password" name="pass" /></td></tr>
<tr><td></td><td><input type="submit" name="submit" value="Register" onclick="return validate();" />
<input type="submit" name="submit" value="Cancel" /></td></tr>
</table>
</form>
<% 
}
%>
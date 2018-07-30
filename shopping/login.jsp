<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<%! String user;
String passwd; 
String action;
String type; %>
<%@ include file="connection.jsp" %>
<%@ include file="validUser.jsp" %>
<script language="javascript">
function validate()
{
if(document.login.user.value.length<1)
{
	alert("Empty Login Name");
	document.login.user.focus();
	return false;
}
if(document.login.passwd.value.length<1)
{
	alert("Empty Password");
	document.edit.passwd.focus();
	return false;
}
return true;
}
</script>
<%
user=request.getParameter("user");
passwd=request.getParameter("passwd");
type=request.getParameter("type");
if(type==null)
{
	type="product";
}
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
		String link="index.jsp?url="+action;
		link+=".jsp&type="+type;
		%>
			<jsp:forward page="<%=link%>" />
		<%
	}
}
else
{
	action=request.getParameter("action");
	if(action==null)
		action="next";
	%>
	<form action="index.jsp?type=<%=type %>&url=login.jsp" method="post" name="login">
	<input type="hidden" name="url" value="login.jsp" />
	<input type="hidden" name="action" value="<%=action%>"/>
	<table>
	<tr><td>User Name</td><td><input type="text" name="user" /></td></tr>
	<tr><td>Password</td><td><input type="password" name="passwd" /></td></tr>
	<tr><td></td><td><input type="submit" name="submit" value="OK" onclick="return validate();"/> 
	<input type="reset" value="Clear" />
	</td></tr>
	<tr><td></td><td><b><a href="index.jsp?url=submitUser.jsp" > Register for New Account</a></b></td></tr>
	</table>
	</form>
	<%
}
	%>
<%@ include file="closeConnection.jsp" %>

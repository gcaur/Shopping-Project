<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<%!
 boolean validUser(HttpSession session, boolean admin)
{
	String user=(String) session.getAttribute("user");
	String role=(String) session.getAttribute("role");
	
	if(user!=null && role!=null)
	{
		if(admin)
		{
			if(role.equals("manager"))
				return true;
			return false;
		}
		return true;
	}
	else
		return false;
}

%>
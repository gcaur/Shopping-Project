<style>
ul {
  font-family: Arial, Verdana;
  font-size: 14px;
  margin: 0;
  padding: 0;
  list-style: none;
}
ul li {
  display: block;
  position: relative;
  float: left;
  width:204.8px;
  text-align:center;

  
}
li ul { display: none; }
ul li a {
  display: block;
  text-decoration: none;
  color: #ffffff;
  border-top: 1px solid #ffffff;
  padding: 5px 15px 5px 15px;
  background: #794003;
  margin-left: 1px;
  white-space: nowrap;
  color:#fdf996;
  font-family:Comic Sans MS;
  border: 1.5px solid #000000;
  
}
ul li a:hover { background: #c18b50; }
li:hover ul {
  display: block;
  position: absolute;
}
li:hover li {
  float: none;
  font-size: 11px;
}
li:hover a { background: #794003; }
li:hover li a:hover { background: #c18b50; }
</style>
<table width="1024" border="0" cellpadding="0" cellspacing="0" align="center">
  <!--DWLayoutTable-->
    <tr>
    <td height="44" valign="top">
	<ul div="nav">
	<li><a href="login.jsp">HOME</a>
	<li><a href="#">MY PROFILE</a>
	<ul>
	<% if(validUser(session))
	{
	%>
		<li><a href="http://localhost:8080/exam/logout.jsp">LOG OUT </a></li>
	<%
	}
	else
	{
	%>
		<li><a href="http://localhost:8080/exam/login.jsp">LOG IN</a></li>
		<li><a href="http://localhost:8080/exam/register.jsp">SIGN UP</a></li>
	<%
	}
	if(!validUser(session,true))
	{
	%>
	</ul>
	</li>
	<li><a href="http://localhost:8080/exam/notice.jsp">NOTICES</a></li>
	<li><a href="http://localhost:8080/exam/contact.jsp">CONTACT US</a></li>
	<li><a href="http://localhost:8080/exam/about.jsp">ABOUT US</a></li>
	<%
	}
	if(validUser(session,true))
	{
	%>
	</ul>
	</li>
	<li><a href="http://localhost:8080/exam/course.jsp">COURSES</a></li>
	<li><a href="http://localhost:8080/exam/paperlist.jsp?type=question">QUESTIONS</a></li>
	<li><a href="http://localhost:8080/exam/reports.jsp">REPORTS</a></li>
	<%
	}
	%>
	</li>
</ul>
	&nbsp;</td>
  </tr>
</table>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
	
    <title>Admin Section</title>
    <style type="text/css">
    /*<![CDATA[*/
      body {
          color: #000000;
          background-color: #FFFFFF;
	  font-family: Arial, "Times New Roman", Times, serif;
          margin: 10px 0px;
      }

    img {
       border: none;
    }
    
    a:link, a:visited {
        color: blue
    }

    th {
        font-family: Verdana, "Times New Roman", Times, serif;
        font-size: 110%;
        font-weight: normal;
        font-style: italic;
        background: #D2A41C;
        text-align: left;
    }

    td {
        color: #000000;
	font-family: Arial, Helvetica, sans-serif;
    }
    
    td.menu {
        background: #FFDC75;
    }

    .center {
        text-align: center;
    }

    .code {
        color: #000000;
        font-family: "Courier New", Courier, monospace;
        font-size: 110%;
        margin-left: 2.5em;
    }
    
     #banner {
        margin-bottom: 12px;
     }

     p#congrats {
         margin-top: 0;
         font-weight: bold;
         text-align: center;
     }

     p#footer {
         text-align: right;
         font-size: 80%;
     }
     /*]]>*/
    </style>
</head>

<body>
<% 

String url=request.getParameter("url");
String type=request.getParameter("type"); %>

<!-- Header -->
<table id="banner" width="100%">
    <tr>
      <td align="left" style="width:10px">
             <img src="tomcat.gif" height="92" width="130" alt=""/>
      </td>
      <td align="left" valign="top"></td>
      <td width="640" align="right">
           <h1><strong>Administration Page of Online Shopping </strong> </h1>
        </td>
  </tr>
</table>

<table>
    <tr>

        <!-- Table of Contents -->
        <td width="217" valign="top">
            <table width="100%" border="1" cellspacing="0" cellpadding="3">
                <tr>
		  <th>Administration</th>
                </tr>
                <tr>
		  <td class="menu"><a href="admin.jsp?url=dispCustomer.jsp&type=customer" >Customer</a><br/>
		  <a href="admin.jsp?url=dispItem.jsp&type=product">Product</a><br/>
		  <%@ include file="connection.jsp" %>
<%@ include file="validUser.jsp" %>
<%		  if(validUser(session,false))
{
%>
		  <a href="admin.jsp?url=logout.jsp">LogOut</a><br/>
<% 
} 
%>
                  </td>
                </tr>
            </table>
	    <br />
<% 
if (validUser(session,true))
{
	if(type!=null && type.equals("customer"))
	{
	%>
		    <table width="100%" border="1" cellspacing="0" cellpadding="3">
            <tr><th>Customer</th></tr>
		 <tr><td class="menu"><a href="admin.jsp?url=submitUser.jsp&type=customer">Add Customer</a></td></tr>
		<tr><td class="menu"><a href="admin.jsp?url=eCustomer.jsp&type=customer&query=edit">Edit Customer</a></td></tr>
		<tr><td class="menu"><a href="admin.jsp?url=eCustomer.jsp&type=customer&query=delete">Delete Customer</a></td></tr>
		<tr><td class="menu"><a href="admin.jsp?url=eCustomer.jsp&type=customer&query=role">Add or Change Role</a></td></tr>
		<tr><td class="menu"><a href="admin.jsp?url=eCustomer.jsp&type=customer&query=detail">Customer Details</a></td></tr>
        </table>
	<%
	}
	if(type!=null && type.equals("product"))
	{
	%>
		    <table width="100%" border="1" cellspacing="0" cellpadding="3">
            <tr><th>Product</th></tr>
	 		<tr><td class="menu"><a href="admin.jsp?url=addProduct.jsp&type=product">Add Product</a></td></tr>
			<tr><td class="menu"><a href="admin.jsp?url=eProduct.jsp&type=product&query=edit">Edit Product</a></td></tr>
			<tr><td class="menu"><a href="admin.jsp?url=eProduct.jsp&type=product&query=delete">Delete Product</a></td></tr>
			<tr><td class="menu"><a href="admin.jsp?url=eProduct.jsp&type=product&query=price">Change Price</a></td></tr>
			<tr><td class="menu"><a href="admin.jsp?url=eProduct.jsp&type=product&query=detail">Product Details</a></td></tr>
			</table>
	<%
	}
}
	%>	    
    <br/>

<%
if (validUser(session,false))
{
	if(type!=null && type.equals("user"))
	{
	%>
		  <table width="100%" border="1" cellspacing="0" cellpadding="3">
                <tr>
		  <th>Customer</th>
                </tr>
		 <tr><td class="menu"><a href="admin.jsp?url=submitUser.jsp&type=customer">Add Customer</a></td></tr>
		<tr><td class="menu"><a href="admin.jsp?url=eCustomer.jsp&type=customer&query=edit">Edit Customer</a></td></tr>
		<tr><td class="menu"><a href="admin.jsp?url=eCustomer.jsp&type=customer&query=delete">Delete Customer</a></td></tr>
		<tr><td class="menu"><a href="admin.jsp?url=eCustomer.jsp&type=customer&query=role">Add or Change Role</a></td></tr>
		<tr><td class="menu"><a href="admin.jsp?url=eCustomer.jsp&type=customer&query=detail">Customer Details</a></td></tr>
        </table>
	<%
	}
}
%>
            <table width="100%" border="1" cellspacing="0" cellpadding="3">
                <tr>
                  <th>Tomcat Online</th>
                </tr>
                <tr>
                  <td class="menu">&nbsp;</td>
                </tr>
            </table>
	    
            <br/>
            <table width="100%" border="1" cellspacing="0" cellpadding="3">
                <tr>
		  <th>Miscellaneous</th>
                </tr>
                <tr>
                  <td class="menu"><br/>
    		    &nbsp;
                  </td>
                </tr>
            </table>
      </td>

        <td width="20" style="width:20px">&nbsp;</td>
	
        <!-- Body -->
        <td width="534" align="left" valign="top">
          <p id="congrats">&nbsp;</p>
 <%
 if(url==null)
 	%>
		<h1>Welcome Admin</h1>
	<%
	 if(url!=null)
 {
 String link="\""+url+"\"";
 %>
<jsp:include page="<%=url%>" >
<jsp:param name="type" value="<%=type %>" />
</jsp:include>
 <%
 }
%>
 
          <p id="footer"><br/>
	    &nbsp;

	    Copyright &copy; 1999-2011 Mega Software Foundation<br/>
            All Rights Reserved
          </p>
      </td>

    </tr>
</table>

</body>
</html>

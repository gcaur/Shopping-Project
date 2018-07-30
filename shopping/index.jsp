<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %>
<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
	
    <title>Online Shopping</title>
    <style type="text/css">
    /*<![CDATA[*/
      body {
	color: #000000;
	background-color: #FFFFFF;r
	font-family: Arial, "Times New Roman", Times, serif;
	background-image: url(shopping.jpg);
	margin-top: 10px;
	margin-right: 75px;
	margin-bottom: 10px;
	margin-left: 75px;
	background-position: 75px 50px;
	background-repeat: no-repeat;
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
<%@ include file="validUser.jsp" %>
<%@ include file="connection.jsp" %>
<% 
String url=request.getParameter("url");
String type=request.getParameter("type"); 
%>
<!-- Header -->
<table id="banner" width="100%">
    <tr>
       <td width="640" align="left" valign="top">
	   <% if(validUser(session,true))
		{
		%>
		<h1><strong>Administration Page of Online Shopping </strong> </h1>
		<%
		}
		else
		{
		%>
		   <h1><strong>Welcome to Online Shopping </strong> </h1>
        <%
		}
		%></td>
      <td align="right">
		</td>
  </tr>
</table>
<table width="100%" cellspacing="0" cellpadding="3">
<tr><td class="menu">
<a href="index.jsp?url=dispItem.jsp&type=product">Product List</a>
<%
if(validUser(session,false) || validUser(session,true))
{
	String user=session.getAttribute("user").toString();
	%>
	| <a href="index.jsp?url=dispCustomer.jsp&type=customer&user=<%=user %>" >User Profile</a>
	<%
		if(validUser(session,true))
	{
	%>
	| <a href="index.jsp?url=dispStock.jsp&type=stock" >Stock Management</a>
	| <a href="index.jsp?url=dispPurchase.jsp&type=purchase" >Sales Management</a>
	  <%
	  }
	  else
	  {	 
	  %>
	| <a href="index.jsp?url=dispPurchase.jsp&type=purchase" >My Purchase</a>
	  <%
	  }
	  %>
	| <a href="index.jsp?url=logout.jsp">Log Out</a><br/>
<% 
}
else
{ 
%>
	 | <a href="index.jsp?url=login.jsp&type=product">Log In</a><br/>
<%
} 
%>
                  </td>
                </tr>
            </table>

<hr />
<table>
    <tr>
        <!-- Table of Contents -->
        <td width="217" valign="top">
            <table width="100%" border="1" cellspacing="0" cellpadding="3">
                <tr>
		  <th>Main Menu</th>
                </tr>
                <tr>
		  <td class="menu">
		  <a href="index.jsp?url=dispItem.jsp&type=product">Product List</a><br/>
<%
if(validUser(session,false) || validUser(session,true))
{
String user=session.getAttribute("user").toString();
%>
		  <a href="index.jsp?url=dispCustomer.jsp&type=customer&user=<%=user %>" >User Profile</a>
		  <br/>
		  <%
		  if(validUser(session,true))
		  {
		  %>
		  <a href="index.jsp?url=dispStock.jsp&type=stock" >Stock Management</a>
		  <br/>
		  <a href="index.jsp?url=dispPurchase.jsp&type=purchase" >Sales Management</a>
		  <br/>
		  <%
		  }
		  else
		  {	 
		  %>
		  <a href="index.jsp?url=dispPurchase.jsp&type=purchase" >My Purchase</a>
		  <br/>
		  <%
		  }
		  %>
		  <a href="index.jsp?url=logout.jsp">Log Out</a><br/>
<% 
}
else
{ 
%>
	  <a href="index.jsp?url=login.jsp&type=product">Log In</a><br/>
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
		 <tr><td class="menu"><a href="index.jsp?url=submitUser.jsp&type=customer">Add Customer</a></td></tr>
		<tr><td class="menu"><a href="index.jsp?url=eCustomer.jsp&type=customer&query=edit">Edit Customer</a></td></tr>
		<tr><td class="menu"><a href="index.jsp?url=eCustomer.jsp&type=customer&query=delete">Delete Customer</a></td></tr>
		<tr><td class="menu"><a href="index.jsp?url=eCustomer.jsp&type=customer&query=role">Add or Change Role</a></td></tr>
		<tr><td class="menu"><a href="index.jsp?url=eCustomer.jsp&type=customer&query=detail">Customer Details</a></td></tr>
        </table>
	<%
	}
	if(type!=null && type.equals("product"))
	{
	%>
		    <table width="100%" border="1" cellspacing="0" cellpadding="3">
            <tr><th>Product</th></tr>
	 		<tr><td class="menu"><a href="index.jsp?url=addProduct.jsp&type=product">Add Product</a></td></tr>
			<tr><td class="menu"><a href="index.jsp?url=eProduct.jsp&type=product&query=edit">Edit Product</a></td></tr>
			<tr><td class="menu"><a href="index.jsp?url=eProduct.jsp&type=product&query=delete">Delete Product</a></td></tr>
			<tr><td class="menu"><a href="index.jsp?url=eProduct.jsp&type=product&query=price">Change Price</a></td></tr>
			<tr><td class="menu"><a href="index.jsp?url=eProduct.jsp&type=product&query=detail">Product Details</a></td></tr>
			<tr><td class="menu"><a href="index.jsp?url=dispItem.jsp&type=product">Product List</a></td></tr>
			</table>
<%
	}
	if(type!=null && type.equals("stock"))
	{
	%>
			<table width="100%" border="1" cellspacing="0" cellpadding="3">
                <tr>
		  <th>Stock Management</th>
                </tr>
		<tr><td class="menu"><a href="index.jsp?url=addStock.jsp&type=stock">Add Stock</a></td></tr>
		<tr><td class="menu"><a href="index.jsp?url=searchStock.jsp&type=stock">Display Stock</a></td></tr>
		<tr><td class="menu"><a href="index.jsp?url=dispStock.jsp&type=stock">Stock Details</a></td></tr>
		<tr><td class="menu"><a href="index.jsp?url=lowStock.jsp&type=stock">Low Stocks</a></td></tr>
		<tr><td class="menu"><a href="index.jsp?url=dispPurchase.jsp&type=stock">Purchase List</a></td></tr>
        </table>
	<%
	}
	if(type!=null && type.equals("purchase"))
	{
	%>
			<table width="100%" border="1" cellspacing="0" cellpadding="3">
                <tr>
		  <th>Sales Management</th>
                </tr>
	<tr><td class="menu"><a href="index.jsp?url=dispPurchase.jsp&type=purchase&ptype=a">Purchase List</a></td></tr>
	<tr><td class="menu"><a href="index.jsp?url=dispPurchase.jsp&type=purchase&ptype=n">Invalid Purchase List</a></td></tr>
	<tr><td class="menu"><a href="index.jsp?url=dispPurchase.jsp&type=purchase&ptype=v">Valid Purchase</a></td></tr>
	<tr><td class="menu"><a href="index.jsp?url=dispPurchase.jsp&type=purchase&ptype=c">New Purchase</a></td></tr>
        </table>
	<%
	}
}
	%>	    
    <br/>

<%
if(validUser(session,false))
{
String role=session.getAttribute("role").toString();
if (role.equals("user"))
{
	if(type!=null && type.equals("user"))
	{
	%>
		  <table width="100%" border="1" cellspacing="0" cellpadding="3">
                <tr>
		  <th>Customer</th>
                </tr>
		 <tr><td class="menu"><a href="index.jsp?url=submitUser.jsp&type=customer">Add Customer</a></td></tr>
		<tr><td class="menu"><a href="index.jsp?url=eCustomer.jsp&type=customer&query=edit">Edit Customer</a></td></tr>
		<tr><td class="menu"><a href="index.jsp?url=eCustomer.jsp&type=customer&query=delete">Delete Customer</a></td></tr>
		<tr><td class="menu"><a href="index.jsp?url=eCustomer.jsp&type=customer&query=role">Add or Change Role</a></td></tr>
		<tr><td class="menu"><a href="index.jsp?url=eCustomer.jsp&type=customer&query=detail">Customer Details</a></td></tr>
        </table>
	<%
	}
	if(type!=null && type.equals("purchase"))
	{
	%>
			<table width="100%" border="1" cellspacing="0" cellpadding="3">
                <tr>
		  <th>Purchase Management</th>
                </tr>
	<tr><td class="menu"><a href="index.jsp?url=dispPurchase.jsp&type=purchase&ptype=a">Purchase List</a></td></tr>
	<tr><td class="menu"><a href="index.jsp?url=dispPurchase.jsp&type=purchase&ptype=n">Invalid Purchase List</a></td></tr>
	<tr><td class="menu"><a href="index.jsp?url=dispPurchase.jsp&type=purchase&ptype=v">Valid Purchase</a></td></tr>
	<tr><td class="menu"><a href="index.jsp?url=dispPurchase.jsp&type=purchase&ptype=c">New Purchase</a></td></tr>
        </table>
	<%
	}
}
}
%>
      </td>

        <td width="20" style="width:20px">&nbsp;</td>
	
        <!-- Body -->
        <td width="534" align="left" valign="top">
          <p id="congrats">&nbsp;</p>
 <%
 	if(url==null)
 	{
	%>
		<h1>Welcome index</h1>
	<%
	}
	else
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
          </p>
      </td>

    </tr>
</table>

</body>
</html>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage = "error.jsp" %>
<%@ page import="swsec.*" %>
<%@page import="java.sql.*;" %>
	
	<%-- Added by gonch -- POST CONTROL  --%>
    <% 
    if(SessionControl.isExpiredAdmin(session)) //controls if the last admin session was expired
	{
			response.sendRedirect("./logout.jsp");
	}
	else
	{
	
	    //control that the using method is POST
	    if(request.getMethod().compareToIgnoreCase("POST")==0)
		{
	    	String user = request.getParameter("user");
	    	Query.deleteUser(user);
		%>
		
		<%@page contentType="text/html" pageEncoding="UTF-8"%>
		<!DOCTYPE html>
		<html>
		    <head>
		        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		        <meta http-equiv="refresh" content="5;url=manageUsers.jsp"> 
		        <link rel="stylesheet" type="text/css" href="lutstyle.css">
		        <title>User deleted!</title>
		    </head>
		    <body>
		        <h1><%out.print(user); %> deleted!</h1>
			</body>
		</html>
	<%-- Added by crygiova -- POST CONTROL  --%>
	<%
		}
	//if not method POST
	else
	{
	
		//general jsp exception throw -> A generic exception known to the JSP engine; uncaught JspExceptions will result in an invocation of the errorpage machinery. 
		throw new JspException("Wrong Method! U r using GET and not POST");  
  	}
}
	%>
	

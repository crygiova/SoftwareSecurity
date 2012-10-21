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
	    	String schoolFull = request.getParameter("school_full");
	    	String schoolShort = request.getParameter("school_short");
	    	String city = request.getParameter("city");
	    	String zip = request.getParameter("zip");
	    	String countryShort = request.getParameter("country_short");
	    	boolean invalidString;
	    	boolean empty = false;
	    	if(!schoolFull.matches(("^[A-Za-z0-9 _]*[A-Za-z0-9][A-Za-z0-9 _]*$")) || schoolFull.length()==0)
	    	{
	    		response.sendRedirect("./error.jsp"); //Invalid school full name
	    	}
	    	else if(!schoolShort.matches(("^[A-Za-z0-9 _]*[A-Za-z0-9][A-Za-z0-9 _]*$")) || schoolShort.length()==0)
	    	{
	    		response.sendRedirect("./error.jsp"); //Invalid school short name
	    	}
	    	else if(!city.matches(("^[A-Za-z0-9 _]*[A-Za-z0-9][A-Za-z0-9 _]*$")) || city.length()==0)
	    	{
	    		response.sendRedirect("./error.jsp"); //Invalid city name
	    	}
	    	else if(!zip.matches(("^[A-Za-z0-9 _]*[A-Za-z0-9][A-Za-z0-9 _]*$")) || zip.length()==0)
	    	{
	    		response.sendRedirect("./error.jsp"); //Invalid zip code
	    	}
	    	else if(!countryShort.matches(("^[A-Za-z0-9 _]*[A-Za-z0-9][A-Za-z0-9 _]*$")) || countryShort.length()==0)
	    	{
	    		response.sendRedirect("./error.jsp"); //Invalid country short name
	    	}
	    	else 
	    	{
	    		Query.insertSchool(schoolFull,schoolShort,city,zip,countryShort);
	    	}
		%>
		
		<%@page contentType="text/html" pageEncoding="UTF-8"%>
		<!DOCTYPE html>
		<html>
		    <head>
		        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		        <meta http-equiv="refresh" content="5;url=manageSchools.jsp"> 
		        <link rel="stylesheet" type="text/css" href="lutstyle.css">
		        <title>Country added!</title>
		    </head>
		    <body>
		        <h1><%out.print(schoolFull); %> (<%out.print(schoolShort); %>)  added!</h1>
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
	

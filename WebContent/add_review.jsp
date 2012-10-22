<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="csrf" 
	uri="http://www.owasp.org/index.php/Category:OWASP_CSRFGuard_Project/Owasp.CsrfGuard.tld" %>
<%@page errorPage = "error.jsp" %>
<%@ page import="swsec.*" %>
<%@page import="java.sql.*;" %>
	
	<%-- Added by crygiova -- POST CONTROL  --%>
    <% 
    //control that the using method is POST
    if(request.getMethod().compareToIgnoreCase("POST")==0)
	{
    	String school_id = request.getParameter("school_id");
    	String name = request.getParameter("name");
    	String review = request.getParameter("review");
    	boolean invalidString;
    	boolean empty = false;
    	if(!name.matches(("^[a-zA-Z0-9]+$")) || name.length()==0)
    	{
    		response.sendRedirect("./error.jsp"); //Invalid user name
    	}
    	else if(!review.matches("^[A-Za-z0-9 _]*[A-Za-z0-9][A-Za-z0-9 _]*$") || review.length()==0)
    	{
    		response.sendRedirect("./error.jsp"); //Invalid review chars
    	}
    	else if(!school_id.matches("^[a-zA-Z0-9]+$") || review.length()==0)
		{
			response.sendRedirect("./error.jsp"); //Invalid school ID
		}
    	else {
    		Query.insertReview(school_id, name, review);
    	}
	%>
		
		<%@page contentType="text/html" pageEncoding="UTF-8"%>
		<!DOCTYPE html>
		<html>
		    <head>
		        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		        <meta http-equiv="refresh" content="5;url=index.jsp"> 
		        <link rel="stylesheet" type="text/css" href="lutstyle.css">
		        <title>Review added!</title>
		    </head>
		    <body>
		        <h1>Thanks <%out.print(name); %>!</h1>
		        Your contribution is appreciated.<br>
		        You will be redirected to the LUT2.0 main page in a few seconds.
		    </tr>
		    <jsp:include page="loginButton.jsp" flush="true"/>
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
	%>
	

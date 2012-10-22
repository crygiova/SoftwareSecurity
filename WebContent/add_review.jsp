
<%@page errorPage = "error.jsp" %>
<%@ page import="swsec.*" %>
<%@page import="java.sql.*;" %>
	
	<%-- Added by crygiova -- POST CONTROL  --%>
    <% 
    //control that the using method is POST
    if(SessionControl.isExpired(session))
    {
    	response.sendRedirect("./logoutUsers.jsp");
    }
    else if(request.getMethod().compareToIgnoreCase("POST")==0)
	{
    	String school_id = request.getParameter("school_id");
    	String review = request.getParameter("review");
    	String name = session.getAttribute("login").toString();
    	boolean invalidString;
    	boolean empty = false;
    	if(!review.matches("^[A-Za-z0-9 _]*[A-Za-z0-9][A-Za-z0-9 _]*$") || review.length()==0)
    	{
    		response.sendRedirect("./error.jsp"); //Invalid review chars
    	}
    	else if(!school_id.matches("^[a-zA-Z0-9]+$") || review.length()==0)
		{
			response.sendRedirect("./error.jsp"); //Invalid school ID
		}
    	else
    	{
    		Query.insertReview(school_id, name, review);
    	}
	%>
		
		<%@page contentType="text/html" pageEncoding="UTF-8"%>
		<!DOCTYPE html>
		<html>
		    <head>
		        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		        <link rel="stylesheet" type="text/css" href="lutstyle.css">
		        <title>Review added!</title>
		    </head>
		    <body>
		        <h1>Thanks <%out.print(name); %>!</h1>
		        Your contribution is appreciated.<br>
		        You will be redirected to the LUT2.0 main page in a few seconds.
		    </tr>
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
	

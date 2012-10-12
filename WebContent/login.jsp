
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage = "error.jsp" %>

	<%-- Added by crygiova -- POST CONTROL  --%>
    <% 
    //NEED TO ADD A CONTROL THAT WE DONT R USING THIS PAGE WITHOUT
    
    
    //control that the using method is POST
    if(request.getMethod().compareToIgnoreCase("POST")==0)
	{ 
	%>
	<%-- Added by gonch -- POST CONTROL --%>
	<%-- Whitelisting of username and password --%>
		<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//regular expr for sql injectoin, we have tu put it intoa constant library so 
		boolean error = false;
		if(username.matches("^[a-zA-Z0-9]+$"))
		{
			//out.println("Valid username: "+ username);
		}
		else
		{
			//out.println("Invalid username: "+username);
			error=true;
		}
		if(password.matches("^[a-zA-Z0-9]+$"))
		{
			//out.println("Valid password: "+ password);
		}
		else
		{
			//out.println("Invalid password:  "+password);
			error=true;
		}
		%>
		<% if(!error)
		{
		%>
		<sql:query var="users" dataSource="jdbc/lut2">
		    SELECT * FROM admin_users
		    WHERE  uname = ? <sql:param value="${param.username}" /> 
		    AND pw = ${param.password}
		</sql:query>
		
		    
		    
		<c:set var="userDetails" value="${users.rows[0]}"/>
		
		<%@page contentType="text/html" pageEncoding="UTF-8"%>
		<!DOCTYPE html>
		<html>
		    <head>
		        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		        <link rel="stylesheet" type="text/css" href="lutstyle.css">
		        <title>LUT Admin pages</title>
		    </head>
		    <body>
		        <c:choose>
		            <c:when test="${ empty userDetails }">
		                Login failed
		            </c:when>
		            <c:otherwise>
		                <h1>Login succeeded</h1> 
		                Welcome ${ userDetails.uname}.<br> 
		                Unfortunately, there is no admin functionality here. <br>
		                You need to figure out how to tamper with the application some other way.
		            </c:otherwise>
		        </c:choose>
		    </body>
		</html>
		<%}
		else
		{
			out.println("Invalid username or Password");
			//throw new JspException("Invalid username or Passowrd");  
		}%>
    <%-- Added by crygiova -- POST CONTROL  --%>
	<%
	}
	//if not method POST
	else
	{
		
		//general jsp exception throw -> A generic exception known to the JSP engine; uncaught JspExceptions will result in an invocation of the errorpage machinery. 
  		//throw new JspException("Wrong Method! U r using GET and not POST");  
  		//Redirect to the page if u r not authenticating in the right way
  		
  		//Need to be made the control for the session, if the session is on or not!
  		response.sendRedirect("./lutadmin.jsp");
	
  	}
	%>
    

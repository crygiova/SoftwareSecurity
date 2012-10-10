<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<%-- Added by crygiova -- POST CONTROL  --%>
    <% 
    //control that the using method is POST
    if(request.getMethod().compareToIgnoreCase("POST")==0)
	{ 
	%>
	<%--  --%>
	
		<sql:transaction dataSource="jdbc/lut2">
		    <sql:update var="count">
		        INSERT INTO user_reviews VALUES ('${param.school_id}', '${param.name}', '${param.review}');
		    </sql:update>
		</sql:transaction>
		
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
		        <h1>Thanks ${param.name}!</h1>
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
	

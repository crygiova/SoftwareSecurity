
<%@ page import="swsec.*" %>
<%@page import="java.sql.*;" %>
	
	<%-- Added by crygiova -- POST CONTROL  --%>
    <% 
    //control that the using method is POST
    if(request.getMethod().compareToIgnoreCase("GET")!=0)
	{ 
    	String school_fullname = request.getParameter("school_fullname");
    	String school_shortname = request.getParameter("school_shortname");
    	String school_id = request.getParameter("school_id");
    	boolean empty = false;
		if(!school_fullname.matches("^[A-Za-z0-9 _]*[A-Za-z0-9][A-Za-z0-9 _]*$")) //also allow spaces!
		{
			response.sendRedirect("./error.jsp");
		}
		ResultSet rs = Query.selectReviews(school_fullname);
		if(!rs.next()) 
		{
			empty = true;
			out.println("No reviews for "+ school_fullname + " yet. Help us out by adding one!"); 
		}
		rs.previous();
    	
	%>
	
		
		<%@page contentType="text/html" pageEncoding="UTF-8"%>
		<!DOCTYPE html>
		<html>
		    <head>
		        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		        <link rel="stylesheet" type="text/css" href="lutstyle.css">
		        <title>Reviews for <% out.print(school_fullname); %></title>
		    </head>
		    <body>
		        <%
		       	if(!empty)
		       	{
		       	%>
		        <h1>Reviews for <% out.print(school_shortname); %></h1>
		        <%
		        }
		       	else out.print("<br><br>");
		        while(rs.next())
		        {
		        	out.print(rs.getString(3));
		        	out.print("<br><br>");
		        	out.print(rs.getString(2));
		        	out.print("<br><br>");
		        }
		        %>

		        <table border="0">
		            <thead>
		                <tr>
		                    <th colspan="2">Help improving LUT2.0 by adding a review of <%out.print(school_shortname); %></th>
		                </tr>
		            </thead>
		            <tbody>
		                <tr>
		                    <td>
		                        <form action="add_review.jsp"  method="POST">
		                            <input type="hidden" name="school_id" value="<%out.print(school_id); %>" />
		                            <textarea name="review" rows=10 cols=60 autofocus="on"></textarea>
		                            <br><br>
		                            Your name: <input type="text" name="name" />
		                            <br><br>
		                            <input type="submit" value="Add review" />
		                         </form>
		                    </td>
		                </tr>
		            </tbody>
		        </table>
		        
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
  		//throw new JspException("Wrong Method! U r using GET and not POST");  
  	
	}
	%>
		

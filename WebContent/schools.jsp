<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage = "error.jsp" %>
<%@ page import="swsec.*" %>
<%@page import="java.sql.*;" %>

	<%-- Added by crygiova -- POST CONTROL  --%>
	<%-- Added by gonch -- POST CONTROL  --%>
    <% 
    //control that the using method is POST
    if(request.getMethod().compareToIgnoreCase("POST")==0)
	{ 
	
		String country_name = request.getParameter("country");
			
		//regular expr for sql injectoin, we have tu put it intoa constant library so 
		if(country_name.matches("^[a-zA-Z0-9]+$"))
		{
			out.println("Correct matching "+country_name);
		}
		else
		{
			out.println("INNNNNNNCorrect matching "+country_name);
		}
		String country = request.getParameter("country");
		ResultSet rs = Query.SelectSchools(country);
//		out.print(rs.);
		
	%>
	<%-- --%>
		
		<%@page contentType="text/html" pageEncoding="UTF-8"%>
		<!DOCTYPE html>
		<html>
		    <head>
		        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		        <link rel="stylesheet" type="text/css" href="lutstyle.css">
		        <title>LUT 2.0 - <% out.print(country); %>  </title>
		    </head>
		    <body>
		        <h1> Approved schools in <% out.print(country); %></h1>
		        <br><br>
		        <%
		        while(rs.next())
		        {		        
		        %>
		
		            <table border="0">
		                <thead>
		                    <tr>
		                        <th colspan="2"><%=rs.getString(1) %></th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <tr>
		                        <td><strong>Nickname: </strong></td>
		                        <td><span style="font-size:smaller; font-style:italic;"><%=rs.getString(4) %></span></td>
		                    </tr>
		                    <tr>
		                        <td><strong>Address: </strong></td>
		                        <td><%= rs.getString(5)%>
		                            <br>
		                            <span style="font-size:smaller; font-style:italic;">
		                                zip: <%= rs.getString(6)%></span>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td>
		                            <form action="school_reviews.jsp" method="POST">
		                                <input type="hidden" name="school_id" value="<%= rs.getString(2)%>" />
		                                <input type="hidden" name="school_fullname" value="<%= rs.getString(1)%>" />
		                                <input type="hidden" name="school_shortname" value="<%= rs.getString(4)%>" />
		                                <input type="submit" value="Read reviews" />
		                            </form>
		                        </td>
		                    </tr>
		                </tbody>
		            </table>
		        <%
		        }
		        %>
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
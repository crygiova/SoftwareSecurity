<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage = "error.jsp" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

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
		//white list;

		String query = "SELECT * FROM country, school WHERE school.country = country.short_name AND country.full_name = ?";
		PreparedStatement pstmt;
	// = connection.prepareStatement(query);
	//	pstmt.setString(1,country_name);
	//	ResultSet result = pstmt.executeQuery();
	//	out.println("--"+result.getString(0)+"--");
	%>
	<%--  --%>

		<sql:query var="school" dataSource="jdbc/lut2">
		    SELECT * FROM country, school
		    WHERE school.country = country.short_name
		    AND country.full_name = ? <sql:param value="${param.country}"/>
		</sql:query>
		
		<%@page contentType="text/html" pageEncoding="UTF-8"%>
		<!DOCTYPE html>
		<html>
		    <head>
		        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		        <link rel="stylesheet" type="text/css" href="lutstyle.css">
		        <title>LUT 2.0 - ${param.country}</title>
		    </head>
		    <body>
		        <h1> Approved schools in ${param.country}</h1>
		        <br><br>
		        <c:forEach var="schoolDetails" items="${school.rowsByIndex}">
		
		            <table border="0">
		                <thead>
		                    <tr>
		                        <th colspan="2">${schoolDetails[3]}</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <tr>
		                        <td><strong>Nickname: </strong></td>
		                        <td><span style="font-size:smaller; font-style:italic;">${schoolDetails[4]}</span></td>
		                    </tr>
		                    <tr>
		                        <td><strong>Address: </strong></td>
		                        <td>${schoolDetails[5]}
		                            <br>
		                            <span style="font-size:smaller; font-style:italic;">
		                                zip: ${schoolDetails[6]}</span>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td>
		                            <form action="school_reviews.jsp" method="POST">
		                                <input type="hidden" name="school_id" value="${schoolDetails[2]}" />
		                                <input type="hidden" name="school_fullname" value="${schoolDetails[3]}" />
		                                <input type="hidden" name="school_shortname" value="${schoolDetails[4]}" />
		                                <input type="submit" value="Read reviews" />
		                            </form>
		                        </td>
		                    </tr>
		                </tbody>
		            </table>
		        </c:forEach>
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
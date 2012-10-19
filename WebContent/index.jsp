<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage = "error.jsp" %>
<%@ page import="swsec.*" %>
<%@page import="java.sql.*;" %>


<sql:query var="country" dataSource="jdbc/lut2">
    SELECT full_name FROM country
</sql:query>
<%
	ResultSet rs = Query.SelectCountry();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="lutstyle.css">
        <title>LUT 2.0 - Help Students Conquer the World </title>
    </head>
    <body>
        <h1>Hi student!</h1>
        <table border="0">
            <thead>
                <tr>
                    <th>LUT 2.0 provides information about approved international schools</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>To view information about schools in a country, please select a country below:</td>
                </tr>
                <tr>
                    <td>
                    	<form action="schools.jsp" method="POST">
                            <strong>Select a country:</strong>
                            <select name="country">
                                <%
                                	while(rs.next())
                                	{
                                	%>
                                		<option value="<c:out value="<%=rs.getString("full_name") %>"/>"><c:out value="<%=rs.getString("full_name") %>"/></option>
                                	<% 
                                	}
                                %>
                            </select>
                            
                            <input type="submit" value="submit" />
                        </form>
                 	</td>
                </tr>
            </tbody>
        </table>

    </body>
</html>

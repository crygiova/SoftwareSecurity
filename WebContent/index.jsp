
<%@ page import="swsec.*" %>
<%@page import="java.sql.*;" %>

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
    <% if(SessionControl.isExpired(session))
    { %> 
        <h1>Hi student!</h1>
    <% }
     else
     {%>
     	<h1>Hi <%= session.getAttribute("login")%>!</h1>
     <%}%>
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
                                		<option value="<c:out value="<%=rs.getString("full_name") %>"/>"></option>
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
		<jsp:include page="loginButton.jsp" flush="true"/>
    </body>
</html>

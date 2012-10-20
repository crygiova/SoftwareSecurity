<%-- Invalidation of the session --%>
<%@page import="java.util.*" %>
<link rel="stylesheet" type="text/css" href="lutstyle.css">
<%session.invalidate();%>
<br>
<br>
You logge out. Please try again 
<a href="lutadmin.jsp"><b>Login</b></a>

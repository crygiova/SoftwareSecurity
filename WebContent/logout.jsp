<%-- Invalidation of the session --%>
<%@page import="java.util.*" %>
<%@ taglib prefix="csrf" 
	uri="http://www.owasp.org/index.php/Category:OWASP_CSRFGuard_Project/Owasp.CsrfGuard.tld" %>
<link rel="stylesheet" type="text/css" href="lutstyle.css">
<%session.invalidate();%>
<br>
<br>
You logged out. Please try again 
<a href="lutadmin.jsp"><b>Login</b></a>

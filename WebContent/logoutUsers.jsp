<%-- Invalidation of the session controls that the session is not already expired--%>
<%@page import="java.util.*" %>
<link rel="stylesheet" type="text/css" href="lutstyle.css">
<%session.invalidate();
response.sendRedirect("./");%>

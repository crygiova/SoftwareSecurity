<html>
<body>
<%-- to use this page in other pages only insert
	<%@ page errorPage = "error.jsp" %>
	and every exception will be catched by this page
 --%>
<%@ page isErrorPage = "true" %>
<div class="message">
An error is occurred:<br /><br />
<%= exception.getMessage()%>
</div>
</body>
</html>
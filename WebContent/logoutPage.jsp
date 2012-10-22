<%-- This is only the form for the logout --%>
<%@ taglib prefix="csrf" 
	uri="http://www.owasp.org/index.php/Category:OWASP_CSRFGuard_Project/Owasp.CsrfGuard.tld" %>
<hr>
<form method="post" action="logout.jsp">
	<p>
		<input type="submit" value="Logout" name="logout">
	</p>
</form>
<%@ page import="swsec.*" %>
<%@ taglib prefix="csrf" 
	uri="http://www.owasp.org/index.php/Category:OWASP_CSRFGuard_Project/Owasp.CsrfGuard.tld" %>
<%

	if(SessionControl.isExpired(session))//if we are not logged
    {
    	%><!-- This is only the form for the logout -->
		<hr>
		<csrf:form method="post" action="loginUsers.jsp">
			<p> <!-- todo send a parameter to the redirection after the login -->
				<input type="submit" value="Login" name="login">
			</p>	
		</csrf:form>
		<%
    }
    else//if we r logged
    {
    	%>
   				<hr>
				<csrf:form method="post" action="logoutUsers.jsp">
					<p>
						<input type="submit" value="Logout" name="logout">
					</p>
				</csrf:form>
    	<%	
    }
	%>	
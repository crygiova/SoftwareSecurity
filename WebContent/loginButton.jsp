<%@ page import="swsec.*" %>

<%

	if(SessionControl.isExpired(session))//if we are not logged
    {
    	%><!-- This is only the form for the logout -->
		<hr>
		<form method="post" action="loginUsers.jsp">
			<p> <!-- todo send a parameter to the redirection after the login -->
				<input type="submit" value="Login" name="login">
			</p>	
		</form>
		<%
    }
    else//if we r logged
    {
    	%>
   				<hr>
				<form method="post" action="logoutUsers.jsp">
					<p>
						<input type="submit" value="Logout" name="logout">
					</p>
				</form>
    	<%	
    }
	%>	
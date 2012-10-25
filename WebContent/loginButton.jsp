<%@ page import="swsec.*" %>

<%

	if(SessionControl.isExpired(session))//if we are not logged
    {
    	%><!-- This is only the form for the logout -->
		
		<br>
		<table>
			<tr>
			<td>
				<form method="post" action="loginUsers.jsp">
					<p> <!-- todo send a parameter to the redirection after the login -->
						<input type="submit" value="Login" name="login">
					</p>	
				</form>
				</td>
				<td>
				
				</td>
			</tr>
		</table>
		<%
    }
    else//if we r logged
    {
    	%>
   				<br>
   				<table>
   					<tr>
						<td><form method="post" action="logoutUsers.jsp">
							<p>
								<input type="submit" value="Logout" name="logout">
							</p>
						</form>
						</td><td><form method="post" action="changepw.jsp">
							<p>
								<input type="submit" value="ChangePassword" name="ChangePassword">
							</p>
							</td>
						</form>
					</tr>
				</table>
    	<%	
    }
	%>	
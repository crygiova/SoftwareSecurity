<%@ page import="swsec.*" %>

<%
	//Authentication obj = new Authentication();
	//obj.createUserNormal("gonchos@gmail.com", "1234");
    if(!SessionControl.isExpired(session))
    {
			response.sendRedirect("./");//TODO rimandare all index
    }
    else
    {
    	
    %>

	<!DOCTYPE html>
	<html>
	    <head>
	        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	        <link rel="stylesheet" type="text/css" href="lutstyle.css">
	        <title>Login Users</title>
	    </head>
	    <body>
	        <h1>Welcome to the LUT</h1>
	        <table border="0">
	            <thead>
	                <tr>
	                    <th>Log on here</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td><form method="post" action="loginFunction.jsp">
	
	                            <p>
	                                Email: </font><input type="text" name="username" size="20"></p>
	                            <p>
	                                Password:</font><input type="password" name="password" size="20"></p>
	                            <p><input type="submit" value="submit" name="login"></p>
	                        </form>
	                <p>if you are not register yet click <a href="registration.jsp">here</a></p></td></tr>
	            </tbody>
	        </table>
	        <%
			if(request.getParameter("error")!=null)
		    {
			    //control if there was an login error
		    	if(request.getParameter("error").compareTo("true")==0)
		    	{
		    		//if in an error for an expired session
		    		if(request.getParameter("type")!=null)
		    		{
			    		if(request.getParameter("type").compareTo("expired")==0)
			    		{
			    			out.println("<p>SESSION expired, Login Again</p>");
			    		}
			    	}
		    		else //other type of login errors
		    		{
			    		%>
				    		<script>
				    			alert("Login Error, Try again to Login");
				    		</script>
			    		<%
		    		}
		    	}
		    }
	        %>
	    </body>
	</html>
<%}
%>


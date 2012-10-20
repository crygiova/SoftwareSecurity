<%@ page import="swsec.*" %>
<%
    if(!SessionControl.isExpired(session))
    {
    	response.sendRedirect("./adminhome.jsp");
    }
    else
    {
    	
    %>

	<!DOCTYPE html>
	<html>
	    <head>
	        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	        <link rel="stylesheet" type="text/css" href="lutstyle.css">
	        <title>LUTAdmin</title>
	    </head>
	    <body>
	        <h1>Welcome to the LUT administration pages!</h1>
	        <table border="0">
	            <thead>
	                <tr>
	                    <th>Log on here to perform administrative tasks</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td><form method="post" action="login.jsp">
	
	                            <p>
	                                Username:</font><input type="text" name="username" size="20"></p>
	                            <p>
	                                Password:</font><input type="password" name="password" size="20"></p>
	                            <p><input type="submit" value="submit" name="login"></p>
	                        </form></td>
	                </tr>
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

<%@page pageEncoding="MacRoman" contentType="text/html; charset=MacRoman" %>
<%@page import="swsec.*"%>
<html>
<head>
		<link rel="stylesheet" type="text/css" href="lutstyle.css">
		<title>Change Password</title>
	</head>
<body>
<%
	if(SessionControl.isExpired(session))
    {
		response.sendRedirect("./");//TODO rimandare all index
    }
    else
    { 
    	if(request.getMethod().compareToIgnoreCase("POST")==0 && (request.getParameter("flag")!=null && request.getParameter("flag").compareToIgnoreCase("1")==0))// fi I ve a request
		{
			%>
				<script>
   					alert("Registration error, the user is still register");
   				</script>
			<%
		}
		else
		{
		out.println(session.getAttribute("login").toString());
    %>
    	<br>
    	    	<br>
    	<table border="0">
	    <thead>
	        <tr>
	            <th colspan="2">Change Password</th>
	        </tr>
	    </thead>
	    <tbody>
	        <tr>
	            <td>
	                <form action="changepw.jsp"  method="POST">
                      	<p>Old Password: <input type="text" name="old" size="20"></p>
						<p>New Password:<input type="password" name="password" size="20"></p>
						<p>Confirm new password: <input type="password" name="password2" size="20"></p>
						<input type="hidden" name="flag" value = "1">
						<p><input type="submit" value="Change" name="change"></p>
	                 </form>
	            </td>
	        </tr>
	    </tbody>
	</table>	
	<%
		}
    }
    
%>
</body>
</html>

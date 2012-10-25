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
			String user = session.getAttribute("login").toString();
			String oldpw = request.getParameter("old");
			String newpw1 = request.getParameter("password");
			String newpw2 = request.getParameter("password2");
			Authentication obj = new Authentication();
			if(obj.authenticate(user,oldpw,"NORMAL_USER"))// passowr is correct??
			{
				if(newpw1.compareTo(newpw2)==0)// passw 1 and 2 is equals?
				{
					if(newpw1.length>=8 && newpw1.matches("(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$ "))////Passwords will contain at least (1) upper case letterPasswords will contain at least (1) lower case letterPasswords will contain at least (1) number or special characterPasswords will contain at least (8) characters in lengthPassword maximum length should not be arbitrarily limited password is not sintax correct
					{
						if(obj.updateUserPassword(user,newpw1))
						{
							response.sendRedirect("./checkemail.jsp");
						}
						else
						{
							%>
				    		<script>
		   						alert("Error, the password is not changed");
		   					</script>
							<%
						}//take user pass old new pass pass2
					}
					else
					{
							%>
				    		<script>
		   						alert("Error, the password is not sintax correct");
		   					</script>
							<%
					}
				}
				else
				{
					%>
			    	<script>
	   				alert("The two new Passwords are not equal");
	   				</script>
					<%
				}
			}
			else
			{
				%>
		    	<script>
   				alert("The Password is not correct");
   				</script>
				<%
			}
		}
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
                      	<p>Old Password: <input type="password" name="old" size="20"></p>
						<p>New Password:<input type="password" name="password" size="20"></p>
						<p>Confirm new password: <input type="password" name="password2" size="20"></p>
						<input type="hidden" name="flag" value = "1">
						<p><input type="submit" value="Change" name="change"></p>
	                 </form>
	            </td>
	        </tr>
	    </tbody>
	</table>	
	Passwords will contain at least (1) upper case letter
	Passwords will contain at least (1) lower case letter
	Passwords will contain at least (1) number or special character
	Passwords will contain at least (8) characters in length
	Password maximum length should not be arbitrarily limited 
	<%
		}
    }
    
%>
</body>
</html>

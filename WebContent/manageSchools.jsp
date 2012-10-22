<%-- NEW Functionality  --%>

<%@ page import="swsec.*" %>
<%-- Home page for the administration --%>
	<%if(SessionControl.isExpiredAdmin(session)) //controls if the last admin session was expired
	{
			response.sendRedirect("./logout.jsp");
	}
	else
	{
	%>
	<head>
	        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	        <link rel="stylesheet" type="text/css" href="lutstyle.css">
	        <title>Manage Schools</title>
	</head>
	<body>    
		<table>
			<tr>
				<td>
					<form  action="addSchool.jsp"method="POST">
						<p>School full name : <input type="text" name="school_full"></p>
						<p>School short name : <input type="text" name="school_short"></p>
						<p>City : <input type="text" name="city"></p>
						<p>Zip Code : <input type="text" name="zip"></p>
						<p>Country code : <input type="text" name="country_short"></p>
						
						<p><input type="submit" value="Submit"></p>
					</form>
				</td>
			<tr>
		</table>
	</body>	
	<%
	}
%>
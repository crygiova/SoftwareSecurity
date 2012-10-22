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
	        <title>Manage Countries</title>
	</head>
	<body>    
		<table>
			<tr>
				<td>
					<form  action="addCountry.jsp"method="POST">
						<p>Country short name: <input type="text" name="short_name"></p>
						<p>Country name: <input type="text" name="name"></p>
						<p><input type="submit" value="Submit"></p>
					</form>
				</td>
			<tr>
		</table>
	</body>	
	<%
	}
%>
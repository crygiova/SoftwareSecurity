<%@ page import="swsec.*" %>

<%-- Home page for the administration --%>
	<%if(SessionControl.isExpiredAdmin(session)) //controls if the last session was expired
	{
			response.sendRedirect("./logout.jsp");
	}
	else
	{%>
		<html>
		    <head>
		    	
		        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		        <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
		        <link rel="stylesheet" type="text/css" href="lutstyle.css">
		        <title>LUT Admin pages</title>
		    </head>
		<body> <!-- TO DO SESSSION CONTROL -->
					
					<h1>Login succeeded</h1> 
					                Welcome <% out.println(session.getAttribute("user"));%>
					                <br>
					                <br>
						            <table>
						              	<tr> 	
						              		<td><a href="manageCountry.jsp">Manage Countries</a></td>
						              		<td><a href="manageSchools.jsp">Manage Schools</a></td>
						              		<td><a href="manageUsers.jsp">  Manage Users</a></td>
						              	</tr>
					              	</table>
					              
		
				 <jsp:include page="logoutPage.jsp" flush="true"/>			                
		</body>
		</html>
	<%}%>

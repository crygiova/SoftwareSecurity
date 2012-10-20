<%@ page import="swsec.*" %>
<%-- Home page for the administration --%>
	<%if(SessionControl.isExpired(session)) //controls if the last session was expired
	{
			response.sendRedirect("./lutadmin.jsp?error=true&type=expired");
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
					                Unfortunately, there is no admin functionality here.<br>
					                You need to figure out how to tamper with the application some other way.
		
				 <jsp:include page="logoutPage.jsp" flush="true"/>			                
		</body>
		</html>
	<%}%>

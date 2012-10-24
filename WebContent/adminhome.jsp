<%@ page import="swsec.*" %>

<%-- Home page for the administration --%>

	<%
	response.setHeader("Cache-Control","no-cache"); 
	response.setHeader("Pragma","no-cache"); 
	response.setDateHeader ("Expires", 0); 
	if(SessionControl.isExpiredAdmin(session)) //controls if the last session was expired
	{
			response.sendRedirect("./logout.jsp");
	}
	else
	{%>
		<html>
		    <head>
		    	
		        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		        <link rel="stylesheet" type="text/css" href="lutstyle.css">
		        <title>LUT Admin pages</title>
		    </head>
		<body> <!-- TO DO SESSSION CONTROL -->
					
					<h1>Login succeeded</h1> 
					               Welcome <% out.println(session.getAttribute("user"));%>
					                <br><br><br>
					                
						 
				 <jsp:include page="menuAdmin.jsp" flush="true"/>	          
				<br>
				 <jsp:include page="logoutPage.jsp" flush="true"/>			                
		</body>
		</html>
	<%}%>

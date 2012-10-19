<%@ page import="swsec.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="lutstyle.css">
        <title>LUT Admin pages</title>
    </head>


<body> <!-- TO DO SESSSION CONTROL -->
			<h1>Login succeeded</h1> 
			                Welcome <% out.println(session.getAttribute("user"));%>
			                
			                <br>
			                <br>
			                 
			                Unfortunately, there is no admin functionality here. <br>
			                You need to figure out how to tamper with the application some other way.
</body>
</html>

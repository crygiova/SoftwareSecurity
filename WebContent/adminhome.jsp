<html>
<head>

</head>
<body> <!-- TO DO SESSSION CONTROL -->
		<h1>Login succeeded</h1> 
			                Welcome <% out.println(session.getAttribute("user"));%>
			                <br> 
			                Unfortunately, there is no admin functionality here. <br>
			                You need to figure out how to tamper with the application some other way.
</body>
</html>

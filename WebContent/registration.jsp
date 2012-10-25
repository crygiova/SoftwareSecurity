<%@page import="swsec.*"%>
<%@ page errorPage = "error.jsp" %>
<%@ page language="java" import="javax.naming.*,java.io.*,javax.mail.*, javax.mail.internet.*,com.sun.mail.smtp.*, java.util.*, javax.activation.*"%>

<html>
	    <head>
		<link rel="stylesheet" type="text/css" href="lutstyle.css">
		<title>Registration</title>
	</head>
	
	<!DOCTYPE html>
<%	
if(request.getMethod().compareToIgnoreCase("POST")==0)// fi I ve a request
	{
		boolean okay = false;
   		String email = request.getParameter("email");
   		String password = request.getParameter("password");
   		String passalt = request.getParameter("password2");
   	
   		if(SessionControl.verifyEmailAddress(email))
   		{
   			if(password.compareTo(passalt)==0)
   			{
	   			if(password.length()>=8)// && password.matches("(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$ "))////Passwords will contain at least (1) upper case letterPasswords will contain at least (1) lower case letterPasswords will contain at least (1) number or special characterPasswords will contain at least (8) characters in lengthPassword maximum length should not be arbitrarily limited password is not sintax correct
				{
	   				if(!Query.userCheck(email))
	   				{
	   		    		Authentication obj = new Authentication();
	   		    		obj.createUserNormal(email, password);
	   		    		okay=true; //if the user is created
	////////////////////////////////////////////////////////////////////////////////////////////
						String host="", user="", pass=""; 
						host = "smtp.gmail.com"; 
						user = "softsec3456@gmail.com";
						pass = "lillian1234"; //Your gmail password 
						String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory"; 
						String to = email; // out going email id 
						String from = "softsec3456@gmail.com"; //Email id of the recipient 
						String subject = "Confirmation"; 
						String messageText = "http://localhost:8080/SoftwareSecurity/confirmation.jsp?user="+email+"&conf=Y"; 
						boolean WasEmailSent ; 
						boolean sessionDebug = true; 
						Properties props = System.getProperties(); 
						props.put("mail.host", host); 
						props.put("mail.transport.protocol.", "smtp"); 
						props.put("mail.smtp.auth", "true"); 
						props.put("mail.smtp.", "true"); 
						props.put("mail.smtp.port", "465"); 
						props.put("mail.smtp.socketFactory.fallback", "false"); 
						props.put("mail.smtp.socketFactory.class", SSL_FACTORY); 
						Session mailSession = Session.getDefaultInstance(props, null); 
						mailSession.setDebug(sessionDebug); 
						Message msg = new MimeMessage(mailSession); 
						msg.setFrom(new InternetAddress(from)); 
						InternetAddress[] address = {new InternetAddress(to)}; 
						msg.setRecipients(Message.RecipientType.TO, address); 
						msg.setSubject(subject); 
						msg.setContent(messageText, "text/html"); // use setText if you
						Transport transport = mailSession.getTransport("smtp"); 
						transport.connect(host, user, pass); 
						out.println("AN EMAIL HAS BEEN SENT TO YOU. FOLLOW THE LINK IN IT TO VERIFY YOUR ACCOUNT"); 
						try { 
							if(okay)
							{
								transport.sendMessage(msg, msg.getAllRecipients()); 
								WasEmailSent = true; // assume it was sent 
							}
						} 
						catch (Exception err) 
						{ 
							WasEmailSent = false; // assume it's a fail 
						} 
						transport.close();
	////////////////////////////////////////////////////////////////////////////////////////////
	   		    		response.sendRedirect("./confirmation.jsp");
	   				}
	   				else
	   				{
	   					%>
			    		<script>
	   					alert("Registration error, the user is still register");
	   						</script>
	
		    			<%
		    			
	   				}
	   			}
   			}
   			else //if passw r different
   			{
   				%>
		    		<script>
		    			alert("Registration error, the password are different");
		    		</script>
	    		<%
	    		
	    	}
   		}
   		else //if email is not verified
   		{
   			%>
	    		<script>
	    			alert("Registration error, the email does not exist");
	    		</script>
    		<%
    		
   		}
	}

	%>
	
	<body>
	<table border="0">
	    <thead>
	        <tr>
	            <th colspan="2">Register</th>
	        </tr>
	    </thead>
	    <tbody>
	        <tr>
	            <td>
	                <form action="registration.jsp"  method="POST">
                      	<p>Email: <input type="text" name="email" size="20"></p>
						<p>Password:<input type="password" name="password" size="20"></p>
						<p>Confirm password: <input type="password" name="password2" size="20"></p>
						<p><input type="submit" value="Register" name="register"></p>
	                 </form>
	            </td>
	        </tr>
	    </tbody>
	</table>	
	Passwords will contain at least (1) upper case letter<br>
	Passwords will contain at least (1) lower case letter<br>
	Passwords will contain at least (1) number or special character<br>
	Passwords will contain at least (8) characters in length<br>
	Password maximum length should not be arbitrarily limited 	   <br> 	
	<jsp:include page="loginButton.jsp" flush="true"/>
</body>
</html>

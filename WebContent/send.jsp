	<%@page import="swsec.*"%>
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
	   		
   				if(!Query.userCheck(email))
   				{
   		    		Authentication obj = new Authentication();
   		    		obj.createUserNormal(email, password);
   		    		okay=true; //if the user is created
   		    		response.sendRedirect("./checkemail.jsp");
   		    			
   				}
   				else
   				{
   					%>
		    		<script>
   					alert("Registration error, the user is still register");
   						</script>

	    			<%
	    			response.sendRedirect("./registration.jsp");	
   				}
   			}
   			else //if passw r different
   			{
   				%>
		    		<script>
		    			alert("Registration error, the password are different");
		    		</script>
	    		<%
	    		response.sendRedirect("./registration.jsp");
	    	}
   		}
   		else //if email is not verified
   		{
   			%>
	    		<script>
	    			alert("Registration error, the email does not exist");
	    		</script>
    		<%
    		response.sendRedirect("./registration.jsp");
   		}
	}
	
	%>
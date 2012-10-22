
<%-- Log in funtion for the normal users login --%>

<%@ page import="swsec.*" %>

<% 
    if(!SessionControl.isExpired(session))
    {
    	response.sendRedirect("./");//if the session is still open it redirect u in the index.jsp
    }
    else
    {
	    //control that the using method is POST
	    if(request.getMethod().compareToIgnoreCase("POST")==0)
		{ 
			String login = request.getParameter("username");
			String password = request.getParameter("password");
			//regular expr for sql injectoin, we have tu put it intoa constant library so 
			boolean error = false;
			if(!SessionControl.verifyEmailAddress(login) || !password.matches("^[a-zA-Z0-9]+$"))//controls that is an email and the password matches
			{
				error = true;
			}
			if(!error)//if the string request r matching with our regexpr
			{	
				Authentication obj = new Authentication();
				if(obj.authenticate(login, password,"NORMAL_USER"))//if the login query returns true
				{
						session.setAttribute("login",login);//creating a session
						session.setMaxInactiveInterval(SessionControl.getSessLong());
						response.sendRedirect("./"); //should redirect to the previus page
			    }
				else
				{
						response.sendRedirect("./loginUsers.jsp?error=true");
				}
			}
			else
			{
				response.sendRedirect("./loginUsers.jsp?error=true");
			}
		}
		//if not method POST
		else
		{
	  			response.sendRedirect("./loginUsers.jsp?error=true&type=expired");
	  	}
	}
	%>
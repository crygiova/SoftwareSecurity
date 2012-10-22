

<%@ page import="swsec.*" %>
<%@ taglib prefix="csrf" 
	uri="http://www.owasp.org/index.php/Category:OWASP_CSRFGuard_Project/Owasp.CsrfGuard.tld" %>

	<%-- Added by crygiova -- POST CONTROL  --%>
    <% 
    
    
    if(!SessionControl.isExpiredAdmin(session))
    {
    	response.sendRedirect("./adminhome.jsp");
    }
    else
    {
	    //control that the using method is POST
	    if(request.getMethod().compareToIgnoreCase("POST")==0)
		{ 
		%>
		<%-- Added by gonch -- POST CONTROL --%>
		<%-- Whitelisting of username and password --%>
			<%
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			//regular expr for sql injectoin, we have tu put it intoa constant library so 
			boolean error = false;
			if(!username.matches("^[a-zA-Z0-9]+$") || !password.matches("^[a-zA-Z0-9]+$"))
			{
				error = true;
			}
			%>
			<% if(!error)//if the string request r matching with our regexpr
			{	
				Authentication obj = new Authentication();
				if(obj.authenticate(username, password,"CREDENTIAL"))//if the loginadmin query returns true
				{
						session.setAttribute("user",username);//creating a session
						session.setAttribute("admin","yes");//creating a flag for the session
						session.setMaxInactiveInterval(SessionControl.getSessLong());
						response.sendRedirect("./adminhome.jsp");
			    }
				else
				{
						response.sendRedirect("./lutadmin.jsp?error=true");
				}
			}
			else
			{
				response.sendRedirect("./lutadmin.jsp?error=true");
			}%>
	    <%-- Added by crygiova -- POST CONTROL  --%>
		<%
		}
		//if not method POST
		else
		{
	  			response.sendRedirect("./lutadmin.jsp?error=true&type=expired");
	  	}
	 }
	%>
    

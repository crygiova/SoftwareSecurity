<%-- NEW Functionality  --%>
<%@ page import="swsec.*" %>
<%-- Home page for the administration --%>
	<%if(SessionControl.isExpiredAdmin(session)) //controls if the last admin session was expired
	{
			response.sendRedirect("./logout.jsp");
	}
	else
	{
		out.println("country");
	}
%>
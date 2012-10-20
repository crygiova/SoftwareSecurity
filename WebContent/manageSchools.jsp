<%-- NEW Functionality  --%>
<%@ page import="swsec.*" %>
<%	if(SessionControl.isExpiredAdmin(session)) //controls if the last admin session was expired
	{
			response.sendRedirect("./logout.jsp");
	}
	else
	{
		out.println("schools");
	}
%>
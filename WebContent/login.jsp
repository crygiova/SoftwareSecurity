<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage = "error.jsp" %>
<%@ page import="swsec.*" %>

	<%-- Added by crygiova -- POST CONTROL  --%>
    <% 
    //NEED TO ADD A CONTROL THAT WE DONT R USING THIS PAGE WITHOUT
    if(session.getId()!=null && session.getAttribute("user")!= null)
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
			<% if(!error)
			{
				if(	Query.loginAdminQuery(username,password))
				{
					session.setAttribute("user",username);
					response.sendRedirect("./adminhome.jsp");
			    }
				else
				{
						response.sendRedirect("./error.jsp");//TODO lutadmin redirect;
				}
			%>
			<%-- <sql:query var="users" dataSource="jdbc/lut2">
			    SELECT * FROM admin_users
			    WHERE  uname = ? <sql:param value="${param.username}" /> 
			    AND pw = ${param.password}
			</sql:query>
			
			    
			    
			<c:set var="userDetails" value="${users.rows[0]}"/>
			
			<%@page contentType="text/html" pageEncoding="UTF-8"%>
			<!DOCTYPE html>
			        <c:choose>
			            <c:when test="${ empty userDetails }">
			                <%response.sendRedirect("./error.jsp");%><!-- TODO lutadmin with error message -->
			            </c:when>
			            <c:otherwise>
			                <%
			                
			                session.setAttribute("user",username);
			                out.println(session.getAttribute("user")+"ghghgh");
			                response.sendRedirect("./adminhome.jsp");
			                %>
			           	</c:otherwise>
			        </c:choose> --%>
			<%}
			else
			{
				response.sendRedirect("./error.jsp");
				//throw new JspException("Invalid username or Passowrd");  
			}%>
	    <%-- Added by crygiova -- POST CONTROL  --%>
		<%
		}
		//if not method POST
		else
		{
			
			//general jsp exception throw -> A generic exception known to the JSP engine; uncaught JspExceptions will result in an invocation of the errorpage machinery. 
	  		//throw new JspException("Wrong Method! U r using GET and not POST");  
	  		//Redirect to the page if u r not authenticating in the right way
	  		
	  		//Need to be made the control for the session, if the session is on or not!
	  		response.sendRedirect("./lutadmin.jsp");
		
	  	}
	 }
	%>
    

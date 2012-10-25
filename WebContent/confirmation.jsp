<%@ page import="swsec.*" %>

<%
	//Authentication obj = new Authentication();
	//obj.createUserNormal("gonchos@gmail.com", "1234");
    if(!SessionControl.isExpired(session)){
			response.sendRedirect("./");//TODO rimandare all index
    }
    else{
    	String user = request.getParameter("user");
    	if(request.getParameter("conf")!=null & Query.userCheck(user)){
    		Query.updateUserFlag(user);
%>
    		<!DOCTYPE html>
    		<html>
    		    <head>
    		        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    		        <link rel="stylesheet" type="text/css" href="lutstyle.css">
    		        <title>CONFIRMED USER</title>
    		    </head>
    		    <body>
					Your email is verified. Please log in.
					<jsp:include page="loginUsers.jsp" flush="true"/>
    		    </body>
<%  	}
    	else{
    		out.println("Error. User not confirmed.");
    	}
    }
%>
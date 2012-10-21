<%-- NEW Functionality  --%>

<%@ page import="swsec.*" %>
<%@page import="java.sql.*;" %>
<%-- Home page for the administration --%>
	<%if(SessionControl.isExpiredAdmin(session)) //controls if the last admin session was expired
	{
			response.sendRedirect("./logout.jsp");
	}
	else
	{
		ResultSet rs = Query.selectUsers();
	%>
	<head>
	        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	        <link rel="stylesheet" type="text/css" href="lutstyle.css">
	        <title>Manage Users</title>
	</head>
	<body>    
		<table>
			<thead>
                    <tr>
                        <th colspan="2">Users :</th>
                    </tr>
    	    </thead>
		<tbody>
				<% 	while(rs.next())
					{
					
				%>
				<tr>
					<td>
						<p><% out.println(rs.getString(1));%></p>
					</td>
					<td>
						<form action="deleteUser.jsp" method="POST">
							<input type="hidden" name="user" value="<% out.print(rs.getString(1));%>"/>
							<input type="submit" value="Delete User" />
						</form>
					</td>
				</tr>
				<%
					}
				%>
		</tbody>
		</table>
	</body>	
	<%
	}
%>
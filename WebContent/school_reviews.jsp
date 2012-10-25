
<%@ page import="swsec.*" %>
<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
		
    <% 
    //control that the using method is POST
    if(request.getMethod().compareToIgnoreCase("GET")!=0)
	{ 
	
			if(request.getParameter("flag")!=null && request.getParameter("flag").compareToIgnoreCase("1")==0)
			{
				if(SessionControl.isExpired(session))
				    {
				    	%> <script>alert("The session is expired")</script> <%
				    }
				    else
					{
				    	String school_id = request.getParameter("school_id");
				    	String review = request.getParameter("review");
				    	String name = session.getAttribute("login").toString();
				    	boolean invalidString;
				    	boolean empty = false;
				    	if(!review.matches("^[A-Za-z0-9 _]*[A-Za-z0-9][A-Za-z0-9 _]*$") || review.length()==0)
				    	{
				    		%> <script>alert("Invalid Review Chars")</script> <%
				    	}
				    	else if(!school_id.matches("^[a-zA-Z0-9]+$") || review.length()==0)
						{
							%> <script>alert("Invalid school ID")</script> <% //Invalid school ID
						}
				    	else
				    	{
				    		Query.insertReview(school_id, name, review);
				    		String message = "Thanks "+ name + " !Your contribution is appreciated";
							%> <script>alert("Review Inserted, Thanks!!");</script> <%
				    	}
					}
				
			}////////////////////////////////////////////
	    	String school_fullname = request.getParameter("school_fullname");
	    	String school_shortname = request.getParameter("school_shortname");
	    	String school_id = request.getParameter("school_id");
	    	boolean empty = false;
			if(!school_fullname.matches("^[A-Za-z0-9 _]*[A-Za-z0-9][A-Za-z0-9 _]*$")) //also allow spaces!
			{
				response.sendRedirect("./error.jsp");
			}
			ResultSet rs = Query.selectReviews(school_fullname);
			if(!rs.next()) 
			{
				empty = true;
				out.println("No reviews for "+ school_fullname + " yet. Help us out by adding one!"); 
			}
			rs.previous();
	    	
	%>
	<!DOCTYPE html>
		<html>
		    <head>
		        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		        <link rel="stylesheet" type="text/css" href="lutstyle.css">
		        <title>Reviews for <% out.print(school_fullname); %></title>
		    </head>
		    <body>
		        <%
		       	if(!empty)
		       	{
		       	%>
		        <h1>Reviews for <% out.print(school_shortname); %></h1>
		        <%
		        }
		       	else out.print("<br><br>");
		        while(rs.next())
		        {
		        	out.print("<b>"+rs.getString(3)+"</b>");
		        	out.print("<br><br>");
		        	out.print("written by "+rs.getString(2));
		        	out.print("<br><br>");
		        }
		        if(!SessionControl.isExpired(session))//if we are logged
    			{%>
			        <table border="0">
			            <thead>
			                <tr>
			                    <th colspan="2">Help improving LUT2.0 by adding a review of <%out.print(school_shortname); %></th>
			                </tr>
			            </thead>
			            <tbody>
			                <tr>
			                    <td>
			                        <form action="school_reviews.jsp"  method="POST">
			                            <input type="hidden" name="school_id" value="<%out.print(school_id); %>" />
			                            <input type="hidden" name="school_fullname" value="<%out.print(school_fullname); %>" />
			                            <input type="hidden" name="school_shortname" value="<%out.print(school_shortname); %>" />
			                            <input type="hidden" name="flag" value="1" />
			                            <textarea name="review" rows=10 cols=60 autofocus="on"></textarea>
			                            <br><br>
			                            <input type="submit" value="Add review" />
			                         </form>
			                    </td>
			                </tr>
			            </tbody>
			        </table>
		       <% }
		        else
		        {
		        %>
		        		Login for making a Review.
		       <% }%>
		        
			<jsp:include page="loginButton.jsp" flush="true"/>
			
		    </body>
		</html>
	<%-- Added by crygiova -- POST CONTROL  --%>
	<%
	}
	//if not method POST
	else
	{
		if(request.getMethod().compareToIgnoreCase("GET")==0)
		{
  			throw new JspException("Wrong request!");
  		}
  	
	}
	%>
		

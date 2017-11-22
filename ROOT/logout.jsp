<%@include file="config.jsp" %>
<% 
	if (request.getSession().getAttribute("ID") != null) {  
	    session.invalidate();
	    response.sendRedirect(home+"log");
	    return;  
	}
	else
	{
		session.invalidate();
	    response.sendRedirect(home+"log");
	    return;  
	}
	 
%>
<%
	 Object log = request.getSession().getAttribute("ID"); 
	 if(log!=null)
	 {%>
	 	<%@include file="headerAut.jsp" %> 
<%	 }
	else
	 {%>
	 	<%@include file="headerUnaut.jsp" %> 
<%	 }
	 
%>
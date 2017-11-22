<%@include file="../../header.jsp" %>
<%@include file="../../config.jsp" %>
<%@page import="entity.Order"%>
<%@page import="entity.Payment"%>
<%@page import="core.HibernateService"%>
<%@page import="core.deliver.ServiceDeliver"%>
<%@ page import="java.util.ArrayList" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%
Object logV = request.getSession().getAttribute("TYPE"); 
if(logV!=null)
{   
	if(!logV.equals("Deliver"))
	{
		out.print("<script>window.location.href='../../'</script>");
	} 
}
else
{
	out.print("<script>window.location.href='../../'</script>");
}

%>
<div style="width:100%;height: 40px;background: #E16D6D;">
	<center>
		<a href="<% out.print(home);%>Deliver/NewOrder" class='adminHeader'>New Order</a>
		<a href="<% out.print(home);%>Deliver/AllOrder" class='adminHeader'>All Order</a>
		<a href="<% out.print(home);%>Deliver/Area" class='adminHeader'>Area</a>
	</center>
</div><br>

<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="vikID('myModal').style.display = 'none';">&times;</span>
    	<center>
    		<table id='aboutUser' style="width: 50%;"> 
			</table>
			<br>
			<div id="acDiac">
				
			</div> 
    	</center>

  </div>
</div>

<div class="part2" id="adminTable" style="width: 100%;float:left">
	<center>
		<table id="AuthorityTrue" >
		  <tr> 
		    <th>Order Id</th>
		    <th>Customer ID</th> <! order ID Split Last Value >  
		    <th>Product Id</th> 
		    <th>Qty</th>
		    <th>Price</th>
		    <th>Delivery Cost</th>  
		    <th>Payment Id</th>
		    <th>Amount</th> 
		    <th>Customer Name</th>
		    <th>Address</th>  
		    <th>Phone</th>
		    <th>Date</th>  
		  </tr>  
		  </tr>    
		    
		<%	 
			String delID=null; 
			if(request.getSession().getAttribute("ID")!=null){delID=request.getSession().getAttribute("ID").toString();}
			else{out.print("<script>window.location.href='../../'</script>");}

			ArrayList<Order> or = new ArrayList<Order>();
        	HibernateService hObj = new HibernateService();
        	ServiceDeliver obj=new ServiceDeliver();
        	or= hObj.getCompleteOrder(delID);
			for(Order pc: or){     
					out.println("<tr>");
					out.println("<td>"+pc.getId()+ "</td>");
					out.println("<td>"+pc.getCustomer_id()+ "</td>");  
					out.println("<td>"+pc.getProduct_id()+ "</td>");   
					out.println("<td>"+pc.getProduct_qty()+ "</td>");
					out.println("<td>"+pc.getProduct_price()+ "</td>"); 
					out.println("<td>"+pc.getProduct_delivery_cost()+ "</td>");
					out.println("<td>"+pc.getPayment_id()+ "</td>"); 
					out.println("<td>"+obj.paymentAmount(pc.getId())+ "</td>");
					out.println("<td>"+pc.getCustomer_name()+ "</td>"); 
					out.println("<td>"+pc.getCustomer_address()+"<br>"+pc.getCustomer_district()+"</td>"); 
					out.println("<td>"+pc.getCustomer_phone()+ "</td>");
					out.println("<td>"+pc.getDate()+ "</td>"); 
					out.print("</tr>"); 
			}   
		%>      
		</table>   
	</center>
 
</div> 
</body>
</html> 
<script type="text/javascript">
document.title = "New Order";  

function checkUser(val) 
{  
	var xhttp = new XMLHttpRequest();
	var x="<% out.print(home);%>servlet/Staff?action=checkUserAll&email="+val;
	xhttp.open("GET", x, true);
	xhttp.send(); 
	xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) { 
	    	if(this.responseText!="null")
	    	{
	    		var optionList="<option value=''>Select Deliver</option>";
	    		var x=this.responseText.split("@");
	    		for (var i = 0; i <= (x.length-1); i++) 
	    		{
	    			if(x[i]!="")
	    			{ 
	    				var n=x[i].split("/");
	    				if(n[1]!="undefined"){optionList+="<option value='"+n[1]+"'>"+n[0]+"</option>";}
	    			}
	    		}
				vikID('deliverList').innerHTML = optionList;   
	    	}
	    	else
	    	{
	    		vikID('delName').value = "Not Found"; 
	    	}
	    	
	    }
	}; 
}
 
</script>
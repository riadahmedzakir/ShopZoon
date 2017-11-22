<%@include file="../../header.jsp" %>
<%@include file="../../config.jsp" %>
<%@page import="entity.Order"%>
<%@page import="entity.model.Product_Order"%>
<%@page import="entity.Payment"%>
<%@page import="core.HibernateService"%>
<%@page import="core.deliver.ServiceDeliver"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
		<table id="AuthorityTrue" style="float:left;margin:0px 10px;width: 60%">
		  <tr>  
		    <th>Order Date</th> <! order ID Split Last Value > 
		    <th>Qty</th>
		    <th>Product Price</th> 
		    <th>Payment Type</th>
		    <th>Payment</th>
		    <th>Customer Name</th>
		    <th>Customer Address</th>
		    <th>View</th>
		  </tr>  
		  </tr>    
		<%	  
			String delID=null; 
			if(request.getSession().getAttribute("ID")!=null){delID=request.getSession().getAttribute("ID").toString();}
			else{out.print("<script>window.location.href='../../'</script>");}
			ServiceDeliver obj=new ServiceDeliver(); 
			ArrayList<Order> or = new ArrayList<Order>();
        	HibernateService hObj = new HibernateService();
        	or= hObj.getNewDeliverOrder(delID);
			for(Order pc: or){     
					out.println("<tr>"); 
					out.println("<td>"+pc.getDate()+ "</td>");   
					out.println("<td>"+pc.getProduct_qty()+ "</td>");
					out.println("<td>"+pc.getProduct_price()+ "</td>"); 
					out.println("<td>"+obj.paymentType(pc.getId())+ "</td>");
					out.println("<td>"+obj.paymentAmount(pc.getId())+ "</td>");
					out.println("<td>"+pc.getCustomer_name()+ "</td>"); 
					out.println("<td>"+pc.getCustomer_address()+"<br>"+pc.getCustomer_district()+"</td>");  
					out.println("<td style='cursor:pointer' onclick='vikID(\"cN\").innerHTML=\""+pc.getCustomer_name()+"\",vikID(\"cP\").innerHTML=\""+pc.getCustomer_phone()+"\",vikID(\"cA\").innerHTML=\""+pc.getCustomer_address()+", "+pc.getCustomer_district()+"\",vikID(\"cOI\").innerHTML=\""+pc.getId()+"\",vikID(\"cTP\").innerHTML=\""+((pc.getProduct_qty()*pc.getProduct_price())+pc.getProduct_delivery_cost())+"\",vikID(\"cPy\").innerHTML=\""+obj.paymentAmount(pc.getId())+"\",vikID(\"cPyMe\").innerHTML=\""+obj.paymentType(pc.getId())+"\",vikID(\"cPyTI\").innerHTML=\""+obj.paymentTransaction(pc.getId())+"\",view()'>View</td>");
					out.print("</tr>"); 
			}    
		%>   
		</table>   
	</center>

	<div style="float:left;width:35%;height:auto;background:#FAF7F7;border-style:dotted;padding:15px"> 
		<div style="margin:0px 10px;float:left">
			<font style="font-size: 150%"><c:out value="${param.bFullname}" /></font> 
			<table>
				<tr style="background:transparent;"><td>Name</td><td>			<font id='cN'></font></td></tr>
				<tr style="background:transparent;"><td>Phone Number</td>		<td><font id='cP'></font></td></tr>
				<tr style="background:transparent;"><td>Address</td><td>		<font id='cA'></font></td></tr>
				<tr style="background:transparent;"><td>Order Id</td><td>		<font id='cOI'></font></td></tr>
				<tr style="background:transparent;"><td>Total Price</td><td>	<font id='cTP'></font></td></tr>
				<tr style="background:transparent;"><td>Payment Method</td><td> <font id='cPyMe'></font></td></tr>
				<tr style="background:transparent;"><td>Transaction Id</td><td> <font id='cPyTI'></font></td></tr>
				<tr style="background:transparent;"><td>Payment</td><td>		<font id='cPy'></font></td></tr>
			</table> 

			<hr style="width:460px">

			<div id="actionDeliver">
				
			</div> 
		</div>
	</div> 
</div> 
</body>
</html> 
<script type="text/javascript">
document.title = "New Order";  

function view()
{
	if(vikID("cPy").innerHTML!=vikID("cTP").innerHTML)
	{
		vikID("actionDeliver").innerHTML='Enter Amount &nbsp;<input id="delArea" type="number" class="InputPost" style="border-style:none;font-size:20px" ><br><br>'+	
				'<input type="submit" value="Payment Submit" class="InputPost" onclick="paymentSubmit(vikID(\'delArea\').value)" style="width:350px">';
	}
}

function paymentSubmit(val) 
{   
	if(val!="")
	{
		var xhttp = new XMLHttpRequest();
		var x="<% out.print(home);%>servlet/Staff?action=paymentSubmit&deliver_id=<c:out value="${sessionScope.ID}" />&order_id="+vikID("cOI").innerHTML+"&amount="+val;
		xhttp.open("GET", x, true);
		xhttp.send(); 
		xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) { 
		    	if(this.responseText=="ok")
		    	{ 
					vikID('popupNotiText').innerHTML = "Successfull";
					vikID('popupNoti').style.display = 'block'; 
		    	}
		    	else
		    	{
		    		vikID('popupNotiTextF').innerHTML = this.responseText;
					vikID('popupNotiF').style.display = 'block';
		    	}
		    	
		    }
		};
	}
}
</script>
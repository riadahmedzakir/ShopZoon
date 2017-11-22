<%@include file="../../header.jsp" %>
<%@include file="../../config.jsp" %>
<%@page import="entity.Order"%>
<%@page import="entity.Payment"%>
<%@page import="core.staff.ServiceStaff"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
Object logV = request.getSession().getAttribute("TYPE"); 
if(logV!=null)
{   
	if(!logV.equals("Staff"))
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
		<a href="<% out.print(home);%>Staff/NewOrder" class='adminHeader'>New Order</a>
		<a href="<% out.print(home);%>Staff/AllOrder" class='adminHeader'>All Order</a>
		<a href="<% out.print(home);%>Staff/CancelOrder" class='adminHeader'>Cancel Order</a>
		<a href="<% out.print(home);%>Staff/Area" class='adminHeader'>Area</a>
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
		<table id="AuthorityTrue" style="float:left;width: 60%">
		  <tr> 
		    <th>Pro. Id</th>
		    <th>Order Date</th> <! order ID Split Last Value > 
		    <th>Qty</th>
		    <th>Product Price</th> 
		    <th>Customer</th>
		  </tr>  
		  </tr>    
		<%	 
			ServiceStaff obj = new ServiceStaff(); 
			ArrayList<Order> pcList = (ArrayList<Order>)obj.showNewOrder("where action='order' and deliver_id=0");
			for(Order pc: pcList){  
				ArrayList<Payment> paymentList = (ArrayList<Payment>)obj.showPayment("where order_id='"+pc.getId()+"'");
				for(Payment py: paymentList){   
					String[] dd = pc.getId().split("_");
					SimpleDateFormat originalFormat = new SimpleDateFormat("yyyyddMM");
					Date date = originalFormat.parse(dd[1]); 
					SimpleDateFormat newFormat = new SimpleDateFormat("dd MM yyyy");
					String formatedDate = newFormat.format(date);

					out.println("<tr>");
					out.println("<td>"+pc.getProduct_id()+ "</td>");
					out.println("<td>"+pc.getDate()+ "</td>"); 
					out.println("<td>"+pc.getProduct_qty()+ "</td>");
					out.println("<td>"+pc.getProduct_price()+ "</td>");  
					out.println("<td style='cursor:pointer' onclick='vikID(\"cN\").innerHTML=\""+pc.getCustomer_name()+"\",vikID(\"cP\").innerHTML=\""+pc.getCustomer_phone()+"\",vikID(\"cA\").innerHTML=\""+pc.getCustomer_address()+", "+pc.getCustomer_district()+"\",vikID(\"cOI\").innerHTML=\""+pc.getId()+"\",vikID(\"cTP\").innerHTML=\""+((pc.getProduct_qty()*pc.getProduct_price())+pc.getProduct_delivery_cost())+"\",vikID(\"cPyMe\").innerHTML=\""+py.getPayment_type()+"\",vikID(\"cPyTI\").innerHTML=\""+py.getTransaction_id()+"\"'>View</td>");
					out.print("</tr>");
				}
			}   
		%>   
		</table>   
	</center>

	<div style="float:left;width:35%;height:auto;background:#FAF7F7;border-style:dotted;padding:15px"> 
		<div style="margin:0px 10px;float:left">
			<font style="font-size: 150%"><c:out value="${param.bFullname}" /></font> 
			Name : <font id='cN'></font>  <br>
			Phone Number: <font id='cP'></font><br> 
			Address : <font id='cA'></font> <br> <br> 

			Order Id : <font id='cOI'></font>  <br>
			Total Price: <font id='cTP'></font><br>
			Payment Method: <font id='cPyMe'></font><br>
			Transaction Id: <font id='cPyTI'></font><br> 

			<hr style="width:460px">
			Address &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="" name="" placeholder="Search Area" class="InputPost" style="cursor:text;width:200" oninput="checkUser(this.value)"><br><br>
			Deliver &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select class="InputPost" id="deliverList" style="width:250px" onchange="delArea(this.value)">
					<option>None</option> 
				</select><br><br>
			Deliver Area  
				<input id="delArea" readonly style="border-style:none;font-size:20px" ><br><br>	
				<input type="submit" value="Assain" class="InputPost" onclick="assignDeliver(vikID('deliverList').value)" style="width:350px">
			
		</div>
	</div> 
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

function delArea(val) 
{   
	var xhttp = new XMLHttpRequest();
	var x="<% out.print(home);%>servlet/Staff?action=findArea&email="+val;
	xhttp.open("GET", x, true);
	xhttp.send(); 
	xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) { 
	    	if(this.responseText!="null")
	    	{ 
				vikID('delArea').value = this.responseText;   
	    	}
	    	else
	    	{
	    		vikID('delArea').value = "Not Found"; 
	    	}
	    	
	    }
	}; 
}

function assignDeliver(val) 
{   
	if(val!="None")
	{
		var xhttp = new XMLHttpRequest();
		var x="<% out.print(home);%>servlet/Staff?action=assignDeliver&deliver_id="+val+"&order_id="+vikID("cOI").innerHTML;
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
		    		vikID('popupNotiTextF').innerHTML = "Something Error Try Again";
					vikID('popupNotiF').style.display = 'block';
		    	}
		    	
		    }
		};
	}
}
</script>
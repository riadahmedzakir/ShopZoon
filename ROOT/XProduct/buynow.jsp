<%@include file="../../header.jsp" %> 
<%@include file="../../config.jsp" %> 
<%@page import="entity.Product"%>
<%@page import="core.ServiceProduct"%>
<%@page import="java.util.ArrayList"%>
<div class='cont' style="background:black"> 
	<%@include file="AllCatagory.jsp" %>
	<%
	 Object logV = request.getSession().getAttribute("ID"); 
	 if(logV==null)
	 {   
		out.print("<script>setCookie(\"reduceUrl\",crURL(),15);</script>");
		out.print("<script>vikURL('"+home+"log');</script>");
	 }  
	%>
	 <div class="part2" id="part2" style="width: 75%;white;margin: 0% 25%"> 
	 	 <%
			String proId =request.getPathInfo().split("/")[request.getPathInfo().split("/").length-1];
			ServiceProduct obj1 = new ServiceProduct(); 
			ArrayList<Product> proList = (ArrayList<Product>)obj1.showProduct("where product_id="+proId);
			if(proList.size()<=0){out.print("<script>vikURL('"+home+"NotFound');</script>");} 
			for(Product p: proList){
				int pnewPrice=p.getProduct_price() * (100 - p.getProduct_discount()) / 100;
				out.print(""+
				"<table id='buyTable' style='width:95%'>"+
				"  <tr style=''>"+ 
				"  </tr>"+ 
				"  <tr>"+ 
				"    <td><img src='"+home+"/img/product/"+p.getProduct_image()+"' width='70px' height='70px'></td>"+
				"    <td>"+p.getProduct_title()+"</td>"+
				"    <td id='pnewPrice'>"+pnewPrice+"</td>"+  
				"  </tr>"+
				"</table>");
			} 
	 	 %>    
	 	 <center><h3>Delivery Cost For Dhaka 50 TK And Other 100 TK</h3></center>
	 	 <table style="width: 92%">
	 	 	<tr>
	 	 	<form id="myForm" method="get">
	 	 		<td>Full Name</td>
	 	 		<td><input id="bFullname" name="bFullname" class='logRegBodyFormInputT' value ='<% out.print(request.getSession().getAttribute("FNAME")+" "+request.getSession().getAttribute("LNAME"));%>' placeholder="Full Name"></td>
	 	 	</tr>
	 	 	<tr>
	 	 		<td>Select District</td>
	 	 		<td><select id="distict" name="distict" onchange="chDistict()" class='logRegBodyFormInputT'><%@include file="../XAll/district.jsp" %></select></td>
	 	 	</tr>
	 	 	<tr>
	 	 		<td>Full Address</td>
	 	 		<td><input id="bAddress" name="bAddress" class='logRegBodyFormInputT' value='<% out.print(request.getSession().getAttribute("LOCATION"));%>' placeholder="Full Address"></td>
	 	 	</tr>
	 	 	<tr>
	 	 		<td>Phone Number</td>
	 	 		<td><input id="bPhone" name="bPhone" type="phone" class='logRegBodyFormInputT' value='' placeholder="Phone Number"></td>
	 	 	</tr>
	 	 	<tr>
	 	 		<td>Product Qty</td>
	 	 		<td><input id="bQty" name="bQty" type="number" max="100" min="1" class='logRegBodyFormInputT' oninput="Qty(this),deliveryCost(this)" placeholder="Product Qty Range[0-100]"></td>
	 	 	</tr> 
	 	 	<tr>
	 	 		<td>Product Price</td>
	 	 		<td><input id="bPrice" name="bPrice" type="number" class='logRegBodyFormInputT' readonly placeholder="Price"></td>
	 	 	</tr>
	 	 	<tr>
	 	 		<td id="deliveryCost">Total Price</td>
	 	 		<td><input id="bTPrice" name="bTPrice" type="number" class='logRegBodyFormInputT' readonly placeholder="Price"></td>
	 	 	</tr> 
	 	 </table> 
	 	 </form>
	 	 <input type="submit"  class='logRegBodyFormInputS' value="Next" onclick="Next()" style="width: 88.5%"> 
	 </div>  
	 
 </div>
</body>
</html>
<script type="text/javascript">  
var curUrl=window.location.pathname;
var comId = curUrl.split("/").pop();  
function Qty(val){vikID("bPrice").value=val.value*vikID("pnewPrice").innerHTML;}

function deliveryCost(val)
{
	var x=val.value*vikID("pnewPrice").innerHTML;
	if(vikID("distict").value=="Dhaka") { vikID("bTPrice").value=x+50; }
	else { vikID("bTPrice").value=x+100; }
}

function chDistict(){vikID("bTPrice").value="";vikID("bPrice").value="";}

function Next(val)
{
	if(vikID("bFullname").value!="" & vikID("bAddress").value!="" & vikID("bPhone").value!="" & vikID("bQty").value!="" & vikID("bPrice").value!="" & vikID("bTPrice").value!="")
	{
		var delCost=vikID("bTPrice").value-vikID("bPrice").value;
		var xhttp = new XMLHttpRequest();
		var x="<% out.print(home);%>servlet/order?action=insertOrder&product_id="+comId+"&product_qty="+vikID("bQty").value+"&product_price="+(vikID("bPrice").value/vikID("bQty").value)+"&product_del_cost="+delCost+"&customer_name="+vikID("bFullname").value+"&customer_address="+vikID("bAddress").value+"&customer_phone="+vikID("bPhone").value+"&customer_district="+vikID("distict").value;
		xhttp.open("GET", x, true);
		xhttp.send();
		xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		    	var ar=this.responseText.split("/");  
		    	if(ar[0]=="ok")
		    	{
		    		var ur="<% out.print(home);%>buynowPayment/"+ar[1]+"/"+comId+"?bFullname="+vikID("bFullname").value+"&distict="+vikID("distict").value+"&bAddress="+vikID("bAddress").value+"&bPhone="+vikID("bPhone").value+"&bQty="+vikID("bQty").value+"&bPrice="+(vikID("bPrice").value/vikID("bQty").value)+"&bTPrice="+vikID("bTPrice").value;
					vikURL(ur);
		    	}
		    	else
		    	{
				 	console.log(this.responseText);
				} 
			}
		};
	}
	else {
		alert('Empty');
	}
}
</script>
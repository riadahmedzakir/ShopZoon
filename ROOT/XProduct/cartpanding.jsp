<%@include file="../../header.jsp" %> 
<%@include file="../../config.jsp" %>
<%@page import="core.ServiceOrder"%>
<%@page import="core.ServiceProduct"%>
<%@page import="entity.Order"%>
<%@page import="entity.Product"%>
<%@page import="java.util.ArrayList"%>
<div class='cont' style="background:black"> 
	<%@include file="AllCatagory.jsp" %>

	 <div class="part2" id="buyTable" style="width: 75%;white;margin: 0% 25%"><br>
	 	 <table id="AuthorityTrue">
		  <tr>
		    <th>Remove</th>
		    <th>Payment</th>
		    <th>Image</th>
		    <th>Product</th>
		    <th>Price</th>
		    <th>Qty</th> 
		    <th>Total</th> 
		  </tr> 

		  <% 
		    Object logV = request.getSession().getAttribute("ID"); 
			if(logV==null)
			{   
				out.print("<script>setCookie(\"reduceUrl\",crURL(),15);</script>");
				out.print("<script>vikURL('"+home+"log');</script>");
			} 
			else
			{
			  	ServiceOrder objOrder=new ServiceOrder();
			  	ServiceProduct objPtoduct=new ServiceProduct();
			  	ArrayList<Order> orderJoinList = (ArrayList<Order>)objOrder.showUnComplicateOrder(logV.toString()); 
			  	if(orderJoinList.size()>0)
		        { 
		    		for(Order orderJoin: orderJoinList){ 
					  	ArrayList<Order> orderList = (ArrayList<Order>)objOrder.showOrder("where product_id="+orderJoin.getProduct_id());
				        if(orderList.size()>0)
				        { 
				    		for(Order order: orderList){ 
				    			ArrayList<Product> productList = (ArrayList<Product>)objPtoduct.showProduct("where product_id="+order.getProduct_id());
				    			for(Product product: productList){
				    				String addPaymentURL=home+"buynowPayment/"+order.getId()+"/"+order.getProduct_id()+"?bFullname="+order.getCustomer_name()+"&distict="+order.getCustomer_district()+"&bAddress="+order.getCustomer_address()+"&bPhone="+order.getCustomer_phone()+"&bQty="+order.getProduct_qty()+"&bPrice="+order.getProduct_price()+"&bTPrice="+((order.getProduct_price()*order.getProduct_qty())+order.getProduct_delivery_cost());

					    			out.print("<tr>"); 
					    			out.print("<td><font style='cursor:pointer' onclick='cancelOrder(\""+order.getId()+"\")'>Delete</font></td>"); 
					    			out.print("<td><a href='"+addPaymentURL+"'>Add</a></td>");
					    			out.print("<td><img src='"+home+"img/product/"+product.getProduct_image()+"' width='70' height='70'></td>"); 
					    			out.print("<td><a href='"+addPaymentURL+"'>"+product.getProduct_title()+"</a></td>"); 
					    			out.print("<td>"+order.getProduct_price()+"</td>"); 
					    			out.print("<td>"+order.getProduct_qty()+"</td>"); 
					    			out.print("<td>"+((order.getProduct_price()*order.getProduct_qty())+order.getProduct_delivery_cost())+"</td>"); 
					    			out.print("</tr>");
				    			}
				    		}
						}
					}
				} 
			}
		  %>	
		</table>
	 </div> 
 </div>
</body>
</html>
<script type="text/javascript"> 
function cancelOrder(val)
{ 
	var xhttp = new XMLHttpRequest();
	var x='<% out.print(home);%>servlet/order?action=delOrder&id='+val;
	xhttp.open("GET", x, true);
	xhttp.send();
	xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	if(this.responseText=="ok")
	    	{ 
				alert("Cancel Successfully");
				window.location.reload();
	    	}
	    	else
	    	{
			 	console.log(this.responseText);
			} 
		}
	};  
}
</script>
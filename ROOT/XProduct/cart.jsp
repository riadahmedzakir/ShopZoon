<%@include file="../../header.jsp" %> 
<%@include file="../../config.jsp" %> 
<%@page import="entity.Product"%>
<%@page import="entity.Order"%>
<%@page import="core.ServiceOrder"%>
<%@page import="core.ServiceProduct"%>
<%@page import="java.util.ArrayList"%>
<div class='cont' style="background:black"> 
	<%@include file="AllCatagory.jsp" %>

	 <div class="part2" id="buyTable" style="width: 75%;white;margin: 0% 25%"><br>
	 	 <table id="AuthorityTrue">
		  <tr>
		    <th>Remove</th>
		    <th>Delivery</th>
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
			  	ArrayList<Order> orderJoinList = (ArrayList<Order>)objOrder.showComplicateOrder(logV.toString());  
			  	if(orderJoinList.size()>0)
		        {  

		    		for(Order order: orderJoinList){
		    			ArrayList<Product> productList = (ArrayList<Product>)objPtoduct.showProduct("where product_id="+order.getProduct_id());
		    			for(Product product: productList){
			    			String str = product.getProduct_title().toString();
						    str = str.replaceAll(" ", "/");
		        			str = str.replaceAll("[^a-zA-Z ]", "/");
		    				String viewProductURL=home+"productdetail/"+str+"/"+product.getProduct_id();

			    			out.print("<tr>"); 
			    			if(order.getAction().equals("Pandding"))
			    			{
			    				out.print("<td><font style='cursor:pointer' onclick='cancelOrder(\""+order.getId()+"\")'>Cancel</font></td>"); 
			    			} 
			    			if(order.getAction().equals("Cencel"))
			    			{
			    				out.print("<td><font style='cursor:pointer' onclick=''>...</font></td>"); 
			    			} 
			    			if(order.getAction().equals("Complete"))
			    			{
			    				out.print("<td><font style='cursor:pointer' onclick=''>...</font></td>"); 
			    			} 
			    			out.print("<td>"+order.getAction()+"</td>");
			    			out.print("<td><img src='"+home+"img/product/"+product.getProduct_image()+"' width='70' height='70'></td>"); 
			    			out.print("<td><a href='"+viewProductURL+"'>"+product.getProduct_title()+"</a></td>"); 
			    			out.print("<td>"+order.getProduct_price()+"</td>"); 
			    			out.print("<td>"+order.getProduct_qty()+"</td>"); 
			    			out.print("<td>"+((order.getProduct_price()*order.getProduct_qty())+order.getProduct_delivery_cost())+"</td>"); 
			    			out.print("</tr>"); 
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
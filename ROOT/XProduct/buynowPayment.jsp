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
		<br>
		
		<div>
			<div style="float:left;width:35%;height:120px;background:#FAF7F7;border-style: dotted;padding:15px">
				<div style="float:left"><input type="radio" checked style="border-style:red;"></div>
				<div style="margin:0px 10px;float:left">
					<font style="font-size: 150%"><c:out value="${param.bFullname}" /></font><br>
					Email : <c:out value="${sessionScope.EMAIL }" escapeXml="false" /><br>
					Phone Number: <c:out value="${param.bPhone}" /><br>
					<c:out value="${param.bAddress}" /><br>
					<c:out value="${param.distict}" /> 
				</div>
			</div>
			<div style="float:left;width:3%;"> .
			</div>
			<div style="float:left;width:30%;height:120px;background:#FAF7F7;border-style: dotted;padding:15px">
				<div style="float:left"><input type="radio" checked style="border-style:red;"></div>
				<div style="margin:0px 10px;float:left">
					<font style="font-size: 150%">Product Order</font><br>
					<% String x=request.getPathInfo().split("/")[request.getPathInfo().split("/").length-1];
					   out.print("Product ID : "+x); %><br>
					Qty : <c:out value="${param.bQty}" /><br>
					Product Price: <c:out value="${param.bPrice}" /><br>
					Delivery Cost: <c:out value="${param.bTPrice-param.bQty*param.bPrice}" /><br>
					Total Price: <c:out value="${param.bTPrice}" /><br> 
				</div>
			</div>
		</div> 
		<div class="productImg" style="float: left;width: 75%;">
			<hr>
			<input type="submit" value="bKash" onclick="BPDcCod(this),this.borderBottomColor = 'red';" class="productdetail"> 
			<input type="submit" value="Payza" onclick="BPDcCod(this)" class="productdetail"> 
			<input type="submit" value="Debit or Credit Card" onclick="BPDcCod(this)" class="productdetail"> 
			<input type="submit" value="Cash On Delivery" onclick="BPDcCod(this)" class="productdetail">  

			<div id="BPDcCod"> 
				<h2 style="margin:20px 200px">Select Your Payment Method</h2>
			</div> 
		</div>  
	</div>  
	 
 </div>
</body>
</html>
<script type="text/javascript">   
function BPDcCod(val)
{ 
	if(val.value=='bKash')
	{ 
		val.style.borderBottomColor = 'red';
		vikID("BPDcCod").style.color="gray";
		vikID("BPDcCod").innerHTML="<ul>"+
				"<h3>Instructions:</h3>"+
				"<li>Start bKash Mobile menu by dialing *247#</li>"+
				"<li>Choose Payment</li>"+
				"<li>Enter Shopzoon bKash account number: 01234567890</li>"+
				"<li>Enter the amount you would like to send</li>"+
				"<li>Enter a reference about the transaction. </li>"+
				"<li>Enter the bKash Mobile Menu Pin to Confirm</li>"+  
				"<li>Finally, enter the bKash transaction ID returned below</li>"+ 
				"<h4>bKash Transaction Id</h4>"+ 
				"<input style='width:250px;height:30px' id='phoneEmail' placeholder='Your Phone Number'><br><br>"+
				"<input style='width:250px;height:30px' id='transaction' placeholder='Transaction ID'><br><br>"+ 
				"<input type='submit' class='InputPost' value='Confirm' onclick='bKashPay(vikID(\"phoneEmail\").value,vikID(\"transaction\").value,\"bKash\")'>"+ 
			"</ul>";
	}

	else if(val.value=='Payza')
	{
		vikID("BPDcCod").style.color="gray";
		vikID("BPDcCod").innerHTML="<ul>"+
				"<h3>Instructions:</h3>"+
				"<li>Log In Payza Account</li>"+
				"<li>Go to <a href='https://secure.payza.com/SendMoney.aspx'>https://secure.payza.com/SendMoney.aspx</a></li>"+
				"<li>Enter Payza Email Addres: shopzoon@email.com</li>"+
				"<li>Select Currency Banladesh Taka</li>"+
				'<li>Amount <c:out value="${param.bTPrice} TK" /></li>'+
				"<li>Select Purchase Type Goods</li>"+  
				"<li>Click Confirm</li>"+ 
				"<h4>Payza Transaction Id</h4>"+ 
				"<input style='width:250px;height:30px' id='phoneEmail' placeholder='Your Emailr'><br><br>"+
				"<input style='width:250px;height:30px' id='transaction' placeholder='Transaction ID'><br><br>"+ 
				"<input type='submit' class='InputPost' value='Confirm' onclick='Payza(vikID(\"phoneEmail\").value,vikID(\"transaction\").value,\"Payza\")'>"+ 
			"</ul>";
	}

	else if(val.value=='Cash On Delivery')
	{
		vikID("BPDcCod").style.color="gray";
		vikID("BPDcCod").innerHTML="<br><br><center><input type='submit' class='InputPost' value='Confirm' onclick='CashOnDelivery()'></center><br>";
	}
}

function bKashPay(val1,val2,val3)
{
	paymentPay(val1,val2,val3);
}

function Payza(val1,val2,val3)
{
	paymentPay(val1,val2,val3);
}
function CashOnDelivery()
{
	paymentPay("No","No","Cash On Delivery");
}
function paymentPay(val1,val2,val3)
{ 
	if(val1!="" & val2!="")
	{ 
		var curUrl=window.location.pathname; 
		var ar=curUrl.split("/");   
		var xhttp = new XMLHttpRequest();
		var x='<% out.print(home);%>servlet/order?action=insertPayment&product_id='+ar[ar.length-1]+'&payment_type='+val3+'&payment_address='+val1+"&transaction_id="+val2+"&amount=0&order_id="+ar[ar.length-2];
		xhttp.open("GET", x, true);
		xhttp.send();
		xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		    	if(this.responseText=="ok")
		    	{ 
		    		alert("Successful");
					vikURL('<% out.print(home);%>cart');
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
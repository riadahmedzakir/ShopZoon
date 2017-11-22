<%@include file="../../header.jsp" %> 
<%@include file="../../config.jsp" %> 
<%@page import="entity.Product"%>
<%@page import="core.ServiceProduct"%>
<%@page import="java.util.ArrayList"%>
<div class='cont' style="background:black"> 
	<%@include file="AllCatagory.jsp" %>

	 <div class="part2" id="part2" style="width: 75%;white;margin: 0% 25%">
	 	 <h3 style="width: 93%;color: #633E33;background: #F1C6B9;padding: 10px;margin:0px 0px"><center>ALL CATEGORIES</center></h3><br>
	 	 <%
	 	 String proId =request.getPathInfo().split("/")[request.getPathInfo().split("/").length-1];
	 	 ServiceProduct obj1 = new ServiceProduct(); 
	    ArrayList<Product> proList = (ArrayList<Product>)obj1.showProduct("where product_id="+proId);
	    if(proList.size()<=0){out.print("<script>vikURL('"+home+"NotFound');</script>");} 
	    for(Product p: proList){
	    	String xx;
    		if(p.getProduct_discount()<=0){xx="";}
    		else{xx= new StringBuilder().append("Old: "+ p.getProduct_price()+" TK").toString();}
	    	int pnewPrice=p.getProduct_price() * (100 - p.getProduct_discount()) / 100;

	    	out.print("<script>document.title='"+p.getProduct_title()+"'</script>");
	    	out.print("<div class='productImg' style='float: left;width: 500px;background: no-repeat;'>");
		 	out.print("	<img id='imgSet' src='"+home+"/img/product/"+p.getProduct_image()+"' width='490px'; height='450px'>");
		 	out.print("</div>");
		 	out.print("<div class='productImg' style='float: left;width: 470px;height: 500px'>");
		 	out.print("  <p>");
		 	out.print("  <font style='font-size:25px;'>"+p.getProduct_title()+"</font><br><br>");
			out.print("    <font style='font-size:22px;color:#00a1b1'>Product Code: "+p.getProduct_code()+"</font><br><br>");
			out.print("    <font style='font-size:20px;'>Price : "+pnewPrice+" TK ");
			out.print("    		<font  id='tCr' style='text-align: justify ;color: #7F7E7E'>"+xx+"</font>");
			out.print("    </font><br><br>");
			out.print("    <input type='submit' value='BUY NOW' onclick='vikURL(\""+home+"buynow/"+p.getProduct_id()+"\")' style='background:#F46475;font-size: 22px;color: white; padding: 5px 30px; border: none;cursor: pointer;'>");
		 	out.print("    </p>");
		 	
		 	out.print("</div>");
		}

	 	 %>  
		 <div class="productImg" style="float: left;width: 95%;">
		 	<hr>
		 	<input type="submit" value="Feedback" onclick="CPsCRp(this)" class="productdetail"> 
		 	<input type="submit" value="Purchase Step" onclick="CPsCRp(this)" class="productdetail"> 
		 	<input type="submit" value="Condition" onclick="CPsCRp(this)" class="productdetail"> 
		 	<input type="submit" value="Replace Policy" onclick="CPsCRp(this)" class="productdetail"> 
		 	<input type="submit" value="_____________" style="color:transparent;" class="productdetail">  
		 	<div id="CPsCRp"> 
		 	</div>
		 	
		 </div> 
	 </div> 
 </div>
</body>
</html>
<script type="text/javascript">  
var curUrl=window.location.pathname;
var comId = curUrl.split("/").pop(); 
onloadCPsCRp();

function CPsCRp(val)
{
	if(val.value=='Feedback')
	{
		vikID("CPsCRp").style.color="initial";
		onloadCPsCRp();
	}

	else if (val.value=="Purchase Step")
	{
		vikID("CPsCRp").style.color="gray";
		vikID("CPsCRp").innerHTML="<ul>"+
				"<li>Select number of product you want to buy.</li>"+
				"<li>Click on Buy Now button.</li>"+
				"<li>If you are a new user, please click on Sign Up. Then sign up by providing required information.</li>"+
				"<li>Use your user name & password if you are a registered customer.</li>"+
				"<li>Choose your payment (Check out) method.</li>"+
				"<li>Follow required instruction based on payment method.</li>"+ 
			"</ul><br><br>";
	}
	else if (val.value=="Condition")
	{
		vikID("CPsCRp").style.color="gray";
		vikID("CPsCRp").innerHTML="<ul>"+
				"<li>This offer is valid only for PriyoShop.com customers.</li>"+
				"<li>Order confirmation and delivery completion are subject to product availability.</li>"+
				"<li>Please check your product at the time of delivery.</li>"+
				"<li>If delivery location is outside Dhaka city, advance payment is required.</li>"+
				"<li>Disclaimer: Product color may slightly vary due to photography, lighting sources or your monitor settings.</li>"+
			"</ul><br><br>";
	}
	else if (val.value=="Replace Policy")
	{
		vikID("CPsCRp").style.color="gray";
		vikID("CPsCRp").innerHTML="<ul>"+
				"<li>Product will be replaced if the it has any defect by its manufacturer.</li>"+
				"<li>Custome needs to inform us within 03 days from the date of delivery.</li>"+
				"<li>Products must be with the tags intact and in their original packaging, in an unwashed and undamaged condition.</li>"+
				"<li>Replacement for products is subject to inspection and checking by PriyoShop team.</li>"+
				"<li>Replacement cannot be possible if the product is burnt, damaged by short circuit, damaged due to neglect, improper usage, or broken by customer.</li>"+
			"</ul><br><br>";
	}
}
function submitComment(val)
{
	if (val!="")
	{
		var xhttp = new XMLHttpRequest();
		var x="<% out.print(home);%>servlet/CommentViewAddDel?action=insert&product_id="+comId+"&text="+val;
		xhttp.open("GET", x, true);
		xhttp.send();
		xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
				if(this.responseText=='ok') { onloadCPsCRp(); }
				else if(this.responseText=='No Login') 
				{  
					setCookie("reduceUrl",crURL(),15);
					vikURL("<% out.print(home);%>log?reduceUrl="+crURL());
				}
				else {  alert("Something Wrong"); }
		    }
		};
	}	
	else
	{
		vikID("textarea").style.border="1px solid red";
	}
}

function onloadCPsCRp()
{
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() 
	{
	    if (this.readyState == 4 && this.status == 200) { 
		    vikID('CPsCRp').innerHTML=this.responseText+'<br>'+ 
		 		'<textarea id="textarea" style="width: 100%" rows="5" oninput="writeText()"></textarea><br>'+
		 		'<input type="submit" class="InputPost" id="submitComment" onclick="submitComment(vikID(\'textarea\').value)">'+
		 		'<br><br><br><br>'; 
	    } 
	};
	xhttp.open("GET", "<% out.print(home);%>servlet/CommentViewAddDel?action=view&product_id="+comId, true);
	xhttp.send();
}

function writeText()
{ 
	vikID("textarea").style.border="1px solid gray";
}
</script>
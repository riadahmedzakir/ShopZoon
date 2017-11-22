<%@include file="../../header.jsp" %> 
<%@include file="../../config.jsp" %> 
<%@page import="entity.Product"%>
<%@page import="core.ServiceProduct"%>
<%@page import="java.util.ArrayList"%>
<div class='cont' style="background:black"> 
	<%@include file="AllCatagory.jsp" %>

	 <div class="part2" id="part2" style="width: 75%;white;margin: 0% 25%">
	 	 <h3 style="width: 93%;color: #633E33;background: #F1C6B9;padding: 10px;margin:0px 0px"><center id='productCat'>ALL CATEGORIES</center></h3>
	 	<%
		 	String proCat =request.getPathInfo().split("/")[request.getPathInfo().split("/").length-1]; 
		    ServiceProduct obj1 = new ServiceProduct(); 
		    ArrayList<Product> proList = (ArrayList<Product>)obj1.showProduct("where product_catagory="+proCat);
		    for(Product product: proList){ 
		    	int pnewPrice=product.getProduct_price() * (100 - product.getProduct_discount()) / 100;
		    	if(product.getProduct_img_catagory().equals("Normal"))
		    	{  
		    		String str = product.getProduct_title().toString();
				    str = str.replaceAll(" ", "/");
        			str = str.replaceAll("[^a-zA-Z ]", "/");

					out.println("<div  style='width:300px;height:400px;background: white;float: left;border: 10px solid #f6f6f6;'>"); 
		    		Object logV = request.getSession().getAttribute("TYPE"); 
		    		if(logV!=null && logV.equals("Admin") | logV.equals("Staff"))
		    		{
		    			String s = new StringBuilder()
			           .append("<div id='product'>")
			           .append("<a href='"+home+"productdetail/"+str+"/"+product.getProduct_id()+"'><img src='"+home+"/img/product/"+product.getProduct_image()+"' height='300px' width='300px'></a>")
			           .append("<a class='text' href='"+home+"EditProduct/\"+pID+\"'><img src='"+home+"/img/Edit.png' title='Edit' width='30px'></a>").toString();
			           out.print(s);
		    		}
		    		else 
		    		{
		    			String s = new StringBuilder()
			           .append("<div id='product'>")
			           .append("<a href='"+home+"/productdetail/"+str+"/"+product.getProduct_id()+"'><img src='"+home+"/img/product/"+product.getProduct_image()+"' height='300px' width='300px'></a>")
			           .append("<a class='text' href=''></a><br>").toString();
			           out.print(s);
		    		}
		    		String xx;
		    		if(product.getProduct_discount()<=0){xx="";}
		    		else{xx= new StringBuilder().append(product.getProduct_price()+" TK").toString();}
		    		
		    		String ss = new StringBuilder() 
					.append("</div>")
					.append("<center>")
					.append("	<font id='proTi'>"+product.getProduct_title()+"</font><br>")
					.append("	<p id='proTiTK'>TK "+pnewPrice+" <font id='tCr'>"+xx+"</font></p>")
					.append("</center>")
					.append("<input type='submit' value='BUY NOW' class='proButton' onclick='vikURL(\""+home+"buynow/"+product.getProduct_id()+"\")'>")
				.append("</div>").toString();
				out.print(ss);
		    	}
		    	else if(product.getProduct_img_catagory().equals("Banner"))
		    	{
		    		out.print("<a href='"+home+"buynow/'><img src='"+home+"/img/product/"+product.getProduct_image()+"' width='95%'' height='100'></a>");
		    	}
		    } 
		%>
	 </div> 
 </div>
</body>
</html>
<script type="text/javascript">  
document.title=vikParam('catagoryTitle'); 
vikID('productCat').innerHTML=vikParam('catagoryTitle'); 

</script>
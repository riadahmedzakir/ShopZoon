
<div class='part1' style="width:20%;position: fixed;">  
	<div style="overflow:auto;height:78%" id="searchUser"> 
		<center><h3 style="color: #633E33;background: #F1C6B9;padding: 15px;margin: -8px 0px">ALL CATEGORIES</h3></center>
		<ul id='allCata'>
			<a id='allCataLoading' class="proButton">
			 	<%@page import="entity.ProductCatagory"%>
			 	<%@page import="core.ServiceProductCatagory"%>
				<%@page import="java.util.ArrayList"%>
				<%
				    ServiceProductCatagory obj = new ServiceProductCatagory(); 
				    ArrayList<ProductCatagory> personList = (ArrayList<ProductCatagory>)obj.showProductCatagory("");
				    for(ProductCatagory people: personList){
				    String str = people.getProduct_catagory();
				    str = str.replaceAll(" ", "/");
        			str = str.replaceAll("[^a-zA-Z ]", "/");  
				    out.println("<li id='ss'><a href='/product/"+str+"/"+people.getId()+"?catagoryTitle="+people.getProduct_catagory()+"'>"+people.getProduct_catagory()+ "</a></li>");
				    } 
				%>
			</a>
		</ul>
	</div>
</div>
 
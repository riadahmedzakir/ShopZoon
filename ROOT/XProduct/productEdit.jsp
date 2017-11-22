<%@include file="../../header.jsp" %> 
<%@include file="../../config.jsp" %> 
<%@page import="java.util.ArrayList" %> 
<%@page import="entity.ProductCatagory"%>
<%@page import="core.ServiceProductCatagory"%>
<%@page import="core.ServiceProduct"%>
<%@page import="entity.Product"%>
<%
if(request.getSession().getAttribute("TYPE")!=null)
{
	if(request.getSession().getAttribute("TYPE")=="Deliver" |request.getSession().getAttribute("TYPE")=="Customar")
	{
		out.print("<script>window.location.href='../../'</script>");
	}
}

else{out.print("<script>window.location.href='../../'</script>");}

String[] uriSpl=request.getRequestURI().split("/");
ArrayList<Product> productList = new ArrayList<>();
ServiceProduct sp=new ServiceProduct(); 
productList=sp.showProduct("where product_id="+uriSpl[2]);
pageContext.setAttribute("productList", productList);
%>
<c:forEach var="productAtt" items="${productList}">
<c:set var="TempProduct_image" value="${productAtt.product_image}" scope="session"  />
<!<%= session.getAttribute( "TempProduct_image" ) %>
<div class='cont' style="background:black"> 
	<div class="part1" style="width: 39.5%;background: white"> 
		<div class='logRegBody' id="logRegBody" style="width:87%;margin: 0% 1%"> 
			<form id="form1" id="form1" enctype="multipart/form-data"> </form>
			<center><h2 id="errorShow"></h2></center> 

					Product Catagory :<br>
			<select id='catagory' class='productFormInputT'>   
				<%
				    ServiceProductCatagory obj = new ServiceProductCatagory(); 
				    ArrayList<ProductCatagory> pcList = (ArrayList<ProductCatagory>)obj.showProductCatagory("");
				    for(ProductCatagory pc: pcList){   
				    out.println("<option value='"+pc.getId()+"'>"+pc.getProduct_catagory()+ "</option>");
				    } 
				%>
			</select><br>

					Product Title :
			<input type='text' class='productFormInputT' value="<c:out value="${productAtt.product_title}"/>" id='title' value='' placeholder='Product Title'><br>
					Product Code :
			<input type='text' class='productFormInputT' value="<c:out value="${productAtt.product_code}"/>" id='code' placeholder='Product Code' ><br>
					Product Price :
			<input type='number' class='productFormInputT' value="<c:out value="${productAtt.product_price}"/>" id='price' min="1" max="500000000" placeholder='Product Price' ><br>
					Product Discount : <span id='discountPer'> <c:out value="${productAtt.product_discount}"/> %</span>
			<input type='range' class='productFormInputT' id='discount' value="<c:out value="${productAtt.product_discount}"/>"  placeholder='Product Discount' oninput="disCount(this.value)" ><br> 
					Product Size :
			<select id='size' class='productFormInputT' > 
				<option value="<c:out value="${productAtt.product_size}"/>"><c:out value="${productAtt.product_size}"/></option><option value="All">All</option><option value="S">S</option>
				<option value="M">M</option><option value="L">L</option><option value="XL">XL</option><option value="XXL">XXL</option>
			</select><a id='tick7'></a> <br>

			<input type='file' name="image" id="image" value='Image Upload' class='productFormInputT' form="form1" onchange='immUp()' style="max-width:60%;min-width:60%" >

			<select class='productFormInputT' id="img_catagory" onchange='imgSize(this.value)' style="max-width:40%;min-width:39%;" > 
				<option value="<c:out value="${productAtt.product_img_catagory}"/>"><c:out value="${productAtt.product_img_catagory}"/></option> 
				<option value="Banner">Banner</option>
				<option value="Normal">Normal</option>
			</select><br>

			<select class='productFormInputT' id="season" style="max-width:100%;min-width:100%;" >
				<option value="<c:out value="${productAtt.product_season}"/>"><c:out value="${productAtt.product_season}"/></option> 
				<option value="Summer">Summer</option>
				<option value="Rainy">Rainy</option>
				<option value="Autumn">Autumn</option> 
				<option value="Winter">Winter</option>
				<option value="Spring">Spring</option> 
			</select><br>

					Product Limit : <span id='liMit'><c:out value="${productAtt.product_limit}"/> Pics</span> 
			<input type='range' class='productFormInputT' id='limit' value="<c:out value="${productAtt.product_limit}"/>" min="1" max="1000" placeholder='Product Limit' oninput="liMit(this.value)"><br>

					Product Discription : 
			<textarea class='productFormInputT' id='discription' rows="5" style="width: 100%" placeholder="Discription..."><c:out value="${productAtt.product_discription}"/></textarea>

			<input type='submit' id='submit' value='Update Product' class='logRegBodyFormInputS' onclick="saveProduct()" style="width: 100%;font-size: 20px">
		   
		</div>
	 </div>

	 <div class="part2" style="width: 60%;">
	 	<center>
	 		<h3 id='imgSizeN'> </h3>
	 	</center>
	 	<img src="<% out.print(home);%>/img/product/<c:out value="${productAtt.product_image}"/>" width="70%" id='imm'> 
	 </div> 
 </div>
</body>
</html>
<script type="text/javascript"> 
document.title = "Upload Product";
var catagory;
var title;
var code;
var price;
var discount;
var size;
var image;
var img_catagory;
var season;
var limit;
var discription;
charMapping("logRegBody","^");  
function charMapping(ID,CHAR)
{
	var str = vikID(ID).innerHTML; 
    var res = str.split(CHAR).join('<span style="color: transparent">'+CHAR+'</span>');
    vikID(ID).innerHTML = res;
}
function immUp() 
{  
	var output = vikID('imm');
	output.src = URL.createObjectURL(event.target.files[0]); 
}
function imgSize(x)
{  
	if(x=='Banner'){vikID('imgSizeN').innerHTML = 'Required Size : 1100*100';}
	else if(x=='Normal'){vikID('imgSizeN').innerHTML = 'Required Size : 300*130';}
	else if(x==''){vikID('imgSizeN').innerHTML = 'Select Image Catagory';} 

} 
function disCount(val)
{
	vikID('discountPer').innerHTML=val+' %';
}

function liMit(val)
{
	vikID('liMit').innerHTML=val+' Pics';
}
function saveProduct()
{  
	catagory=vikID('catagory');
	title=vikID('title');
	code=vikID('code');
	price=vikID('price');
	discount=vikID('discount');
	size=vikID('size'); 
	img_catagory=vikID('img_catagory');
	season=vikID('season');
	limit=vikID('limit');
	discription=vikID('discription'); 
	if(title.value!="" & code.value!="" & price.value!="" & title.value!="" & discription.value!="")
	{
		if(vikID('image').files.length != 0)
		{
		 	var xmlhttp; 
			var formData = new FormData(vikID("form1"));
			xmlhttp = new XMLHttpRequest();
			xmlhttp.open("POST", "http://localhost:8080/servlet/UpdateImage", true);
			xmlhttp.onreadystatechange = function()
			{
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
				{
					var getStr=xmlhttp.responseText;
					console.log(getStr);
					var success = getStr.substring(0, 2);
					var imagename = getStr.substring(2, 200);
					if( success== 'ok')
					{
						var xxx="<% out.print(home); %>servlet/productSave?action=update&id=<c:out value="${productAtt.product_id}"/>&catagory="+catagory.value+"&title="+title.value+"&code="+code.value+"&price="+price.value+"&discount="+discount.value+"&size="+size.value+"&img_catagory="+img_catagory.value+"&season="+season.value+"&limit="+limit.value+"&discription="+discription.value+"&image="+imagename;
						var xhttp = new XMLHttpRequest();
						xhttp.open("GET", xxx, true);
						xhttp.send();
						xhttp.onreadystatechange = function() { 
						    if (this.readyState == 4) {
								if(this.responseText=='ok')
								{
									vikID('popupNotiText').innerHTML = 'Succesfull';
									vikID('popupNoti').style.display = 'block'; 
								}
								else 
								{  
									vikID('popupNotiText').innerHTML = this.responseText;
									vikID('popupNoti').style.display = 'block'; 
								}
								
						    } 
						}; 	 
					}
					else 
					{  
						vikID('popupNotiText').innerHTML = "Image Not Found";
						vikID('popupNoti').style.display = 'block'; 
					}
				} 
				else
				{
					vikID('errorShow').innerHTML=getStr;
				}
			}
			xmlhttp.send(formData);
		}
		else
		{
			var xxx="<% out.print(home); %>servlet/productSave?action=update&id=<c:out value="${productAtt.product_id}"/>&catagory="+catagory.value+"&title="+title.value+"&code="+code.value+"&price="+price.value+"&discount="+discount.value+"&size="+size.value+"&img_catagory="+img_catagory.value+"&season="+season.value+"&limit="+limit.value+"&discription="+discription.value+"&image=<c:out value="${productAtt.product_image}"/>";
			var xhttp = new XMLHttpRequest();
			xhttp.open("GET", xxx, true);
			xhttp.send();
			xhttp.onreadystatechange = function() { 
			    if (this.readyState == 4) {
					if(this.responseText=='ok')
					{
						vikID('popupNotiText').innerHTML = 'Succesfull';
						vikID('popupNoti').style.display = 'block'; 
					}
					else 
					{  
						vikID('popupNotiText').innerHTML = this.responseText;
						vikID('popupNoti').style.display = 'block'; 
					}
					
			    } 
			}; 	 
		}

	}
	else 
	{  
		vikID('popupNotiText').innerHTML = "Please Input";
		vikID('popupNoti').style.display = 'block'; 
	}
}  
</script>
</c:forEach> 
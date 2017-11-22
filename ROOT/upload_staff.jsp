<%@include file="header.jsp" %> 
<%@include file="config.jsp" %> 
<div class='cont' style="background:black"> 
	<div class="part1" style="width: 39.5%;background: white">
		<div class='logRegBody' id="logRegBody" style="width:87%;margin: 0% 1%">

			<form id="form1" id="form1" enctype="multipart/form-data"> </form>
			<center><h2 id="errorShow"></h2></center> 

					Product Catagory :<br>
			<select id='catagory' class='productFormInputT' onload="productCatagory()" > 
				<option value="1">None</option> 
			</select><br>

					Product Title :
			<input type='text' class='productFormInputT' id='title' value='' placeholder='Product Title' "><br>
					Product Code :
			<input type='text' class='productFormInputT' id='code' placeholder='Product Code' ><br>
					Product Price :
			<input type='number' class='productFormInputT' id='price' min="1" max="500000000" placeholder='Product Price' ><br>
					Product Discount : <span id='discountPer'> 0 %</span>
			<input type='range' class='productFormInputT' id='discount' value="0"  placeholder='Product Discount' oninput="disCount(this.value)" ><br> 
					Product Size :
			<select id='size' class='productFormInputT' > 
				<option value="">None</option><option value="All">All</option><option value="S">S</option>
				<option value="M">M</option><option value="L">L</option><option value="XL">XL</option><option value="XXL">XXL</option>
			</select><a id='tick7'></a> <br>

			<input type='file' name="image" id="image" value='Image Upload' class='productFormInputT' form="form1" onchange='immUp()' style="max-width:60%;min-width:60%" >

			<select class='productFormInputT' id="img_catagory" onchange='imgSize(this.value)' style="max-width:40%;min-width:39%;" > 
				<option value="Normal">Image Catagory</option> 
				<option value="Banner">Banner</option>
				<option value="Normal">Normal</option>
			</select><br>

			<select class='productFormInputT' id="season" style="max-width:100%;min-width:100%;" >
				<option value="">Product Season</option> 
				<option value="Summer">Summer</option>
				<option value="Rainy">Rainy</option>
				<option value="Autumn">Autumn</option> 
				<option value="Winter">Winter</option>
				<option value="Spring">Spring</option> 
			</select><br>

					Product Limit : <span id='liMit'>0 Pics</span> 
			<input type='range' class='productFormInputT' id='limit' value="0" min="1" max="1000" placeholder='Product Limit' oninput="liMit(this.value)"><br>

					Product Discription : 
			<textarea class='productFormInputT' id='discription' style="width: 100%" placeholder="Discription..." ></textarea>

			<input type='submit' id='submit' value='Save Product' class='logRegBodyFormInputS' onclick="saveProduct()" style="width: 100%;font-size: 20px">  
		</div>
	 </div>

	 <div class="part2" style="width: 60%;">
	 	<center>
	 		<h3 id='imgSizeN'> </h3>
	 	</center>
	 	<img src="<% out.print(home);%>/img/banner/banner1.jpg" width="100%" id='imm'>
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
onloadCatagory();
function charMapping(ID,CHAR)
{
	var str = document.getElementById(ID).innerHTML; 
    var res = str.split(CHAR).join('<span style="color: transparent">'+CHAR+'</span>');
    document.getElementById(ID).innerHTML = res;
}
function immUp() 
{  
	var output = document.getElementById('imm');
	output.src = URL.createObjectURL(event.target.files[0]); 
}
function imgSize(x)
{  
	if(x=='Banner'){document.getElementById('imgSizeN').innerHTML = 'Required Size : 1100*100';}
	else if(x=='Normal'){document.getElementById('imgSizeN').innerHTML = 'Required Size : 300*130';}
	else if(x==''){document.getElementById('imgSizeN').innerHTML = 'Select Image Catagory';} 

}
function productCatagory()
{
	alert('message?: DOMString');
}
function disCount(val)
{
	document.getElementById('discountPer').innerHTML=val+' %';
}

function liMit(val)
{
	document.getElementById('liMit').innerHTML=val+' Pics';
}
function saveProduct()
{  
	catagory=document.getElementById('catagory');
	title=document.getElementById('title');
	code=document.getElementById('code');
	price=document.getElementById('price');
	discount=document.getElementById('discount');
	size=document.getElementById('size'); 
	img_catagory=document.getElementById('img_catagory');
	season=document.getElementById('season');
	limit=document.getElementById('limit');
	discription=document.getElementById('discription'); 
 	var xmlhttp; 
	var formData = new FormData(document.getElementById("form1"));
	xmlhttp = new XMLHttpRequest();
	xmlhttp.open("POST", "http://localhost:8080/servlet/uploadImage", true);
	xmlhttp.onreadystatechange = function()
	{
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
		{
			var getStr=xmlhttp.responseText;
			var success = getStr.substring(0, 2);
			var imagename = getStr.substring(2, 200);
			if( success== 'ok')
			{
				var xxx="<% out.print(home); %>servlet/productSave?catagory="+catagory.value+"&title="+title.value+"&code="+code.value+"&price="+price.value+"&discount="+discount.value+"&size="+size.value+"&img_catagory="+img_catagory.value+"&season="+season.value+"&limit="+limit.value+"&discription="+discription.value+"&image="+imagename;
				var xhttp = new XMLHttpRequest();
				xhttp.open("GET", xxx, true);
				xhttp.send();
				xhttp.onreadystatechange = function() { 
				    if (this.readyState == 4) {
						if(xhttp.responseText=='ok')
						{
							document.getElementById('popupNotiText').innerHTML = 'Product Upload Succesfull';
							document.getElementById('popupNoti').style.display = 'block'; 
						}
						else { document.getElementById('errorShow').innerHTML=xhttp.responseText; }
						
				    } 
				}; 	 
			}
		} 
		else
		{
			document.getElementById('errorShow').innerHTML=getStr;
		}
	}
	xmlhttp.send(formData);
}
function onloadCatagory()
{
	var xxx="<% out.print(home); %>servlet/productCatagory?type=option";
	var xhttp = new XMLHttpRequest();
	xhttp.open("GET", xxx, true);
	xhttp.send();
	xhttp.onreadystatechange = function() { 
	    if (this.readyState == 4) {  
	    	if(this.responseText!='Error' & this.responseText!='No')
	    	{
	    		document.getElementById('catagory').innerHTML = this.responseText;
	    	} 
	    } 
	};
}


</script>
<%@include file="../../header.jsp" %>
<%@include file="../../config.jsp" %>
<%
String x=request.getRequestURL().toString(); 
%> 


 <div class='cont'> 
	<%@include file="AllCatagory.jsp" %>

	<div class="part2" id="ser" style="width:79.8%;background: none;margin: 0% 20%"> 
	 
	</div> 
 </div>
</body>
</html>
 

<script type="text/javascript">
document.title = "Shop Zoon"; 

document.getElementById("bodyid").onload = function() {home("<c:out value="${param.q}" />")};
function vikAjaxText(val)
 { 
 	var response = "A";
 	var xhttpAllCata = new XMLHttpRequest();
 	xhttpAllCata.open("GET", val, true);
	xhttpAllCata.send(); 
	xhttpAllCata.onreadystatechange = function() {
	    if (xhttpAllCata.readyState == 4 && xhttpAllCata.status == 200) 
	    { 
		    var text = xhttpAllCata.responseText;
            return text;
	    }
	};  
}

function searching(val)
{
	home(val);
}

function home(val)
{
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() 
	{
    	if (this.readyState == 4 && this.status == 200) {
	        var x, i, xmlDoc, txt='';
		    xmlDoc = this.responseXML; 
		    x = xmlDoc.getElementsByTagName('product'); 
		    for (i = 0; i < x.length; i++) { 
		    	var pID=x[i].getElementsByTagName('id')[0].childNodes[0].nodeValue;
		    	var pTitle=x[i].getElementsByTagName('title')[0].childNodes[0].nodeValue;
		    	var pImg=x[i].getElementsByTagName('image')[0].childNodes[0].nodeValue;
		    	var pImgCata="normal";
		    	var pPri=x[i].getElementsByTagName('price')[0].childNodes[0].nodeValue;
		    	var pDis=x[i].getElementsByTagName('discount')[0].childNodes[0].nodeValue;
		    	var pnewPrice=pPri * (100 - pDis) / 100;
		    	if(pDis==0){pPri='';} else{pPri='TK '+pPri}
		    	 
	    		 
	    		if(pTitle.length<=35){pTitle=pTitle+'';}
	    		txt += ''+
					'<div  style="width:300px;height:400px;background: white;float: left;border: 10px solid #f6f6f6;">'+
			    		<% 
			    		Object logV = request.getSession().getAttribute("TYPE"); 
			    		if(logV!=null && logV.equals("Admin") | logV.equals("Staff"))
			    		{
			    			String s = new StringBuilder()
				           .append("\"<div id='product'>\"+\n")
				           .append("\"<img src='"+home+"/img/product/\"+pImg+\"' width='300px'>\"+\n")
				           .append("\"<a class='text' href='"+home+"EditProduct/\"+pID+\"'><img src='"+home+"/img/Edit.png' title='Edit' width='30px'></a>\"+\n").toString();
				           out.print(s);
			    		}
			    		else 
			    		{
			    			String s = new StringBuilder()
				           .append("\"<div id='product'>\"+\n")
				           .append("\"<img src='"+home+"/img/product/\"+pImg+\"' width='300px'>\"+\n")
				           .append("\"<a class='text' href=''></a><br>\"+\n").toString();
				           out.print(s);
			    		}
			    		%> 
						'</div>'+
						'<center>'+
						'	<font id="proTi">'+pTitle+'</font><br>'+
						'	<p id="proTiTK">TK '+pnewPrice+' <font id="tCr">'+pPri+'</font></p>'+
						'</center>'+
						'<input type="submit" value="BUY NOW" class="proButton" onclick="vikURL(\'<% out.print(home);%>productdetail/'+pTitle.replace(/[^a-zA-Z]/g, '_')+'/'+pID+'\')">\
					</div>'; 
		        
		    }
		    vikID("ser").innerHTML = txt; 
   		}
	};
	xhttp.open("GET", "<% out.print(home);%>servlet/search?q="+val, true);
	xhttp.send();
}
</script>
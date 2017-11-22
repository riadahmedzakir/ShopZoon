
<div class='part1' style="width:20%;position: fixed;">  
	<div style="overflow:auto;height:78%" id="searchUser"> 
		<center><h3 style="color: #633E33;background: #F1C6B9;padding: 15px;margin: -8px 0px">ALL CATEGORIES</h3></center>
		<ul id='allCata'>
			 <a id='allCataLoading' onclick="window.location.reload()" class="proButton"><center>Loading...<br>Please Wait 1 Minute Or Click Here</center></a>
		</ul>
	</div>
</div>

<script type="text/javascript">  
var xhttpAllCata = new XMLHttpRequest();
xhttpAllCata.onreadystatechange = function() {
    if (xhttpAllCata.readyState == 4 && xhttpAllCata.status == 200) {
        var x, i, xmlDoc, txt='';
	    xmlDoc = xhttpAllCata.responseXML; 
	    x = xmlDoc.getElementsByTagName('col'); 
	    for (i = 0; i < x.length; i++) { 
	    	var pi=x[i].getElementsByTagName('id')[0].childNodes[0].nodeValue;
	    	var pn=x[i].getElementsByTagName('product_catagory')[0].childNodes[0].nodeValue; 
	        txt += "<li id='ss'><a href='/product/"+pn.replace(/[^a-zA-Z]/g, '_')+"/"+pi+"?catagoryTitle="+pn+"'>"+pn+ "</a></li>";
	    }
	    document.getElementById("allCata").innerHTML = txt; 
    }
};
xhttpAllCata.open("GET", "<% out.print(home);%>servlet/getDB?col=id,product_catagory&table=product_catagory&where=id!=0", false);
xhttpAllCata.send();  
</script>
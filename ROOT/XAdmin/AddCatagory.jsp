<%@include file="../../header.jsp" %>
<%@include file="../../config.jsp" %>
<%@page import="entity.ProductCatagory"%>
<%@page import="core.ServiceProductCatagory"%>
<%@page import="java.util.ArrayList"%>
<%
Object logV = request.getSession().getAttribute("TYPE"); 
if(logV!=null)
{   
	if(!logV.equals("Admin"))
	{
		out.print("<script>window.location.href='../../'</script>");
	} 
}
else
{
	out.print("<script>window.location.href='../../'</script>");
}

%>
<div style="width:100%;height: 40px;background: #E16D6D;">
	<center>
		<a href="<% out.print(home);%>Admin/ActiveAcc" class='adminHeader'>Active User</a>
		<a href="<% out.print(home);%>Admin/AddCatagory" class='adminHeader'>Add Category</a>
		<a href="<% out.print(home);%>Admin/Employee" class='adminHeader'>Employee</a>
	</center>
</div><br>
<div class="part1" style="width: 39.5%;background: white;height: auto;">
	<div class='logRegBody'  style="width:87%;margin: 0% 1%">	
		<input type='button' style='width:100%;background:#6060F4;border:none;height: 40px;font-size: 25px' value='Add Catagory'> 
		<center><h2 id="errorShow"></h2></center> 

		<label id=''> Add Product Catagory Name</label><br>
		<input id="cataValue" class="logRegBodyFormInputT InputPost"> <br>
		<input type='submit' value='Add Catagory' class='logRegBodyFormInputS' onclick="AddCatagory()" style="width: 100%">  
	</div>
</div>
<div class="part2" id="adminTable" style="width: 60%;">
	<table id="allCataTable">
	  <tr>
	    <th>ID</th>
	    <th>Product Catagory Name</th> 
	    <th>Delete</th>
	  </tr>    
		<%	
			ServiceProductCatagory obj = new ServiceProductCatagory(); 
			ArrayList<ProductCatagory> pcList = (ArrayList<ProductCatagory>)obj.showProductCatagory("");
			for(ProductCatagory pc: pcList){   
				out.println("<tr><td>"+pc.getId()+"</td><td>"+pc.getProduct_catagory()+ "</td>");
				out.print("<td><input type='submit' value='Delete' style='color:red;border:none;background:none;cursor:pointer' onclick='Delete(\""+pc.getId()+"\")'></td></tr>");
			}   
		%>   
	</table> 
</div>
</body>
</html> 
<script type="text/javascript">
document.title = "Add Catagory";

function AddCatagory()
{ 
	var cataValue=vikID('cataValue');
	if(cataValue.value!='')
	{ 
		var xhttp = new XMLHttpRequest();
		var x="<% out.print(home);%>servlet/AdminAddCatagory?action=add&product_catagory="+cataValue.value;
		xhttp.open("GET", x, true);
		xhttp.send(); 
		xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
				if(this.responseText=='ok')
				{
					vikID('popupNotiText').innerHTML = 'Succesfull';
					vikID('popupNoti').style.display = 'block'; 
				}
				else 
				{  
					vikID('popupNotiText').innerHTML = 'Something Problem Try Again';
					vikID('popupNoti').style.display = 'block'; 
				}
		    }
		};
	}
	else { 
		vikID('popupNotiText').innerHTML = 'Input Field Empty';
		vikID('popupNoti').style.display = 'block'; 
	} 
}

function Delete(val) 
{
	if (confirm('Want to delete ?') == true) {
		var xhttp = new XMLHttpRequest();
		var x="<% out.print(home);%>servlet/AdminAddCatagory?action=delete&id="+val;
		xhttp.open("GET", x, true);
		xhttp.send(); 
		xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
				if(this.responseText=='ok')
				{
					vikID('popupNotiText').innerHTML = 'Succesfull';
					vikID('popupNoti').style.display = 'block'; 
				}
				else 
				{  
					vikID('popupNotiText').innerHTML = 'Something Problem Try Again';
					vikID('popupNoti').style.display = 'block'; 
				}
		    }
		};
	} 
	else {}
}
</script>
<%@include file="../../header.jsp" %>
<%@include file="../../config.jsp" %>
<%@page import="entity.Order"%>
<%@page import="entity.Payment"%>
<%@page import="core.staff.ServiceStaff"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
Object logV = request.getSession().getAttribute("TYPE"); 
if(logV!=null)
{   
	if(!logV.equals("Staff"))
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
		<a href="<% out.print(home);%>Staff/NewOrder" class='adminHeader'>New Order</a>
		<a href="<% out.print(home);%>Staff/AllOrder" class='adminHeader'>All Order</a>
		<a href="<% out.print(home);%>Staff/CancelOrder" class='adminHeader'>Cancel Order</a>
		<a href="<% out.print(home);%>Staff/Area" class='adminHeader'>Area</a>
	</center>
</div><br>

<div style="margin:0px 400px;float:left;width:35%;height:auto;background:#FAF7F7;border-style:dotted;padding:15px"> 
		<div style="margin:0px 10px;float:left">
			<font style="font-size: 150%"><c:out value="${param.bFullname}" /></font>  
			User ID or Email <br>  
				<input type="" name="" placeholder="Email & id" class="InputPost" oninput="checkUser(this.value)" style="cursor:text;width:185%"><br><br> 
			Name<br>  
				<input type="" id="delName" placeholder="Name" class="InputPost" readonly style="cursor:text;width:185%"><br><br> 
			Address <br>
				<input type="" id="delArea" placeholder="Enter Area" class="InputPost" style="cursor:text;width:185%"><br><br> 

				<input type="text" id="delId" style="display:none">
				<input type="submit" value="Update Area" class="InputPost" onclick="changeArea()" style="width:185%;"> 
		</div>
	</div>  
</body>
</html> 
<script type="text/javascript">
document.title = "Deliver Area Change";   
 
function checkUser(val) 
{  
	var xhttp = new XMLHttpRequest();
	var x="<% out.print(home);%>servlet/Staff?action=checkUser&email="+val;
	xhttp.open("GET", x, true);
	xhttp.send(); 
	xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) { 
	    	if(this.responseText!="null")
	    	{
	    		var x=this.responseText.split("/");
				vikID('delName').value = x[0]; 
				vikID('delId').value = x[1]; 
	    	}
	    	else
	    	{
	    		vikID('delName').value = "Not Found"; 
	    	}
	    	
	    }
	}; 
}

function changeArea()
{
	if(vikID("delId").value!=""& vikID("delArea").value!="")
	{
		var xhttp = new XMLHttpRequest();
		var x="<% out.print(home);%>servlet/Staff?action=changeArea&id="+vikID("delId").value+"&area="+vikID("delArea").value;
		xhttp.open("GET", x, true);
		xhttp.send(); 
		xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) { 
		    	if(this.responseText=="ok")
		    	{
		    		vikID('popupNotiText').innerHTML = "Successfull";
					vikID('popupNoti').style.display = 'block'; 
		    	}
		    	else
		    	{
		    		vikID('popupNotiTextF').innerHTML = "User Not Found";
					vikID('popupNotiF').style.display = 'block';  
		    	}
		    	
		    }
		};
	}
	else
	{
		if(vikID("delId").value=="")
		{
			vikID('popupNotiTextF').innerHTML = "User Not Found";
			vikID('popupNotiF').style.display = 'block'; 
		}
		else if(vikID("delArea").value=="")
		{
			vikID('popupNotiTextF').innerHTML = "Area Is Empty";
			vikID('popupNotiF').style.display = 'block'; 
		}
		else
		{
			vikID('popupNotiTextF').innerHTML = "Plese Input All Field";
			vikID('popupNotiF').style.display = 'block'; 
		}
		
	}
}
</script>
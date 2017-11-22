
<%@include file="../../header.jsp" %>
<%@include file="../../config.jsp" %>
<%@page import="entity.People"%>
<%@page import="core.ServicePeople"%>
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

<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="vikID('myModal').style.display = 'none';">&times;</span>
    	<center>
    		<table id='aboutUser' style="width: 50%;"> 
			</table>
			<br>
			<div id="acDiac">
				
			</div> 
    	</center>

  </div>
</div>

<div class="part2" id="adminTable" style="width: 100%;">
	<center>
		<table id="AuthorityTrue" style="width: 60%">
		  <tr> 
		    <th>User Name</th>
		    <th>User Type</th>
		     <th>Active</th>
		    <th>View</th>
		  </tr>   
		  <%	
			ServicePeople obj = new ServicePeople(); 
			ArrayList<People> pcList = (ArrayList<People>)obj.showUser("where active !=1");
			for(People pc: pcList){   
				String active=""; 
				if(pc.getActive()==0){active="Panding";} if(pc.getActive()==10){active="Disable";}
				out.println("<tr><td>"+pc.getFname()+ " "+pc.getLname()+"</td><td>"+pc.getType()+"</td><td>"+active+ "</td></td>");
				out.print("<td><input type='submit' value='View' style='color:blue;border:none;background:none;cursor:pointer' onclick='viewUser(\""+pc.getId()+","+pc.getFname()+","+pc.getLname()+","+pc.getEmail()+","+pc.getType()+","+pc.getRating()+","+pc.getActive()+","+pc.getLocation()+","+pc.getPhone()+"\")'></td></tr>");
			}   
		%>     
		</table>  
	</center>
 	 
</div>
</body>
</html> 
<script type="text/javascript">
document.title = "View Privilege"; 
 
function viewUser(val)
{
	var txt;
	var sp = val.split(",");  
	var id=sp[0];
	var fname="<tr><td>First Name</td><td>"+sp[1]+ "</td><tr>";
	var lname="<tr><td>Last Name</td><td>"+sp[2]+ "</td><tr>";
	var email="<tr><td>Email Add</td><td>"+sp[3] + "</td><tr>";
	var type="<tr><td>Account Type</td><td>"+sp[4]+ "</td><tr>"; 
	var active="<tr><td>Active</td><td>Panding</td><tr>";
	var address="<tr><td>Address</td><td>"+sp[7] + "</td><tr>";
	var phone="<tr><td>Phone</td><td>"+sp[8] + "</td><tr>";
	txt = ""+fname+lname+email+type+active+address+phone+"";
	acDiac="<input type='submit' value='Active' class='InputPost' onclick='activeAcc(\""+id+"\",\"active\")'>&nbsp;"+
	"<input type='submit' value='Inactive' class='InputPost' onclick='activeAcc(\""+id+"\",\"inactive\")'>"

	vikID("aboutUser").innerHTML = txt; 
	vikID("acDiac").innerHTML = acDiac;
	vikID('myModal').style.display = 'block';	    
	
}
 
function activeAcc(val,val1) 
{ 
	if (confirm('Want to '+val1+' ?') == true) {
		var xhttp = new XMLHttpRequest();
		var x="<% out.print(home);%>servlet/AdminEmployee?action="+val1+"&id="+val;
		xhttp.open("GET", x, true);
		xhttp.send(); 
		xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
				if(this.responseText=='ok')
				{
					vikID('myModal').style.display = 'none'; 
					vikID('popupNotiText').innerHTML = 'Succesfull';
					vikID('popupNoti').style.display = 'block'; 
				}
				else 
				{  
					vikID('myModal').style.display = 'none';
					vikID('popupNotiText').innerHTML = 'Something Problem Try Again';
					vikID('popupNoti').style.display = 'block'; 
				}
		    }
		};
	} 
	else {} 
}
</script>
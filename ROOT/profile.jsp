<%@include file="header.jsp" %>
<%@include file="config.jsp" %>
<%@page import="entity.Config"%> 
<%
String x=request.getRequestURL().toString(); 
%> 
 <div class='cont'> 
	<%@include file="/XProduct/AllCatagory.jsp" %>
	<div id="myModal" class="modal">
		<div class="modal-content" style="width: 30%">
			<span class="close" onclick="vikID('myModal').style.display = 'none';">&times;</span>
			<div id="writeIn">
				
			</div>	
		</div> 
	</div>
	<div class='cont'>
		<div class="part1" style="width:39.8%;height:300px;background: no-repeat;margin: 0% 20%;">
			<table style="width: 95%;margin: 30px 3px">
				<tr> 
					<td class="InputPostT">First Name</td> 
					<td class="InputPostT" ><% out.print(request.getSession().getAttribute("FNAME")); %></td> 
					<td><input type="submit" value="Edit" class="InputPost" onclick="fnameCh()"></td>
				</tr> 
				<tr> 
					<td class="InputPostT">Last Name</td> 
					<td class="InputPostT"><% out.print(request.getSession().getAttribute("LNAME")); %></td> 
					<td><input type="submit" value="Edit" class="InputPost" onclick="lnameCh()"></td>
				</tr> 
				<tr> 
					<td class="InputPostT">User Name</td> 
					<td class="InputPostT"><% out.print(request.getSession().getAttribute("USERNAME")); %></td> 
					<td><input type="submit" value="Edit" class="InputPost" onclick="usernameCh()"></td>
				</tr> 
				<tr> 
					<td class="InputPostT">Email</td> 
					<td class="InputPostT"><% out.print(request.getSession().getAttribute("EMAIL")); %></td> 
					<td><input type="submit" value="Edit" class="InputPost" onclick="emailCh()"></td>
				</tr> 
				<tr> 
					<td class="InputPostT">Password</td> 
					<td class="InputPostT">********</td> 
					<td><input type="submit" value="Edit" class="InputPost" onclick="passCh()"></td>
				</tr> 
				<tr> 
					<td class="InputPostT">Account Type</td> 
					<td class="InputPostT"><% out.print(request.getSession().getAttribute("TYPE")); %></td>  
				</tr> 
			</table> 
		</div> 
		<div class="part2" style="width:40%;background: no-repeat;margin: -300px 60%;">
			<center><br> 
				<form id="form1" id="form1" enctype="multipart/form-data"> </form>
				<img src='<% out.print(Config.isImg("user/user"+request.getSession().getAttribute("ID").toString()+".png"));%>' width="50%" height="50%"> <br><br>
				<label for="uploadImg" class="InputPostT InputPost">Change Image</label>
				<input type="file" id='uploadImg' form="form1" name="file" onchange='immUp()' style="display: none;">
			</center>
		</div> 
	</div>
 </div>
</body>
</html>
 

<script type="text/javascript">
document.title="<% out.print(request.getSession().getAttribute("FNAME")+" "+request.getSession().getAttribute("LNAME")); %>";
function immUp()
{ 
	var xhttp; 
	var formData = new FormData(vikID("form1"));
	xhttp = new XMLHttpRequest();
	xhttp.open("POST", "http://localhost:8080/servlet/ProfileImage", true);

	xhttp.onreadystatechange = function()
	{
		if(xhttp.readyState == 4 && xhttp.status == 200)
		{ 
			var getStr=xhttp.responseText;
			var success = getStr.substring(0, 2);
			var imagename = getStr.substring(2, 200);
			/*if( success== 'ok') { window.location.reload(); }
			else { alert(xhttp.responseText);  }*/
			alert(xhttp.responseText);
		}
		else
		{
			console.log(xhttp.responseText);
		}
	}
	xhttp.send(formData);
}

function fnameCh()
{
	vikID('myModal').style.display = "block";
	vikID('writeIn').innerHTML ='<a><center>Enter Your First Name</center></a>'+
			'<center><a style="color:red" id="chError"></a><center>'+
			'<input type="text" id="firstnameV" value="<% out.print(request.getSession().getAttribute("FNAME")); %>" class="productFormInputT">'+
			'<input type="submit" name="" value="Change" class="logRegBodyFormInputS" style="width:100%" onclick="AjaxfnameCh(vikID(\'firstnameV\').value)">';
}
function lnameCh()
{
	vikID('myModal').style.display = "block";
	vikID('writeIn').innerHTML ='<a><center>Enter Your Last Name</center></a>'+
			'<center><a style="color:red" id="chError"></a><center>'+
			'<input type="text" id="lastnameV" value="<% out.print(request.getSession().getAttribute("LNAME")); %>" class="productFormInputT">'+
			'<input type="submit" name="" value="Change" class="logRegBodyFormInputS" style="width:100%" onclick="AjaxlnameCh(vikID(\'lastnameV\').value)">';
}
function usernameCh()
{
	vikID('myModal').style.display = "block";
	vikID('writeIn').innerHTML ='<a><center>Enter Your Userame</center></a>'+
			'<center><a style="color:red" id="chError"></a><center>'+
			'<input type="text" id="usernameV" value="<% out.print(request.getSession().getAttribute("USERNAME")); %>" class="productFormInputT">'+
			'<input type="submit" name="" value="Change" class="logRegBodyFormInputS" style="width:100%" onclick="AjaxusernameCh(vikID(\'usernameV\').value)">';
}
function emailCh()
{
	vikID('myModal').style.display = "block";
	vikID('writeIn').innerHTML ='<a><center>Enter Your Email</center></a>'+
			'<center><a style="color:red" id="chError"></a><center>'+
			'<input type="email" id="emailV" value="<% out.print(request.getSession().getAttribute("EMAIL")); %>" class="productFormInputT">'+
			'<input type="submit" name="" value="Change" class="logRegBodyFormInputS" style="width:100%" onclick="AjaxemailCh(vikID(\'emailV\').value)">';
}
function passCh()
{
	vikID('myModal').style.display = "block";
	vikID('writeIn').innerHTML ='<a><center>Change Password</center></a>'+
			'<center><a style="color:red" id="chError"></a><center>'+
			'<input type="password" id="p0" class="productFormInputT" placeholder="Current Password">'+ 
			'<input type="password" id="p1" class="productFormInputT" placeholder="New Password">'+ 
			'<input type="password" id="p2" class="productFormInputT" placeholder="Again New Password">'+
			'<input type="submit" name="" value="Change" class="logRegBodyFormInputS" style="width:100%" onclick="AjaxpassCh(vikID(\'p0\').value,vikID(\'p1\').value,vikID(\'p2\').value)">';
}

function AjaxfnameCh(val)
{
	alert(val);
}
function AjaxlnameCh(val)
{
	 alert(val);
}
function AjaxusernameCh(val)
{
	 alert(val);
}
function AjaxemailCh(val)
{
	 alert(val);
}
function AjaxpassCh(val0,val1,val2)
{
	 alert(val0+val1+val2);
}
</script>
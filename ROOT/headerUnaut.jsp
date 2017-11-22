<%@include file="config.jsp" %>
<?xml version='1.0' encoding='UTF-8' ?>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:h="http://xmlns.jcp.org/jsf/html">  
<head>
	<title></title>
	<link rel='stylesheet' type='text/css' href='<% out.print(home); %>/CSS/header.css'>
	<link rel='stylesheet' type='text/css' href='<% out.print(home); %>/CSS/allCatagoty.css'>
	<link rel='stylesheet' type='text/css' href='<% out.print(home); %>/CSS/style.css'>
	<script src="<% out.print(home); %>JS/valid.js"></script> 
</head>
<body id="bodyid">
 <div class='header'> 
 	<input type='image' src='<% out.print(home); %>/img/logo.png' width='60' height='60' onclick="window.location.href='<% out.print(home); %>'">
	<input type='text' id="srcText" value="<c:out value="${param.q}" />" style='margin:20px 13%;height:30px;width: 30%;float: left;' placeholder=" Search" oninput="searching(this.value)">
	<input type='submit' style='margin:20px -13%;height:36px;width:100px;float:left;background:#3C3C41;border:none;color:white;font-size:18px' value='Search' list='sValue' onclick="goSearch(vikID('srcText').value)" >
    <script type="text/javascript"> 
	    function goSearch(val)
	    {
	        window.location.href='http://localhost:8080/search?q='+val;
	    }
    </script>
		<datalist id='sValue'>
			<option value='Sazzad Hossain'>
			<option value='v'>
		</datalist>
 	<div class='headerItems'> 
 		<ul> 
 			<li><a href='' class='headerUlLiA'>(1) Items</a></li>
 			<li>
 				<a href='#' class='headerUlLiA'>
 					<div class='logRegDropDown'>My Account <img src='<% out.print(home); %>/img/profile.png' align='top'></a>
						<div class='logRegDropDown-content'>
							<a href='<% out.print(home); %>reg'><p class='logRegDropDownP'> Registetion</p></a>
							<a href='<% out.print(home); %>log'><p class='logRegDropDownP'> Log In</p></a>
						</div>
					</div> 
 			</li>
 		</ul>
 	</div>
 </div><br><br><br><br>  
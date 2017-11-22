<%@include file="header.jsp" %> 
<br>
 <div id="myModal" class="modal">
		<div class="modal-content" style="width: 50%">
			<span class="close" onclick="vikID('myModal').style.display = 'none';">&times;</span>
			<div id="writeIn">
				
			</div>	
		</div> 
	</div>
 <div class='logRegBody'>
 <input type='button' style='width:50%;background:#6060F4;border:none;height: 40px;font-size: 25px' value='Registetion' onclick="window.location.href='reg'"><input type='button' style='width: 50%;background: #9494F5;border: none;height: 40px;font-size: 25px' value='Log In' onclick="window.location.href='log'">
 		<center><h2 id="errorShow"></h2></center> 

 		<input type='text' class='logRegBodyFormInputT' id='fname' placeholder='First Name' onkeypress="return nameF(event);"><a id='tick1'></a>
 		<input type='text' class='logRegBodyFormInputT' id='lname' placeholder='Last Name' onkeypress="return nameL(event);"><a id='tick2'></a>
 		<input type='email' class='logRegBodyFormInputT' id='email' placeholder='username@gmail.com' oninput="mail();"><a id='tick3'></a>
 		<input type='text' class='logRegBodyFormInputT' id='address' placeholder='Current Address' oninput="document.getElementById('tick4').innerHTML=' &#10004;';"><a id='tick4'></a>
 		<select id='type' class='logRegBodyFormInputT' onchange='accType();'>
			  <option value="">Account Type</option>
			  <option value="Customar">Customar</option>
			  <option value="Staff">Staff</option>
			  <option value="Deliver">Deliver</option>
		</select><a id='tick7'></a>
	    <input type='password' class='logRegBodyFormInputT' id='passwordNew' placeholder='New Password' oninput="CheckPassword()"><a id='tick5'></a>
	    <input type='password' class='logRegBodyFormInputT' id='passwordAgain' placeholder='Again Password' oninput="CheckConfirmPassword()"><a id='tick6'></a>
	  
	  	<label id='logFail'> 
	  	</label><br>
	    <input type='submit' value='Sign Up' class='logRegBodyFormInputS' onclick="reg()" style="width: 100%">  
 </div>
</body>
</html>
<%
	 Object reg = request.getSession().getAttribute("ID"); 
	 if(reg!=null)
	 { 

	 }
%>
<script type="text/javascript">
	document.title = "Registetion";
	var fname=document.getElementById('fname');
	var lname=document.getElementById('lname');
	var email=document.getElementById('email');
	var address=document.getElementById('address');
	var type=document.getElementById('type'); 
	var pass=document.getElementById('passwordNew');
	var passA=document.getElementById('passwordAgain');

	var emailUse;
	var passw=  /^[A-Za-z]\w{7,14}$/;
	function nameF(e)
	{
		try {
			if (window.event) {var charCode = window.event.keyCode;}
			else if (e) {var charCode = e.which;}
			else { document.getElementById('tick1').innerHTML='&#10004;'; }
			if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)){document.getElementById('tick1').innerHTML='&#10004;';}
			else{document.getElementById('tick1').innerHTML='&#10008;';}
		}catch (err) {}
	} 
	function nameL(e)
	{
		try {
			if (window.event) {var charCode = window.event.keyCode;}
			else if (e) {var charCode = e.which;}
			else { document.getElementById('tick2').innerHTML='&#10004;'; }
			if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)){document.getElementById('tick2').innerHTML='&#10004;';}
			else{document.getElementById('tick2').innerHTML='&#10008;';}
		}catch (err) {}
	} 
	function mail() 
	{
		if (window.XMLHttpRequest) {xmlhttp=new XMLHttpRequest();} 
		else { xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");}
		xmlhttp.onreadystatechange=function() {
			if (this.readyState==4 && this.status==200) {
				if(this.responseText =='null<br>Email Already Use')
				{
					emailUse="Email Already Use";
					document.getElementById('tick3').innerHTML='&#10008;';
					vikID('errorShow').innerHTML='Email Already Use';
				}
				else if(this.responseText =='ok')
				{
					emailUse="";
					document.getElementById('tick3').innerHTML='&#10004;';
					vikID('errorShow').innerHTML='';
				}
				else if(vikID('email').value=="")
				{
					emailUse="";
					document.getElementById('tick3').innerHTML='&#10008;';
				}
			}
		}
		xmlhttp.open("GET","/servlet/emailuse?email="+email.value,true);
		xmlhttp.send();
	}
	function accType()
	{ 
		if(type.value=='') { document.getElementById('tick7').innerHTML='&#10008;'; }
		else { document.getElementById('tick7').innerHTML='&#10004;'; }
	}
	function CheckPassword()   
	{  
		if(pass.value.match(passw)){document.getElementById('tick5').innerHTML=' &#10004;';}  
		else {document.getElementById('tick5').innerHTML='&#10008;';}
	}
	function CheckConfirmPassword()   
	{   
		if(passA.value.match(passw) && pass.value==passA.value) {document.getElementById('tick6').innerHTML=' &#10004;';} 
		else {document.getElementById('tick6').innerHTML='&#10008;';}
	}

	function reg()
	{ 
		if(emailUse=="Email Already Use"){document.getElementById('errorShow').innerHTML=emailUse;}
		else if(pass.value!=passA.value){document.getElementById('errorShow').innerHTML="Password Not Match";}
		else if(type.value==''){document.getElementById('errorShow').innerHTML="Account Type Is Empty";}
		else if(fname.value!='' && lname.value!='' && email.value!='' && email.value!='' && address.value!='' && pass.value!='' && type.value!='' )
		{ 
			var xhttp = new XMLHttpRequest();
			var x="./servlet/reg?fname="+fname.value+"&lname="+lname.value+"&email="+email.value+"&location="+address.value+"&password="+pass.value+"&type="+type.value;
			xhttp.open("GET", x, true);
			xhttp.send();
			xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
					if(this.responseText=='ok')
					{ 
						vikID('myModal').style.display = "block";
						vikID('writeIn').innerHTML ="<center><h2> Successful Please Log In</h2></center>"; 
					}
					else 
					{  
						vikID('myModal').style.display = "block";
						vikID('writeIn').innerHTML ="<center><h2>"+this.responseText+"</h2></center>";  
					}
			    }
			};
		}
		else { 
			vikID('errorShow').innerHTML='';
			vikID('myModal').style.display = "block";
			vikID('writeIn').innerHTML ="<center><h2>Input All Field</h2></center>"; 
		}
	}

</script>
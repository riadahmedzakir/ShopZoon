<%@include file="headerUnaut.jsp" %> 
<br>
 <div class='logRegBody'>
 <input type='button' style='width:100%;background:#6060F4;border:none;height: 40px;font-size: 25px' value='Registetion' onclick="window.location.href='reg.jsp'"> 
 		<center><h2 id="errorShow"></h2></center> 

 		<label>Enter Your Email</label><br>
 		<input type='email' class='logRegBodyFormInputT' id='email' placeholder='username@gmail.com'> 
 		<input type='text' class='logRegBodyFormInputT' id='code' placeholder='Enter Code'>  
 		<input type='text' class='logRegBodyFormInputT' id='pass1' placeholder='Enter Password'>  
 		<input type='text' class='logRegBodyFormInputT' id='pass2' placeholder='Enter Again Password'>  
	    <input type='submit' value='Next' class='logRegBodyFormInputS' onclick="reg()" style="width: 100%">  
 </div>
</body>
</html>
<%
	 Object log = request.getSession().getAttribute("ID"); 
	 if(log!=null)
	 {
	 	//out.print("<script>window.location.href='./'</script>");
	 }
	 
%>
<script type="text/javascript">
	
	vikID("code").style.display = 'none';
	vikID("pass1").style.display = 'none';
	vikID("pass2").style.display = 'none';
	var act=""; 
	function reg()
	{
		var em=document.getElementById('email').value;
		if(em!='' & act=="")
		{ 
			var xhttp = new XMLHttpRequest();
			var x="<% out.print(home); %>servlet/ForgotPassword?action=check&email="+em;
			xhttp.open("GET", x, true);
			xhttp.send();
			xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
					if(this.responseText=='found')
					{
						vikID("code").style.display = 'block';
						vikID("email").readOnly = true;
						act="found";
					}
					else
					{
						alert("Not Found")
					}
			    }
			};
		}
		else if(em!='' & act=="found")
		{ 
			var xhttp = new XMLHttpRequest();
			var x="<% out.print(home); %>servlet/ForgotPassword?action=codecheck&email="+em+"&code="+vikID("code").value;
			xhttp.open("GET", x, true);
			alert(x)
			xhttp.send();
			xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
					if(this.responseText=='codefound')
					{
						vikID("pass1").style.display = 'block';
						vikID("pass2").style.display = 'block';
						vikID("code").readOnly = true;
						act="emailCodeFound";
					}
					else {
						alert(this.responseText);
					}
			    }
			};
		}
		else if(em!='' & act=="emailCodeFound")
		{ 
			if(vikID("pass1").value==vikID("pass2").value)
			{
				var xhttp = new XMLHttpRequest();
				var x="<% out.print(home); %>servlet/ForgotPassword?action=passChange&email="+em+"&code="+vikID("code").value+"&password="+vikID("pass1").value;
				xhttp.open("GET", x, true);
				alert(x)
				xhttp.send();
				xhttp.onreadystatechange = function() {
				    if (this.readyState == 4 && this.status == 200) {
						if(this.responseText=='success')
						{
							window.location.href="/log";
						}
						else {
							alert("Something Error Try Again");
						}
				    }
				};
			}
			
		}
		else {
			document.getElementById('errorShow').innerHTML="Input Field Empty";
		}
	}
</script>
<%@include file="header.jsp" %> 
<br>
 <div class='logRegBody'>
 <input type='button' style='width: 50%;background: #6060F4;border: none;height: 40px;font-size: 25px' value='Log In' onclick="window.location.href='log'"><input type='button' style='width:50%;background:#9494F5;border:none;height:40px;font-size: 25px' value='Registetion' onclick="window.location.href='reg'"> 
 		<center><h3 id="errorShow"><font style="color: transparent;">.</font></h3></center>
        <label >Email/Username</label>
	    <input type='email' class='logRegBodyFormInputT' id='email' placeholder='username@gmail.com'>

	    <label>Password</label>
	    <input type='password' class='logRegBodyFormInputT' id='password' placeholder='P@$$w0rd'><br>
	  	<input id="remember" value="" type="checkbox" onclick="remember()">Remember me 

	  	<label id='logFail'>
	  	</label><br>
	    <input type='submit' value='Log In' class='logRegBodyFormInputS' onclick="log()"> 
	    <input type='submit' value='Forgot password?' class='logRegBodyFormInputS' onclick="window.location.href='forgotpassword'">  
 </div>
</body>
</html> 
<%  
    Cookie[] cookies = request.getCookies();
	if( cookies != null ) {  
        for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			if(cookie.getName().equals("remember"))
			{
				//out.print(cookie.getValue());
			}   
        }
     }  

	Object logV = request.getSession().getAttribute("ID"); 
	if(logV!=null)
	{  
		out.print("<script>"); 
		out.print("var user=getCookie('reduceUrl');"); 
		out.print("if (user != '')		"); 
		out.print("{					"); 
		out.print("		setCookie('reduceUrl','',15);	"); 
		out.print("		vikURL(user);	"); 
		out.print("}					");
		out.print("else					"); 
		out.print("{					"); 
		out.print("		vikURL('./');	"); 
		out.print("}					");
		out.print("</script>"); 
	}
	 
%>


<script type="text/javascript">
	document.title = "Log In";
	for (var i = 1; i <=5; i++) {
		document.getElementById('logFail').innerHTML = document.getElementById('logFail').innerHTML+"&nbsp;<font id='circle' style='color:gray;background:gray;'>....</font>";
	} 

	function remember(val) { vikID("remember").value="R";  }
	function log()
	{ 
		document.getElementById('errorShow').innerHTML="Loading....";
		var em=document.getElementById('email').value;
		var pass=document.getElementById('password').value;
		var remember=document.getElementById('remember').value;
		if(em!='' && pass!='' )
		{ 
			var xhttp = new XMLHttpRequest();
			var x="./servlet/log?email="+em+"&password="+pass+"&remember="+remember;
			xhttp.open("GET", x, true);
			xhttp.send(); 
			xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
			    	console.log(this.responseText);
					if(this.responseText=='success')
					{
						window.location.reload();
					}
					else if(this.responseText=='Email or Password Not Match')
					{ 
						document.getElementById('errorShow').innerHTML="Email or Password Not Match"; 
					}
					else if(this.responseText=='Account Panding')
					{ 
						document.getElementById('errorShow').innerHTML="Account Panding"; 
					}
					else if(this.responseText=='Account Inactive')
					{ 
						document.getElementById('errorShow').innerHTML="Account Inactive"; 
					}
					else if(this.responseText=='plzUnlock')
					{ 
						document.getElementById('errorShow').innerHTML="Log In Privilege Lock Check Email More Info";
						document.getElementById('logFail').innerHTML = "";
						for (var i = 1; i <= 5; i++) {
							document.getElementById('logFail').innerHTML = document.getElementById('logFail').innerHTML+"&nbsp;<font id='circle' style='color:red;background:red;'>....</font>";
						} 
					}
					else
					{  
						document.getElementById('errorShow').innerHTML="Email address or password is incorrect. ";
						var str = this.responseText, slug = str.split('/').pop();  
						if(slug=="success"){window.location.reload();}
						else
						{
							if(slug>=0){document.getElementById('logFail').innerHTML = "";} 
							for (var i = 1; i <= slug; i++) {
								document.getElementById('logFail').innerHTML = document.getElementById('logFail').innerHTML+"&nbsp;<font id='circle' style='color:red;background:red;'>....</font>";
							} 
							for (var i = 1; i <= (5-slug); i++) {
								document.getElementById('logFail').innerHTML = document.getElementById('logFail').innerHTML+"&nbsp;<font id='circle' style='color:gray;background:gray;'>....</font>";
							} 
						}
					}
			    }
			};
		}
		else {
			document.getElementById('errorShow').innerHTML="Input Field Empty";
		}
	}
</script>
 
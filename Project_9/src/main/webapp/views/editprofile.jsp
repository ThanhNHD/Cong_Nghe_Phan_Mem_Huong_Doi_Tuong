<!DOCTYPE html>

<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8" />
<title>edit profile</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style/editprofile_style.css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
<%
			String checker = request.getParameter("id");
			if (checker == null) {
				response.sendRedirect("/loginForm");
			}
			checker = request.getParameter("name");
			if (checker == null) {
				response.sendRedirect("/loginForm");}
			String lname= request.getParameter("lname");
			String fname= request.getParameter("fname");
			int phone = Integer.parseInt(request.getParameter("phone"));
			String email= request.getParameter("email");
			String des= request.getParameter("des");
			int id = Integer.parseInt(request.getParameter("id"));
			%>
			
<div id="loadding"><h1>Loading</h1></div>
<div id="content" style="display:none;">
		<div class="mid">
			<div class="title">
				<h2>Edit Profile</h2>
				 <hr width="98%" align="center" color="#D5D5D5" size="2px"/>
			</div>
			<form method="post" action="editProfile" >
			<div class="personal-details">
				<p>    Profile Form Elements</p>
				  <div class="col-6">
				<span class="error" id="fid" class="text-danger"></span>
				<div class="inputs">
					<label><b>First name</b></label> <input name = "firstname" value="<%=fname%>" class="form-control" type="text"
						placeholder="Enter the First name" id="firstname" onchange="fname()">
				</div>
				<span class="error" id="lid" class="text-danger"></span>
				<div class="inputs">
					<label><b>Last name</b></label> <input name = "lastname"  value="<%=lname%>" class="form-control" type="text"
						placeholder="Enter the Last name" id="lastname" onchange="lname()">
				</div>
				<span class="error" id="eid" class="text-danger"></span>
				<div class="inputs">
					<label><b>Email</b></label> <input name = "email" id="email" min="3" max="50" onchange="check()"  class="form-control" type="email"
						placeholder="Enter the Email" value="<%=email%>">
				</div>
				
				<span class="error" id="pid" class="text-danger"></span>
				
				<div class="inputs">
					<label><b>Phone</b></label><span class="details"> </span> <input name = "phone" value="<%=phone%>" onchange="phonecheck()" id="phone" type="text" autocomplete="off" placeholder="Enter your phone number"/>
						
				</div>
				</div>
				<div class="row">
					<div class="inputs">
						<label><b>Description</b></label>
						<textarea name = "des" id="des" class="form-control" type="text"
							placeholder="Enter self-description""><%=des%></textarea>
					</div>
				</div>
				</div>
				<div class="justify-content-end">
					<button type="submit" class="btn" onClick="return validate()">Submit</button>					
					<button type="reset" class="btn">Reset</button>
				</div>
			<input type="hidden" id="id" name="id" value="<%= id %>">
				<input type="hidden" id="name" name="name" value="<%= checker %>">
				</form>
				</div>
				</div>
				<script>
				setTimeout(function(){
					document.getElementById("loadding").style.display = "none"; 
					document.getElementById("content").style.display = ""; 
				}, 2000);
		var false_check="";
         const first = document.querySelector("#firstname");
    	 const last = document.querySelector("#lastname");
    	 const phone = document.querySelector("#phone");
    		const email = document.querySelector("#email");
    		let reggExp =  /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
            function check(){
              if(email.value.match(reggExp)){
                email.style.borderColor = "#27ae60";
                email.style.background = "#eafaf1";
                error.style.display = "none";
                return true;
              }else{
                email.style.borderColor = "#e74c3c";
                email.style.background = "#fceae9";
                error.style.display = "block";
                return false;
              }
            }
		         var regExp = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/;
		         function phonecheck(){
		           if(!phone.value.match(regExp)){
		             phone.style.borderColor = "#e74c3c";
		             phone.style.background = "#fceae9";
		             return true;
		           }else{
		             phone.style.borderColor = "#27ae60";
		             phone.style.background = "#eafaf1";
		             return false;
		           }
		         }
		         function fname(){
		        	 var regName = /^([A-Za-z]{3,30})$/;
		        	 var fname = document.getElementById('firstname').value;
		        	    if(!regName.test(fname)){
		        	    	first.style.borderColor = "#e74c3c";
		                    first.style.background = "#fceae9";
		        	        return true;
		        	    }else{
		        	    	first.style.borderColor = "#27ae60";
		                    first.style.background = "#eafaf1";
		        	        return false;
		        	    }
		         }
		         function lname(){
		        	 var regName = /^([A-Za-z]{3,30})$/;
		        	 var lname = document.getElementById('lastname').value;
		        	    if(!regName.test(lname)){
		        	    	last.style.borderColor = "#e74c3c";
		                    last.style.background = "#fceae9";
		        	        return true;
		        	    }else{
		        	    	last.style.borderColor = "#27ae60";
		                    last.style.background = "#eafaf1";
		        	        return false;
		        	    }
		         }
         function validate()  {
        	 false_check="";
             var f = document.getElementById("firstname").value;
             var l = document.getElementById("lastname").value;
             var p = document.getElementById("phone").value;
             var e = document.getElementById("email").value;
             document.getElementById("eid").innerHTML = "";
             document.getElementById("fid").innerHTML = "";
             document.getElementById("lid").innerHTML = "";
             document.getElementById("pid").innerHTML = "";
             if(e == "") {
            	 document.getElementById("eid").innerHTML = " ** E-mail must be fill";
                 false_check="1";
             }
             else if(e.length<5 ){
            	 document.getElementById("eid").innerHTML = " ** E-mail length must be upto 5";
                 false_check="1";
             }
             else if(!(email.value.match(reggExp))){
            	 document.getElementById("eid").innerHTML = " ** E-mail invalid";
                 false_check="1";
             }
             if(f== "") {
            	 document.getElementById("fid").innerHTML = " ** Firstname must be fill";
                 false_check="1";
             }
             else if(f.length <3 || f.length > 30){
            	 document.getElementById("fid").innerHTML = " ** Firstname length must be between 3-30";
                 false_check="1";
             }
             else if(l == "") {
            	 document.getElementById("lid").innerHTML = " ** Lastname must be fill";
                 false_check="1";
             }
             else if(l.length< 3 || l.length >30 ){
            	 document.getElementById("lid").innerHTML = " ** Lastname must be between 3-30";
                 false_check="1";
             }
             else if(p== "") {
            	 document.getElementById("pid").innerHTML = " ** Phone number must be fill";
                 false_check="1";
             }
             else if(p.length<9 || p.length > 13){
            	 document.getElementById("pid").innerHTML = " ** Phone number length must be between 9-13";
                 false_check="1";
             }
             if(false_check=="1")
            	 {
            	 return false;
            	 }
             return true;
         }
      </script>
</body>
</html>
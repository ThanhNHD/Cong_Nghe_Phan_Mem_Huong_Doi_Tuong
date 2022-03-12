<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Responsive Editor Form</title>
<link rel="stylesheet" href="style\register_style.css" />
<link rel="main" href="Main.js" />
<meta name="viewport" content="width=device-width, initial-scale=." />
</head>
<body>
	<div class="container">
		<div class="title">LOG IN</div>
		<center>	 <p class="text-danger">${mess}</p></center>
		<form method = "POST" onsubmit="return validate()" action="Home">
			<div class="user-detail">
			<span class="error" id="eid" class="text-danger"></span>
				<div class="input-box">					
					<span class="details"> </span> <input value="${user.email }" min="3" max="50" onblur="validate2()" onkeyup="check()" 
														 name="email" id="email" type="email" autocomplete="off" placeholder="Enter your email"/>
						
				</div>
				<div class="error-text">
               Please Enter Valid Email Address
            	</div>
				<span class="error" id="pid" class="text-danger"></span>
				<div class="input-box">
					<span class="details"> </span> <input value="${user.password }" input min="3" max="50" onblur="validate3()"
					name ="password" id="password" type="password" autocomplete="off" placeholder="Enter your password"
						pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z].{8,}"/>
				</div>
			</div>
			<label> <input type="checkbox" checked="checked"
				name="remember" />Remember me
			</label><br>
			<div class = "button">
    			<button type="submit" >Login </button>
			</div>
		</form>
		<script>
		const email = document.querySelector("#email");
        const error = document.querySelector(".error-text");
        const btn = document.querySelector("button");
        let regExp =  /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
        function check(){
          if(email.value.match(regExp)){
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
    	 const pass = document.querySelector("#password");
    	 
    	 function validate2(){
        	 if (email.value == ""){
        		 email.style.borderColor = "#e74c3c";
                 email.style.background = "#fceae9";
                 error.style.display = "none";
        	 }
         }
         function validate3(){
        	 if (pass.value == "" ){
        		 pass.style.borderColor = "#e74c3c";
                 pass.style.background = "#fceae9";
                 error.style.display = "none";
        	 }
        	 else{
        		 pass.style.borderColor = "#27ae60";
                 pass.style.background = "#eafaf1";
                 error.style.display = "none";
               }
         }
         function validate()  {
             var e = document.getElementById("email").value;
             var p = document.getElementById("password").value;

             if(e == "") {
            	 document.getElementById("eid").innerHTML = " ** E-mail must be fill";
                 return false;
             }
             else if(e.length<5 ){
            	 document.getElementById("eid").innerHTML = " ** E-mail length must be upto 5";
                 return false;
             }
             else if(p== "") {
            	 document.getElementById("pid").innerHTML = " ** Password must be fill";
                 return false;
             }
             else if(p.length<8 || p.length > 30){
            	 document.getElementById("pid").innerHTML = " ** Username length must be between 8-30";
                 return false;
             }
             else if(!(email.value.match(regExp))){
            	 document.getElementById("eid").innerHTML = " ** E-mail invalid";
                 return false;
             }

             return true;
         }
      </script>
			<br> <span
				class="uname">You don't have account?<a
				href="register">Click here to sign up</a></span>
	</div>
</body>
</html>
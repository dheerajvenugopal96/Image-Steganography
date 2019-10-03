<%-- 
    Document   : registration
    Created on : Oct 29, 2018, 4:55:52 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>	
<head>
<title>Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<meta name="keywords" content="Cofrestru Registration Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
<link href="css/stylereg.css" rel='stylesheet' type='text/css' />
<!--webfonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:700,300,600,800,400' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Marvel:400,700' rel='stylesheet' type='text/css'>
<!--//webfonts-->
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
</head>
<script>
    var img = document.createElement("img");
    img.src = "img/tick.png";
    img.setAttribute("height","30");
    img.setAttribute("width","30");

    function checkpass()
    {
        var v=document.getElementById("rpassword").value;
        var data=/^.{4,}$/;
        if(v.match(data))
        {
           
            document.getElementById("pass").innerHTML="";
            var src = document.getElementById("pass");
            src.appendChild(img);
            return true;
        }
        else
        {
            
            document.getElementById("pass").innerHTML="*At least 4 characters";
            return false;
        }
    }
    
    function checkemail()
    {
        var v=document.getElementById("femail").value;
        var data=/^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/;
        
        if(v.match(data))
        {   
            document.getElementById("em").innerHTML="";
            var src = document.getElementById("em");
            src.appendChild(img);
            return true;
        }
        else
        {
                 document.getElementById("em").innerHTML="*Invalid Email";
                 return false;
        }
    }
    
    function checkphone()
    {
        var v=document.getElementById("phone").value;
        var data=/^[0-9]{10}$/;
        if(v.match(data))
        {
            document.getElementById("ph").innerHTML="";
            var src = document.getElementById("ph");
            src.appendChild(img);
            return true;
        }
        else
        {
            document.getElementById("ph").innerHTML="*Invalid Number";
            return false;
        }
    }
    function checkcpass()
    {
        var v=document.getElementById("cpassword").value;
        var data=document.getElementById("rpassword").value;
        if(v==data)
        {
            document.getElementById("cp").innerHTML="";
            var src = document.getElementById("cp");
            src.appendChild(img);
            return true;
        }
        else
        {
            document.getElementById("cp").innerHTML="*Password Mismatch";
            return false;
            
        }
    }
    
    function success()
    {
        if(checkemail()&&checkphone()&&checkpass()&&checkcpass())
        {   
            alert("Details have been submitted.Waiting for admin approval");
            return true;
        }
        else
        {
            alert("Enter valid details");
            return false;
        }
    }
</script>
<body>
    <h1 style="color: #E45F5F;">REGISTER TO SECUSHARE</h1>
		<div class="registration">
			<h2>Registration Form</h2>				
                        <form action="registration.html" method="post" onsubmit="return success()" autocomplete="off">
                            <div class="form-infoo">
                                Name
                                <input type="text" class="text" name="fname" id="fname" placeholder="Manager Name" required="">
                                Email                    
                                <input type="text" class="text" name="femail" id="femail" placeholder="Enter email Address" onkeyup="checkemail()" required="">
                                <div id="em" class="valid"></div>
                                Company Name               
                                <input type="text" class="text" name="cname" id="cname" placeholder="Enter Company name" required="">
                                Address                
                                <input type="text" class="text" name="address" id="address" placeholder="Enter Company Address" required="">
                                Address Line 2               
                                <input type="text" class="text" name="address1" id="address1" placeholder="Address Line 2" required="">
                                Phone Number                
                                <input type="text" class="text" name="phone" id="phone" placeholder="Enter Phone number" onkeyup="checkphone()"  required="">
                                <div id="ph" class="valid"></div>               
                                Password               
                                <input type="password"  name="rpassword" id="rpassword" placeholder="Enter Password" onkeyup="checkpass()" required="">
                                <div id="pass" class="valid"></div>
                                Confirm Password                
                                <input type="password" class="cpass" name="cpassword" id="cpassword" placeholder="Confirm Password" onkeyup="checkcpass()"  required="">
                                <div id="cp" class="valid"></div>
                                </div>
					<input type="submit" value="REGISTER">
                            
					</form>
	
                </div>
		


</body>
</html>

<%-- 
    Document   : admin
    Created on : Nov 1, 2018, 10:01:22 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
         <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

	<!-- Font Awesome -->
	<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
    <!-- Animation -->
	<link href="css/animate.css" rel="stylesheet" />
	
    <!-- MyTemplate CSS -->
    <link href="css/style.css" rel="stylesheet">
    
    <link href="css/stylepages.css" type="text/css" rel="stylesheet" media="all">
    <!-- font-awesome icons -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <script src="js/easing.js" type="text/javascript"></script>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
     <script src="js/jquery-2.2.3.min.js" type="text/javascript"></script>
     
     <style>
    #myProgress {
        display: none;
  width: 73%;
  background-color: #ddd;
    }

    #myBar {
  width: 0%;
  height: 30px;
  background-color: #4CAF50;
}
</style>
   
    </head>
    <body>  
            
        <div>
        	<header id="header-banner">
		<nav class="navbar navbar-default navbar-fixed-top fadeIn" role="navigation">
			<div class="container">
				
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#dropdown-box-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<div class="navbar-brand">
                                               <img src="img/icons/Locks.png" alt="lock_image" style="height: 30px;width: 32px;">   <a href="home.html">SecuShare</a>
					</div>
				</div>
                                </header>
     </div>
       <div class="wrapper">
    <aside class="main_sidebar">
        <ul>
             <li><i class="fa fa-floppy-o"></i><a href="encrypt.html">Upload and encrypt</a></li>
            <li><i class="fa fa-share"></i><a href="share.html">Share</a></li>
            <li><i class="fa fa-share-square-o"></i><a href="sharedfiles.html">Shared Files</a></li>
            <li><i class="fa fa-envelope"></i><a href="requestedfiles.html">Requested Files</a></li>
            <li><i class="fa fa-thumbs-up"></i><a href="received.html">Received Files</a></li>
            <li><i class="fa fa-lock"></i><a href="logout.html">Logout</a></li>     
        </ul>
    </aside>
</div>
                    
                    <div class="tbl">
                        
                        <form action="" method="post" enctype="multipart/form-data" autocomplete="off">
                            <br><h3><label>Insert an image for encryption process</label></h3>
                        <br><input type="file" name="file" id="file"  accept="image/x-png,image/gif,image/jpeg" required="">
                        <input type="hidden" name="filename" id="filename" value="${pageContext.request.contextPath}" >
                        <img id="image" style="width:300px;height: 300px">
                        
                        <br><h3><label>Enter Name of the Document</label></h3>
                        <br><input type="text" name="docname" id="docname" style="width: 703px;margin: auto;" required="">
                        <br><h3><label>Paste the text data into the text box</label></h3>
                        <br><textarea name="msg" id="msg" style="width: 703px;height: 182px;"></textarea>
                        <br><h3><label>Enter a password</label></h3>
                        <input type="password" name="dpass" id="dpass" style="width: 703px;margin: auto;" required="">
                        <br><input type="submit" onclick="return move()" value="Encrypt" style="margin-top: 18px;width: 700px;background-color: firebrick;border-collapse: collapse;padding: 7px 22px;color: aliceblue;font-weight: bold;">
                         <div id="myProgress">
                             <span><b>Encryption in progress...Please Wait</b></span>
                             <div id="myBar"> </div>
                        </div>
                        
                        <input type="hidden" name="rid" id="rid" value="<%= session.getAttribute("idd") %>">
                        </form>
                    </div>
                       
                    <script>
                   
                   document.getElementById("file").onchange = function () {
                   var reader = new FileReader();

                    reader.onload = function (e) {
        // get loaded data and render thumbnail.
                        document.getElementById("image").src = e.target.result;
                     };

                 // read the image file as a data URL.
                 reader.readAsDataURL(this.files[0]);
                };
                      </script>
                      
                      <script>
                          
                      
                              
                              function move() {
                                  document.getElementById("myProgress").style.display='block';
                                var elem = document.getElementById("myBar");   
                                var width = 1;
                                var id = setInterval(frame, 50);
                                function frame() {
                                if (width >= 100) {
                                  clearInterval(id);
                                  document.getElementById("myProgress").style.display='none';
                                  
                                  return true;
                                  
                                } else {
                                  width++; 
                                  elem.style.width = width + '%'; 
                                    }
                                  }
                                }
                              
                              
                          
                          
                      </script>
        
        
    </body>
</html>

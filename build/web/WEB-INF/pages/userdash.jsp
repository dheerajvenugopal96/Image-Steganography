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
                        
                        
                            
                        
                        
                    </div>
 


        
        
    </body>
</html>

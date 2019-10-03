<%-- 
    Document   : home
    Created on : Oct 29, 2018, 10:25:09 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SecuShare-Home</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

	<!-- Font Awesome -->
	<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
    <!-- Animation -->
	<link href="css/animate.css" rel="stylesheet" />
	
    <!-- MyTemplate CSS -->
    <link href="css/style.css" rel="stylesheet">
    
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
   
    <script src="js/jquery-1.10.2.js" type="text/javascript"></script>
    
</head>

<body>

    <c:set var="i" value="${sessionScope.idd}"></c:set> 
    <input type="hidden" value="${i}">
    
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
                                            <img src="img/icons/Locks.png" alt="lock_image" style="height: 30px;width: 32px;">   <a href="#">SecuShare</a>
					</div>
				</div>
				
				<!-- Collect the nav links and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="dropdown-box-1">
					
					<ul class="nav navbar-nav">
						<li class="active"><a href="#home">HOME</a></li>
						<li><a href="#aboutus">ABOUT</a></li>
                                        <c:choose>
                                            <c:when test="${empty i}">
                                                <li><button onclick="document.getElementById('login').style.display='block'" class="logbut">LOGIN</button></li>
                                               </c:when>
                                               <c:otherwise>
                                               <li><a href="#" class="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fa fa-user"></span></a>
                                                   <ul class="dropdown-menu">
                                                       <li><a href="userdash.html">MYACCOUNT</a></li>
                                                       <li><a href="logout.html">LOGOUT</a></li>
                                                       
                                                       
                                                   </ul>
                                               
                                               
                                               </li>
                                               </c:otherwise>
                                        </c:choose>
                                                </ul>
                                    
                                    
					
				</div>
				
			</div> <!-- /.container -->
		</nav> <!-- /.nav -->
	</header>
    
    <!-- login div -->
    <div id="login" class="modal">
        <form class="modal-content animate" action="" method="post">
            <div class="imgcontainer">
                <span onclick="document.getElementById('login').style.display='none'" class="close" title="Close">&times;</span>
            <img src="img/log.png" alt="login image" class="avatar">
            </div>
            <div class="container">
                
                <input type="text" name="email" id="email" placeholder="Enter Your Email" required="">
                <input type="password" name="password" id="password" placeholder="Enter Password" required="">
               
                <button type="submit" id="log" class="logbut1">Login</button>
                <div class="toreg" style="text-align: center;padding-top: 21px;">
                    
                    New Here? <a href="registration.html">Create a SecuShare account</a>
                    
                </div>
                
            </div>
        </form>
                
                
            </div>
        
    <!-- login div-->
   
    <div class="alert alert-danger animate" id="ack" style="margin-top: 51px;margin-bottom: auto;" align="center"></div>
     <c:choose>
                <c:when test="${not empty message}">
                    <script>
                        var mydiv=document.getElementById("ack");
                        mydiv.style.display="block";
                        mydiv.innerHTML='<b>! Invalid Details/Waiting For Admin Approval.</b><span onclick=document.getElementById("ack").style.display="none" style="position:absolute; right: 25px;color: black;font-size: 35px;font-weight: bold;cursor:pointer;top: 52px;">&times;</span>';
                       
                    </script>
                </c:when>
                <c:otherwise>
                    <script>
                        var mydiv=document.getElementById("ack");
                        mydiv.style.display="none";  
                    </script>
                    
                </c:otherwise>
     </c:choose>
	<!-- banner -->
    <section class="banner" id="home">
		<div class="container">
			<div class="slogan">
				<h2>SecuShare </h2>
				<h4>Send Your Files Securely using the power of Steganography</h4>
			</div>
			
			<div class="btn-circle-scroll fadeIn">
				<a href="#section-footer" class="btn-circle">
					<i class="fa fa-angle-double-down animated"></i>
				</a>
			</div>
			
		</div>
    </section>
	<!-- /.banner -->

	<!-- aboutus -->
    <section class="aboutus" id="aboutus">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="wow bounceInLeft" data-wow-delay="0.1s"> 
						<h2>About Us</h2> 
					</div>
					<div class="col-sm-7">
						<p>
                                                    <b>What is steganography?</b>

   <br>Steganography is the practice of concealing a file, message, image, or video within another file, message, image, or video.
						</p>
						<p>
                                                    
                                                    <b>What is the advantage of steganography over cryptography?</b>

                                                    <br> The advantage of steganography over cryptography alone is that the intended secret message does not attract attention to itself as an object of scrutiny. Plainly visible encrypted messages, no matter how unbreakable they are, arouse interest and may in themselves be incriminating in countries in which encryption is illegal.

In other words, steganography is more discreet than cryptography when we want to send a secret information. On the other hand, the hidden message is easier to extract.

						</p>
					</div>
					<div class="col-sm-5">
						<div class="img-aboutus">
							<div class="wow fadeIn" data-wow-delay="0.2s">
								<video width = "500" height = "300" controls>
         <source src = "video.mp4" type = "video/mp4">
         
      </video>
							</div>
						</div>
					</div>
				</div>				
			</div>
		</div>
	</section>
        
      
	<!-- /.aboutus -->
	
	<!-- footer -->
	<footer id="section-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<div class="wow fadeIn" data-wow-delay="0.4s">
						<div class="btn-circle-scroll">
							<a href="#header-banner" class="btn-circle">
								<i class="fa fa-angle-double-up animated"></i>
							</a>
						</div>
					</div>
					<p>&copy;&nbspCopyright 2015 - SecuShare. All rights reserved.</p>
				</div>
			</div>	
		</div>
	</footer>
	<!-- /.footer -->
        <!-- login script -->
        <script>
         var modal=document.getElementById("login");
         window.onclick=function(event)
         {
             if(event.target==modal)
             {
                 modal.style.display="none";
             }
         };
         
    </script>
        <script>
                                (function (global) { 

                        if(typeof (global) === "undefined") {
                            throw new Error("window is undefined");
                        }

                        var _hash = "!";
                        var noBackPlease = function () {
                            global.location.href += "#";

                            // making sure we have the fruit available for juice (^__^)
                            global.setTimeout(function () {
                                global.location.href += "!";
                            }, 50);
                        };

                        global.onhashchange = function () {
                            if (global.location.hash !== _hash) {
                                global.location.hash = _hash;
                            }
                        };

                        global.onload = function () {            
                            noBackPlease();

                            // disables backspace on page except on input fields and textarea..
                            document.body.onkeydown = function (e) {
                                var elm = e.target.nodeName.toLowerCase();
                                if (e.which === 8 && (elm !== 'input' && elm  !== 'textarea')) {
                                    e.preventDefault();
                                }
                                // stopping event bubbling up the DOM tree..
                                e.stopPropagation();
                            };          
                        }

                    })(window);


            
        
            
        
        </script>
        <!-- login script -->
	
	<!-- Core JavaScript Files -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.min.js"></script>	
	<script src="js/jquery.scrollTo.js"></script>
	<script src="js/wow.min.js"></script>			<!-- Reveal animation when you scroll by wow.js. It need animate.css library -->
	<!-- Custom Theme JavaScript -->
	<script src="js/custom.js"></script>

</body>

</html>

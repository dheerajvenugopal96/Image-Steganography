<%-- 
    Document   : admin
    Created on : Nov 1, 2018, 10:01:22 AM
    Author     : acer
--%>

<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.File"%>
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
                        <table><tr><th>Document name</th><th>Uploaded By</th><th>File Preview</th><th>Decode File</th></tr>
                            <c:forEach items="${received}" var="i">
                                <tr><td>${i.docname}</td><td>${i.sharedby}</td>
                                    <c:set var="j" value="${i.filepath}" scope="session"></c:set>
                                    <td>
                                        <%
                                            try
                                            {
                                            String imgname=(String)session.getAttribute("j");
                                             BufferedImage bImage = ImageIO.read(new File(imgname));//give the path of an image
                                                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                                                    ImageIO.write( bImage, "jpg", baos );
                                                    baos.flush();
                                                    byte[] imageInByteArray = baos.toByteArray();
                                                    baos.close();                                   
                                                    String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
                                        
                                        %>
                                        <img style="width:50px;height: 40px;" src="data:image/jpg;base64, <%=b64%>"/>  
                                        <%
                                        }catch(Exception e)
                                            {
                                                e.printStackTrace();

                                                }
                                        %>
                                    </td>
                                   
                                    <td>
                                        
                                        <a href="decrypt.html?fpath=${i.filepath}&dname=${i.docname}" onclick="return check('${i.pass}','${i.docname}')" style="padding:15px 20px;background-color: firebrick;color:white;font-weight: bold;">Decode File</a>
                                        
                                    </td>
                                </tr>
                                
                                
                            </c:forEach>   
                        </table>   
                        

                        
                    </div>
                    
                   
 
                    <script>
                        
                        function check(pass,docname)
                        {
                        var v=prompt("Enter password","");
                        if(v==pass)
                        {
                            alert("file saved on Desktop as "+docname+".txt");
                            return true;
                        }
                        else
                        {
                           
                            alert("Password is Incorrect");
                             return false;
                        }
                    }
                        
                    </script>

        
        
    </body>
</html>
